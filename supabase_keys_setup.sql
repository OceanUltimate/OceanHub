-- OceanHub Supabase Key System
-- Versi produksi yang lebih rapi dan aman untuk SQL Editor / migration.

create extension if not exists pgcrypto;

create table if not exists public.keys (
    id uuid primary key default gen_random_uuid(),
    key text unique not null,
    tier text not null default 'Free',
    expiry_at timestamptz default null,
    max_redeems int default null,
    redeemed_count int not null default 0,
    redeemed_by text default null,
    created_at timestamptz not null default now()
);

alter table public.keys enable row level security;

drop policy if exists "deny_direct_access" on public.keys;
create policy "deny_direct_access" on public.keys
    for all
    to anon
    using (false);

create or replace function public.validate_key(input_key text, player_name text)
returns json
language plpgsql
security definer
set search_path = public
as $$
declare
    rec public.keys%rowtype;
    normalized_player text := nullif(trim(player_name), '');
begin
    select *
    into rec
    from public.keys
    where key = input_key;

    if not found then
        return json_build_object(
            'valid', false,
            'message', 'Key tidak ditemukan.'
        );
    end if;

    if rec.expiry_at is not null and rec.expiry_at < now() then
        return json_build_object(
            'valid', false,
            'message', 'Key expired pada ' || to_char(rec.expiry_at, 'DD Mon YYYY') || '.'
        );
    end if;

    if rec.max_redeems = 1 then
        if rec.redeemed_by is not null and rec.redeemed_by <> normalized_player then
            return json_build_object(
                'valid', false,
                'message', 'Key Already Use.'
            );
        end if;

        if rec.redeemed_by is null then
            update public.keys
            set redeemed_by = normalized_player,
                redeemed_count = coalesce(redeemed_count, 0) + 1
            where key = input_key;
        end if;
    else
        -- Untuk key multi-user, redeemed_count akan bertambah setiap validasi sukses.
        -- Kalau Anda ingin hitung unique player, sebaiknya pakai tabel log terpisah.
        update public.keys
        set redeemed_count = coalesce(redeemed_count, 0) + 1
        where key = input_key;
    end if;

    return json_build_object(
        'valid', true,
        'tier', rec.tier,
        'expiry', case
            when rec.expiry_at is null then 'Unlimited'
            else to_char(rec.expiry_at, 'DD Mon YYYY')
        end,
        'username', coalesce(normalized_player, 'Unknown'),
        'message', 'Key valid! Tier: ' || rec.tier
    );
end;
$$;

grant execute on function public.validate_key(text, text) to anon;

-- Contoh seed key
-- 1 player, unlimited waktu
-- insert into public.keys (key, tier, expiry_at, max_redeems)
-- values ('OCEAN-PREM-VIP-0001', 'Premium', null, 1);

-- 1 player, 30 hari
-- insert into public.keys (key, tier, expiry_at, max_redeems)
-- values ('OCEAN-PREM-VIP-0002', 'Premium', now() + interval '30 days', 1);

-- Unlimited player, unlimited waktu
-- insert into public.keys (key, tier, expiry_at, max_redeems)
-- values ('OCEAN-PREM-ALL-0003', 'Premium', null, null);

-- Unlimited player, 30 hari
-- insert into public.keys (key, tier, expiry_at, max_redeems)
-- values ('OCEAN-PREM-ALL-0004', 'Premium', now() + interval '30 days', null);

-- Contoh key test aktif 1 hari
-- insert into public.keys (key, tier, expiry_at, max_redeems)
-- values ('OCEAN-1234-1234-1234', 'Premium', now() + interval '1 day', 1);

-- Query test
-- select public.validate_key('OCEAN-1234-1234-1234', 'gameallprime');
-- select key, tier, redeemed_by, redeemed_count, expiry_at from public.keys order by created_at desc;

-- Reset test
-- update public.keys
-- set redeemed_by = null,
--     redeemed_count = 0;

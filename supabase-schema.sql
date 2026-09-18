-- Ejecutar en Supabase: Panel del proyecto → SQL Editor → New query → pegar y RUN

create table if not exists kpi_entries (
  id text primary key,              -- 'inicio' o 'YYYY-MM'
  label text,
  notes text,
  k1 jsonb default '{}',
  k2 jsonb default '{}',
  k3 jsonb default '{}',
  k4 jsonb default '{}',
  k5 jsonb default '{}',
  metas jsonb default '{}',
  updated_at timestamptz default now()
);

-- Habilitar Row Level Security (obligatorio en Supabase para exponer la tabla)
alter table kpi_entries enable row level security;

-- Acceso público de lectura y escritura (sin login), ya que se eligió
-- "cualquiera con el link" como modo de acceso.
create policy "public read" on kpi_entries
  for select using (true);

create policy "public insert" on kpi_entries
  for insert with check (true);

create policy "public update" on kpi_entries
  for update using (true) with check (true);

create policy "public delete" on kpi_entries
  for delete using (true);

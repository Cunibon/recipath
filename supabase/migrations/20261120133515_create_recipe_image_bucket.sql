insert into storage.buckets (id, name, public)
values ('recipe-image', 'recipe-image', true)
on conflict (id) do nothing;

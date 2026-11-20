drop policy if exists "Authenticated user can update images 6myfdo_0" on storage.objects;
drop policy if exists "Owner can update images" on storage.objects;

create policy "Owner can update images"
on storage.objects
as permissive
for update
to authenticated
using ((bucket_id = 'recipe-image'::text) and (owner_id = (select (auth.uid())::text)));

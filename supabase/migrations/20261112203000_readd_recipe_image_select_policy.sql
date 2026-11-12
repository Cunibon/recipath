-- Storage upsert (INSERT ... ON CONFLICT ... RETURNING *) requires a SELECT
-- policy on storage.objects to return the inserted/replaced row, otherwise
-- uploads with upsert: true fail with:
--   "new row violates row-level security policy for table objects"
create policy "Authenticated user can select images 6myfdo_0"
on "storage"."objects"
as permissive
for select
to authenticated
using ((bucket_id = 'recipe-image'::text));

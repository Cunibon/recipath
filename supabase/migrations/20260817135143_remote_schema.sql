
  create table "public"."grocery_tag" (
    "grocery_id" text not null,
    "tag_id" text not null,
    "updated_at" timestamp with time zone not null default now(),
    "owner_id" uuid not null default auth.uid(),
    "deleted" boolean
      );


alter table "public"."grocery_tag" enable row level security;


  create table "public"."quick_shopping" (
    "id" text not null,
    "done" boolean not null,
    "description" text not null,
    "created_at" timestamp with time zone not null default now(),
    "owner_id" uuid not null default auth.uid(),
    "updated_at" timestamp with time zone not null default now(),
    "deleted" boolean not null
      );


alter table "public"."quick_shopping" enable row level security;

alter table "public"."tag" add column "tag_type" text not null default 'Recipe'::text;

CREATE UNIQUE INDEX grocery_tag_pkey ON public.grocery_tag USING btree (grocery_id, tag_id);

CREATE INDEX quick_shopping_owner_id_idx ON public.quick_shopping USING hash (owner_id);

CREATE UNIQUE INDEX quick_shopping_pkey ON public.quick_shopping USING btree (id);

alter table "public"."grocery_tag" add constraint "grocery_tag_pkey" PRIMARY KEY using index "grocery_tag_pkey";

alter table "public"."quick_shopping" add constraint "quick_shopping_pkey" PRIMARY KEY using index "quick_shopping_pkey";

alter table "public"."grocery_tag" add constraint "grocery_tag_grocery_id_fkey" FOREIGN KEY (grocery_id) REFERENCES public.grocery(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."grocery_tag" validate constraint "grocery_tag_grocery_id_fkey";

alter table "public"."grocery_tag" add constraint "grocery_tag_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."grocery_tag" validate constraint "grocery_tag_owner_id_fkey";

alter table "public"."grocery_tag" add constraint "grocery_tag_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES public.tag(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."grocery_tag" validate constraint "grocery_tag_tag_id_fkey";

alter table "public"."quick_shopping" add constraint "quick_shopping_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."quick_shopping" validate constraint "quick_shopping_owner_id_fkey";

grant delete on table "public"."grocery_tag" to "anon";

grant insert on table "public"."grocery_tag" to "anon";

grant references on table "public"."grocery_tag" to "anon";

grant select on table "public"."grocery_tag" to "anon";

grant trigger on table "public"."grocery_tag" to "anon";

grant truncate on table "public"."grocery_tag" to "anon";

grant update on table "public"."grocery_tag" to "anon";

grant delete on table "public"."grocery_tag" to "authenticated";

grant insert on table "public"."grocery_tag" to "authenticated";

grant references on table "public"."grocery_tag" to "authenticated";

grant select on table "public"."grocery_tag" to "authenticated";

grant trigger on table "public"."grocery_tag" to "authenticated";

grant truncate on table "public"."grocery_tag" to "authenticated";

grant update on table "public"."grocery_tag" to "authenticated";

grant delete on table "public"."grocery_tag" to "service_role";

grant insert on table "public"."grocery_tag" to "service_role";

grant references on table "public"."grocery_tag" to "service_role";

grant select on table "public"."grocery_tag" to "service_role";

grant trigger on table "public"."grocery_tag" to "service_role";

grant truncate on table "public"."grocery_tag" to "service_role";

grant update on table "public"."grocery_tag" to "service_role";

grant delete on table "public"."quick_shopping" to "anon";

grant insert on table "public"."quick_shopping" to "anon";

grant references on table "public"."quick_shopping" to "anon";

grant select on table "public"."quick_shopping" to "anon";

grant trigger on table "public"."quick_shopping" to "anon";

grant truncate on table "public"."quick_shopping" to "anon";

grant update on table "public"."quick_shopping" to "anon";

grant delete on table "public"."quick_shopping" to "authenticated";

grant insert on table "public"."quick_shopping" to "authenticated";

grant references on table "public"."quick_shopping" to "authenticated";

grant select on table "public"."quick_shopping" to "authenticated";

grant trigger on table "public"."quick_shopping" to "authenticated";

grant truncate on table "public"."quick_shopping" to "authenticated";

grant update on table "public"."quick_shopping" to "authenticated";

grant delete on table "public"."quick_shopping" to "service_role";

grant insert on table "public"."quick_shopping" to "service_role";

grant references on table "public"."quick_shopping" to "service_role";

grant select on table "public"."quick_shopping" to "service_role";

grant trigger on table "public"."quick_shopping" to "service_role";

grant truncate on table "public"."quick_shopping" to "service_role";

grant update on table "public"."quick_shopping" to "service_role";


  create policy "Can insert owned grocery_tags"
  on "public"."grocery_tag"
  as permissive
  for insert
  to public
with check ((( SELECT auth.uid() AS uid) = owner_id));



  create policy "Dont sync if tag or groceries are deleted"
  on "public"."grocery_tag"
  as permissive
  for select
  to public
using (((EXISTS ( SELECT 1
   FROM public.tag b
  WHERE ((b.id = grocery_tag.tag_id) AND (b.deleted = false)))) AND (( SELECT auth.uid() AS uid) = owner_id)));



  create policy "can delete owned grocery_tags"
  on "public"."grocery_tag"
  as permissive
  for delete
  to public
using ((( SELECT auth.uid() AS uid) = owner_id));



  create policy "can update owned grocery_tags"
  on "public"."grocery_tag"
  as permissive
  for update
  to public
using ((( SELECT auth.uid() AS uid) = owner_id))
with check ((( SELECT auth.uid() AS uid) = owner_id));



  create policy "can access owned quick shoppings"
  on "public"."quick_shopping"
  as permissive
  for all
  to public
using ((( SELECT auth.uid() AS uid) = owner_id))
with check ((( SELECT auth.uid() AS uid) = owner_id));


CREATE TRIGGER set_updated_at_grocery_tag BEFORE UPDATE ON public.grocery_tag FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER set_updated_at_quick_shopping BEFORE UPDATE ON public.quick_shopping FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

drop policy "Authenticated user can select images 6myfdo_0" on "storage"."objects";



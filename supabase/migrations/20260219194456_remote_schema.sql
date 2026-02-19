


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    -- Set search path to an empty string to prevent schema resolution surprises
    SET search_path = '';
    
    -- Your existing function logic here
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at_column"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."grocery" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "normal_amount" double precision NOT NULL,
    "unit" "text" NOT NULL,
    "conversion_amount" double precision NOT NULL,
    "conversion_unit" "text" NOT NULL,
    "kcal" double precision,
    "fat" double precision,
    "carbs" double precision,
    "protein" double precision,
    "fiber" double precision,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "archived" boolean NOT NULL,
    "barcode" "text"
);


ALTER TABLE "public"."grocery" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."ingredient" (
    "id" "text" NOT NULL,
    "amount" double precision NOT NULL,
    "unit" "text" NOT NULL,
    "grocery_id" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."ingredient" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe" (
    "id" "text" NOT NULL,
    "title" "text" NOT NULL,
    "servings" bigint,
    "image_name" "text",
    "archived" boolean NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "parent" "text"
);


ALTER TABLE "public"."recipe" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe_shopping" (
    "id" "text" NOT NULL,
    "date" bigint NOT NULL,
    "recipe_id" "text" NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."recipe_shopping" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe_statistic" (
    "id" "text" NOT NULL,
    "start_date" bigint NOT NULL,
    "end_date" bigint NOT NULL,
    "recipe_id" "text" NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "servings" bigint
);


ALTER TABLE "public"."recipe_statistic" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe_step" (
    "id" "text" NOT NULL,
    "description" "text" NOT NULL,
    "index" bigint NOT NULL,
    "recipe_id" "text" NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "minutes" bigint
);


ALTER TABLE "public"."recipe_step" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe_step_ingredient" (
    "step_id" "text" NOT NULL,
    "ingredient_id" "text" NOT NULL,
    "index" bigint NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."recipe_step_ingredient" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."recipe_tag" (
    "recipe_id" "text" NOT NULL,
    "tag_id" "text" NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "deleted" boolean NOT NULL
);


ALTER TABLE "public"."recipe_tag" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."shopping" (
    "id" "text" NOT NULL,
    "done" boolean NOT NULL,
    "count" bigint NOT NULL,
    "ingredient_id" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted" boolean NOT NULL
);


ALTER TABLE "public"."shopping" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."storage" (
    "ingredient_id" "text" NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "id" "text" NOT NULL,
    "deleted" boolean NOT NULL
);


ALTER TABLE "public"."storage" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tag" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text" NOT NULL,
    "color" bigint NOT NULL,
    "deleted" boolean NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."tag" OWNER TO "postgres";


ALTER TABLE ONLY "public"."grocery"
    ADD CONSTRAINT "grocery_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ingredient"
    ADD CONSTRAINT "ingredient_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe"
    ADD CONSTRAINT "recipe_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_shopping"
    ADD CONSTRAINT "recipe_shopping_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_statistic"
    ADD CONSTRAINT "recipe_statistic_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_step_ingredient"
    ADD CONSTRAINT "recipe_step_ingredient_pkey" PRIMARY KEY ("step_id", "ingredient_id");



ALTER TABLE ONLY "public"."recipe_step"
    ADD CONSTRAINT "recipe_step_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."recipe_tag"
    ADD CONSTRAINT "recipe_tag_pkey" PRIMARY KEY ("recipe_id", "tag_id");



ALTER TABLE ONLY "public"."shopping"
    ADD CONSTRAINT "shopping_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."storage"
    ADD CONSTRAINT "storage_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_pkey" PRIMARY KEY ("id");



CREATE INDEX "grocery_owner_id_idx" ON "public"."grocery" USING "hash" ("owner_id");



CREATE INDEX "ingredient_owner_id_idx" ON "public"."ingredient" USING "hash" ("owner_id");



CREATE INDEX "recipe_owner_id_idx" ON "public"."recipe" USING "hash" ("owner_id");



CREATE INDEX "recipe_step_ingredient_owner_id_idx" ON "public"."recipe_step_ingredient" USING "hash" ("owner_id");



CREATE INDEX "recipe_step_owner_id_idx" ON "public"."recipe_step" USING "hash" ("owner_id");



CREATE INDEX "shopping_owner_id_idx" ON "public"."shopping" USING "hash" ("owner_id");



CREATE INDEX "storage_owner_id_idx" ON "public"."storage" USING "hash" ("owner_id");



CREATE OR REPLACE TRIGGER "set_updated_at_grocery" BEFORE UPDATE ON "public"."grocery" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_ingredient" BEFORE UPDATE ON "public"."ingredient" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_recipe" BEFORE UPDATE ON "public"."recipe" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_recipe_step" BEFORE UPDATE ON "public"."recipe_step" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_recipe_step_ingredient" BEFORE UPDATE ON "public"."recipe_step_ingredient" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_recipe_tag" BEFORE UPDATE ON "public"."recipe_tag" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_shopping" BEFORE UPDATE ON "public"."shopping" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_storage" BEFORE UPDATE ON "public"."storage" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_tag" BEFORE UPDATE ON "public"."tag" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



ALTER TABLE ONLY "public"."grocery"
    ADD CONSTRAINT "grocery_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ingredient"
    ADD CONSTRAINT "ingredient_grocery_id_fkey" FOREIGN KEY ("grocery_id") REFERENCES "public"."grocery"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ingredient"
    ADD CONSTRAINT "ingredient_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe"
    ADD CONSTRAINT "recipe_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_shopping"
    ADD CONSTRAINT "recipe_shopping_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_shopping"
    ADD CONSTRAINT "recipe_shopping_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_statistic"
    ADD CONSTRAINT "recipe_statistic_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_statistic"
    ADD CONSTRAINT "recipe_statistic_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_step_ingredient"
    ADD CONSTRAINT "recipe_step_ingredient_ingredient_id_fkey" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredient"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_step_ingredient"
    ADD CONSTRAINT "recipe_step_ingredient_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_step_ingredient"
    ADD CONSTRAINT "recipe_step_ingredient_step_id_fkey" FOREIGN KEY ("step_id") REFERENCES "public"."recipe_step"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_step"
    ADD CONSTRAINT "recipe_step_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_step"
    ADD CONSTRAINT "recipe_step_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_tag"
    ADD CONSTRAINT "recipe_tag_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_tag"
    ADD CONSTRAINT "recipe_tag_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."recipe_tag"
    ADD CONSTRAINT "recipe_tag_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "public"."tag"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shopping"
    ADD CONSTRAINT "shopping_ingredient_id_fkey" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredient"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shopping"
    ADD CONSTRAINT "shopping_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."storage"
    ADD CONSTRAINT "storage_ingredient_id_fkey1" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredient"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."storage"
    ADD CONSTRAINT "storage_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



CREATE POLICY "Can insert owned recipe_tags" ON "public"."recipe_tag" FOR INSERT WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "Dont sync if tag or recipe are deleted" ON "public"."recipe_tag" FOR SELECT USING (((EXISTS ( SELECT 1
   FROM "public"."tag" "b"
  WHERE (("b"."id" = "recipe_tag"."tag_id") AND ("b"."deleted" = false)))) AND (( SELECT "auth"."uid"() AS "uid") = "owner_id")));



CREATE POLICY "can access owned groceries" ON "public"."grocery" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned ingredients" ON "public"."ingredient" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned recipe step ingredients" ON "public"."recipe_step_ingredient" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned recipe steps" ON "public"."recipe_step" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned recipes" ON "public"."recipe" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned shopping" ON "public"."recipe_shopping" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned shopping items" ON "public"."shopping" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned statistics" ON "public"."recipe_statistic" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned storage items" ON "public"."storage" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can access owned tags" ON "public"."tag" USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can delete owned recipe_tags" ON "public"."recipe_tag" FOR DELETE USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



CREATE POLICY "can update owned recipe_tags" ON "public"."recipe_tag" FOR UPDATE USING ((( SELECT "auth"."uid"() AS "uid") = "owner_id")) WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "owner_id"));



ALTER TABLE "public"."grocery" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ingredient" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_shopping" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_statistic" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_step" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_step_ingredient" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."recipe_tag" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."shopping" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."storage" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tag" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

























































































































































GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "service_role";


















GRANT ALL ON TABLE "public"."grocery" TO "anon";
GRANT ALL ON TABLE "public"."grocery" TO "authenticated";
GRANT ALL ON TABLE "public"."grocery" TO "service_role";



GRANT ALL ON TABLE "public"."ingredient" TO "anon";
GRANT ALL ON TABLE "public"."ingredient" TO "authenticated";
GRANT ALL ON TABLE "public"."ingredient" TO "service_role";



GRANT ALL ON TABLE "public"."recipe" TO "anon";
GRANT ALL ON TABLE "public"."recipe" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_shopping" TO "anon";
GRANT ALL ON TABLE "public"."recipe_shopping" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_shopping" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_statistic" TO "anon";
GRANT ALL ON TABLE "public"."recipe_statistic" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_statistic" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_step" TO "anon";
GRANT ALL ON TABLE "public"."recipe_step" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_step" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_step_ingredient" TO "anon";
GRANT ALL ON TABLE "public"."recipe_step_ingredient" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_step_ingredient" TO "service_role";



GRANT ALL ON TABLE "public"."recipe_tag" TO "anon";
GRANT ALL ON TABLE "public"."recipe_tag" TO "authenticated";
GRANT ALL ON TABLE "public"."recipe_tag" TO "service_role";



GRANT ALL ON TABLE "public"."shopping" TO "anon";
GRANT ALL ON TABLE "public"."shopping" TO "authenticated";
GRANT ALL ON TABLE "public"."shopping" TO "service_role";



GRANT ALL ON TABLE "public"."storage" TO "anon";
GRANT ALL ON TABLE "public"."storage" TO "authenticated";
GRANT ALL ON TABLE "public"."storage" TO "service_role";



GRANT ALL ON TABLE "public"."tag" TO "anon";
GRANT ALL ON TABLE "public"."tag" TO "authenticated";
GRANT ALL ON TABLE "public"."tag" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































drop extension if exists "pg_net";


  create policy "Authenticated user can select images 6myfdo_0"
  on "storage"."objects"
  as permissive
  for select
  to authenticated
using ((bucket_id = 'recipe-image'::text));



  create policy "Authenticated user can update images 6myfdo_0"
  on "storage"."objects"
  as permissive
  for update
  to authenticated
using ((bucket_id = 'recipe-image'::text));



  create policy "Authenticated user can upload image 6myfdo_0"
  on "storage"."objects"
  as permissive
  for insert
  to authenticated
with check ((bucket_id = 'recipe-image'::text));




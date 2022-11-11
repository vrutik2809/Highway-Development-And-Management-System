set search_path to public;

drop table if exists highways cascade;

CREATE TABLE "highways" (
  "id" SERIAL PRIMARY KEY,
  "length" numeric,-- in km
  "build_year" int,
  "last_renovation_year" int,
  "start_location_id" int,
  "end_location_id" int,
  "cost" int,
  "type" varchar(2) check (type in ('NH', 'SH'))
);

drop table if exists locations cascade;

CREATE TABLE "locations" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "state_id" int
);

drop table if exists states cascade;

CREATE TABLE "states" (
  "id" SERIAL PRIMARY KEY, 
  "name" varchar
);

drop table if exists state_highways cascade;

CREATE TABLE "state_highways" (
  "state_id" int, 
  "highway_id" int
);

drop table if exists construction_companies cascade;

CREATE TABLE "construction_companies" (
  "id" SERIAL PRIMARY KEY, 
  "name" varchar,
  "user_id" int
);

drop table if exists civil_engineers cascade;

CREATE TABLE "civil_engineers" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "company_id" int
);

drop table if exists contracts_information cascade;

CREATE TABLE "contracts_information" (
  "id" SERIAL PRIMARY KEY,
  "highway_id" int,
  "company_id" int,
  "type" varchar check (type in ('new', 'renovation')),
  "construction_status" varchar check (construction_status in ('running', 'completed'))
);

drop table if exists contract_related_civil_engineers cascade;

CREATE TABLE "contract_related_civil_engineers" (
  "civil_engineer_id" int, 
  "contract_id" int
);

drop table if exists problems cascade;

CREATE TABLE "problems" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar,
  "issue_date" date,
  "resolved_date" date,
  "highway_id" int
);

drop table if exists notices cascade;

CREATE TABLE "notices" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar
);

drop table if exists tenders cascade;

CREATE TABLE "tenders" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar,
  "proposed_by_company_id" int,
  "proposed_for_highway_id" int
);

drop table if exists users cascade;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "type" varchar check (type in ('govt_auth', 'company_auth'))
);

drop table if exists forums cascade;

CREATE TABLE "forums" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "created_at" timestamp,
  "created_by" int
);

drop table if exists replies cascade;

CREATE TABLE "replies" (
  "id" SERIAL PRIMARY KEY,
  "forum_id" int,
  "user_id" int,
  "description" varchar
);

drop table if exists mail_subscribers cascade;

CREATE TABLE "mail_subscribers" (
  "id" SERIAL PRIMARY KEY, 
  "email" varchar
);

ALTER TABLE "highways"
DROP CONSTRAINT IF EXISTS "highways_start_location_id_fkey",
ADD
  FOREIGN KEY ("start_location_id") REFERENCES "locations" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "highways"
DROP CONSTRAINT IF EXISTS "highways_end_location_id_fkey",
ADD
  FOREIGN KEY ("end_location_id") REFERENCES "locations" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "locations"
DROP CONSTRAINT IF EXISTS "locations_state_id_fkey",
ADD
  FOREIGN KEY ("state_id") REFERENCES "states" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "state_highways"
DROP CONSTRAINT IF EXISTS "state_highways_state_id_fkey",
ADD
  FOREIGN KEY ("state_id") REFERENCES "states" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "state_highways"
DROP CONSTRAINT IF EXISTS "state_highways_highway_id_fkey",
ADD
  FOREIGN KEY ("highway_id") REFERENCES "highways" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "civil_engineers"
DROP CONSTRAINT IF EXISTS "civil_engineers_company_id_fkey",
ADD
  FOREIGN KEY ("company_id") REFERENCES "construction_companies" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "contracts_information"
DROP CONSTRAINT IF EXISTS "contracts_information_highway_id_fkey",
ADD
  FOREIGN KEY ("highway_id") REFERENCES "highways" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "contracts_information"
DROP CONSTRAINT IF EXISTS "contracts_information_company_id_fkey",
ADD
  FOREIGN KEY ("company_id") REFERENCES "construction_companies" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "contract_related_civil_engineers"
DROP CONSTRAINT IF EXISTS "contract_related_civil_engineers_civil_engineer_id_fkey",
ADD
  FOREIGN KEY ("civil_engineer_id") REFERENCES "civil_engineers" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "contract_related_civil_engineers"
DROP CONSTRAINT IF EXISTS "contract_related_civil_engineers_contract_id_fkey",
ADD
  FOREIGN KEY ("contract_id") REFERENCES "contracts_information" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "problems"
DROP CONSTRAINT IF EXISTS "problems_highway_id_fkey",
ADD
  FOREIGN KEY ("highway_id") REFERENCES "highways" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "tenders"
DROP CONSTRAINT IF EXISTS "tenders_proposed_by_company_id_fkey",
ADD
  FOREIGN KEY ("proposed_by_company_id") REFERENCES "construction_companies" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "tenders"
DROP CONSTRAINT IF EXISTS "tenders_proposed_for_highway_id_fkey",
ADD
  FOREIGN KEY ("proposed_for_highway_id") REFERENCES "highways" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "forums"
DROP CONSTRAINT IF EXISTS "forums_created_by_fkey",
ADD
  FOREIGN KEY ("created_by") REFERENCES "users" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "replies"
DROP CONSTRAINT IF EXISTS "replies_forum_id_fkey",
ADD
  FOREIGN KEY ("forum_id") REFERENCES "forums" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "replies"
DROP CONSTRAINT IF EXISTS "replies_user_id_fkey",
ADD
  FOREIGN KEY ("user_id") REFERENCES "users" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE "construction_companies"
DROP CONSTRAINT IF EXISTS "construction_companies_user_id_fkey",
ADD
  FOREIGN KEY ("user_id") REFERENCES "users" ("id")
  ON DELETE CASCADE
  ON UPDATE CASCADE;
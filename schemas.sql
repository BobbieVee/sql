sqlite> .schema
CREATE TABLE "actors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  "gender" char(1) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "directors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "directors_genres" (
  "director_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL,
  "prob" float DEFAULT NULL
);
CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "movies_directors" (
  "director_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL
);
CREATE TABLE "movies_genres" (
  "movie_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL
);
CREATE TABLE "roles" (
  "actor_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL,
  "role" varchar(100) DEFAULT NULL
);



CREATE INDEX "actors_idx_first_name" ON "actors" ("first_name");
CREATE INDEX "directors_idx_first_name" ON "directors" ("first_name");
CREATE INDEX "directors_idx_last_name" ON "directors" ("last_name");
CREATE INDEX "movies_directors_idx_director_id" ON "movies_directors" ("director_id");
CREATE INDEX "movies_directors_idx_movie_id" ON "movies_directors" ("movie_id");
CREATE INDEX "roles_idx_role" ON "roles" ("role");
CREATE INDEX "directors_genres_idx_director_id" ON "directors_genres" ("director_id");
CREATE INDEX "directors_genres_idx_genre" ON "directors_genres" ("genre");
CREATE INDEX "actors_idx_last_name" ON "actors" ("last_name");
CREATE INDEX "movies_idx_name" ON "movies" ("name");
CREATE INDEX "roles_idx_actor_id" ON "roles" ("actor_id");
CREATE INDEX "roles_idx_movie_id" ON "roles" ("movie_id");

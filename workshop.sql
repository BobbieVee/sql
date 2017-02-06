
Birthyear:
SELECT name, year 
FROM movies
WHERE year = 1982;

1982:
SELECT count(name), year 
FROM movies
WHERE year = 1982;

Stacktors:
SELECT first_name, last_name
FROM actors
WHERE last_name LIKE '%stack%';

Fame Name Game:
SELECT first_name, count(first_name) AS occurences
FROM actors
GROUP BY first_name
ORDER BY count(first_name) DESC
LIMIT 10;

SELECT last_name, count(last_name) AS occurences
FROM actors
GROUP BY last_name
ORDER BY count(last_name) DESC
LIMIT 10;

SELECT last_name, first_name
FROM actors
GROUP BY last_name AND first_name
ORDER BY count(last_name) DESC
LIMIT 10;

Prolific:
SELECT first_name, last_name, count(*) as num_roles
FROM actors
INNER JOIN roles
ON actors.id=roles.actor_id
GROUP BY actors.id
ORDER BY num_roles DESC
LIMIT 100
;

Bottom of the Barrel:

SELECT genre, count(genre) as num_movies_by_genres
FROM movies_genres
INNER JOIN movies
ON movies.id=movies_genres.movie_id
GROUP BY genre
ORDER BY num_movies_by_genres 
;

BraveHeart:

SELECT first_name, last_name
FROM actors a
INNER JOIN roles r
ON a.id=r.actor_id
INNER JOIN movies m
ON m.id=r.movie_id
WHERE m.name = "Braveheart" AND m.year = 1995
ORDER BY last_name
;


Leap Noir:

SELECT first_name, last_name, m.name, m.year
FROM directors d
INNER JOIN movies_directors md
ON d.id=md.director_id
INNER JOIN movies m
ON m.id=md.movie_id
INNER JOIN movies_genres mg 
ON m.id = mg.movie_id
WHERE mg.genre = "Film-Noir" AND m.year%4 = 0
ORDER BY m.name
;

Bacon:

SELECT first_name, last_name, r.role, m.name, mg.genre , m.id
FROM actors a
INNER JOIN roles r  
ON a.id = r.actor_id
INNER JOIN movies m 
ON m.id = r.movie_id
INNER JOIN movies_genres mg 
ON m.id = mg.movie_id
WHERE first_name = "Kevin" AND last_name = "Bacon" AND mg.genre = "Drama"
;

SELECT  m.name, first_name, last_name
FROM actors a
INNER JOIN roles r  
ON a.id = r.actor_id
INNER JOIN movies m 
ON m.id = r.movie_id
WHERE m.id IN (
	SELECT m.id
	FROM actors a
	INNER JOIN roles r  
	ON a.id = r.actor_id
	INNER JOIN movies m 
	ON m.id = r.movie_id
	INNER JOIN movies_genres mg 
	ON m.id = mg.movie_id
	WHERE first_name = "Kevin" AND last_name = "Bacon" AND mg.genre = "Drama"
) AND first_name != "Kevin" AND last_name != "Bacon"
LIMIT 100
;

Immortal:

SELECT first_name, last_name, m.name, m.year, m.id
FROM actors a
INNER JOIN roles r
ON a.id = r.actor_id
INNER JOIN movies m
ON r.movie_id = m.id
WHERE m.year < 1900
LIMIT 100;

SELECT first_name, last_name, a.id as id
FROM actors a
INNER JOIN roles r
ON a.id = r.actor_id
INNER JOIN movies m
ON r.movie_id = m.id
WHERE m.year > 2000 AND a.id IN(
	SELECT a.id
	FROM actors a
	INNER JOIN roles r
	ON a.id = r.actor_id
	INNER JOIN movies m
	ON r.movie_id = m.id
	WHERE m.year < 1900
)
GROUP BY a.id
;

SELECT first_name, last_name, a.id as id
FROM actors a
INNER JOIN roles r
ON a.id = r.actor_id
INNER JOIN movies m
ON r.movie_id = m.id
WHERE m.year > 2000 
INTERSECT 
SELECT first_name, last_name, a.id
FROM actors a
INNER JOIN roles r
ON a.id = r.actor_id
INNER JOIN movies m
ON r.movie_id = m.id
WHERE m.year < 1900

GROUP BY a.id
ORDER BY last_name
;

Busy Filming:

SELECT first_name, last_name, m.name, COUNT(r.role)
FROM actors a
INNER JOIN roles r
ON a.id = r.actor_id
INNER JOIN movies m 
ON m.id = r.movie_id
WHERE m.year > 1990
GROUP BY m.id

LIMIT 100;

SELECT m.name, m.year, r.role, first_name, last_name, count(r.role)
FROM movies m
INNER JOIN roles r 
ON m.id = r.movie_id
INNER JOIN actors a 
ON a.id = r.actor_id
WHERE m.year = 2001
GROUP BY m.id, a.id
;

Females:

SELECT m.year, count(m.year)
FROM actors a
INNER JOIN roles r 
ON a.id = r.actor_id
INNER JOIN movies m
ON m.id = r.movie_id
WHERE a.gender != 'M'
GROUP BY m.year

LIMIT 100;





















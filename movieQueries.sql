-- ==========================================
-- MOVIE RATING ANALYSIS SQL PROJECT
-- Author: Animesh Halder
-- Database: PostgreSQL
-- ==========================================


-- Q1. What are the top 5 highest-rated movies based on rating?

SELECT 
    m.title,
    AVG(r.rating) AS average_rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY average_rating DESC
LIMIT 5;



-- Q2. Which movies have been rated above 9 by users from India?

SELECT 
    m.title,
    u.name AS user_name,
    r.rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id
JOIN users u
ON r.user_id = u.user_id
WHERE u.country = 'India'
AND r.rating > 9;



-- Q3. How many movies belong to each genre?

SELECT 
    g.genre_name,
    COUNT(mg.movie_id) AS total_movies
FROM genres g
JOIN movie_genres mg
ON g.genre_id = mg.genre_id
GROUP BY g.genre_name;



-- Q4. Which actor has acted in the highest number of movies?

SELECT 
    a.name AS actor_name,
    COUNT(ma.movie_id) AS movie_count
FROM actors a
JOIN movie_actors ma
ON a.actor_id = ma.actor_id
GROUP BY a.name
ORDER BY movie_count DESC
LIMIT 1;



-- Q5. What is the average rating given by each user?

SELECT 
    u.name AS user_name,
    AVG(r.rating) AS average_rating
FROM users u
JOIN ratings r
ON u.user_id = r.user_id
GROUP BY u.name;



-- Q6. Assign a release rank to each movie using its release year.

SELECT
    title,
    release_year,
    RANK() OVER(
        ORDER BY release_year
    ) AS release_rank
FROM movies;



-- Q7. Classify movies as Classic, Modern, or New based on release year.

SELECT
    title,
    release_year,

    CASE

        WHEN release_year < 2000 
        THEN 'Classic'

        WHEN release_year BETWEEN 2000 AND 2020
        THEN 'Modern'

        ELSE 'New'

    END AS movie_category

FROM movies;



-- Q8. Recommended Movie of the Day
-- Based on highest average rating

SELECT
    m.title,
    AVG(r.rating) AS average_rating

FROM movies m

JOIN ratings r
ON m.movie_id = r.movie_id

GROUP BY m.title

ORDER BY average_rating DESC

LIMIT 1;



-- ==========================================
-- END OF ANALYSIS QUERIES
-- ==========================================
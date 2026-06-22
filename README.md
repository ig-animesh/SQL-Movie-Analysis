# 🎬 Movie Rating Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing a movie database using SQL.

The dataset contains information about movies, genres, actors, users, and ratings.  
The objective of this project is to solve real-world analysis questions using SQL queries and extract meaningful insights.


---

# 🗄️ Database Tables

The database consists of the following tables:

- Movies
- Genres
- Movie_Genres
- Actors
- Movie_Actors
- Users
- Ratings


---

# 📊 SQL Analysis & Solutions


## 1. What are the top 5 highest-rated movies based on rating?

### SQL Query:

```sql
SELECT 
    m.title,
    AVG(r.rating) AS average_rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY average_rating DESC
LIMIT 5;
```

### Concepts Used:

- JOIN
- AVG()
- GROUP BY
- ORDER BY
- LIMIT


---

## 2. Which movies have been rated above 9 by users from India?

### SQL Query:

```sql
SELECT 
    m.title,
    u.name,
    r.rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id
JOIN users u
ON r.user_id = u.user_id
WHERE u.country = 'India'
AND r.rating > 9;
```

### Concepts Used:

- Multiple Table JOIN
- WHERE Condition
- Filtering


---

## 3. How many movies belong to each genre?

### SQL Query:

```sql
SELECT 
    g.genre_name,
    COUNT(mg.movie_id) AS total_movies
FROM genres g
JOIN movie_genres mg
ON g.genre_id = mg.genre_id
GROUP BY g.genre_name;
```

### Concepts Used:

- JOIN
- COUNT()
- GROUP BY


---

## 4. Which actor has acted in the highest number of movies?

### SQL Query:

```sql
SELECT 
    a.name,
    COUNT(ma.movie_id) AS total_movies
FROM actors a
JOIN movie_actors ma
ON a.actor_id = ma.actor_id
GROUP BY a.name
ORDER BY total_movies DESC
LIMIT 1;
```

### Concepts Used:

- JOIN
- COUNT()
- Sorting
- LIMIT


---

## 5. What is the average rating given by each user?

### SQL Query:

```sql
SELECT 
    u.name,
    AVG(r.rating) AS average_rating
FROM users u
JOIN ratings r
ON u.user_id = r.user_id
GROUP BY u.name;
```

### Concepts Used:

- JOIN
- AVG()
- GROUP BY


---

## 6. Assign a release rank to each movie using its release year.

### SQL Query:

```sql
SELECT
    title,
    release_year,
    RANK() OVER(
        ORDER BY release_year
    ) AS release_rank
FROM movies;
```

### Concepts Used:

- Window Function
- RANK()


---

## 7. Classify movies as Classic, Modern, or New based on release year.

### SQL Query:

```sql
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
```

### Concepts Used:

- CASE Statement
- Conditional Logic


---

## 8. Recommended Movie of the Day

### SQL Query:

```sql
SELECT 
    m.title,
    AVG(r.rating) AS average_rating

FROM movies m

JOIN ratings r
ON m.movie_id = r.movie_id

GROUP BY m.title

ORDER BY average_rating DESC

LIMIT 1;
```

### Concepts Used:

- Aggregation
- Ranking
- Recommendation Logic


---

# 📈 Key Insights Generated

Using SQL analysis, this project helped identify:

- Highest-rated movies
- Highly rated movies by Indian users
- Genre popularity
- Most featured actors
- User rating behaviour
- Movie ranking based on release year
- Movie recommendation logic


---

# 🚀 Future Improvements

- Add more movie records
- Connect database with a frontend application
- Create Power BI/Tableau dashboard
- Build an ML-based movie recommendation system



---

# 🛠️ Tech Stack

- PostgreSQL
- SQL
- pgAdmin 4


---

# 👨‍💻 Author

**Animesh Halder**

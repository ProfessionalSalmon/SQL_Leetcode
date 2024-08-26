-- name
WITH t1 AS (
    SELECT
        user_id,
        COUNT(movie_id) AS movie_num
    FROM
        MovieRating
    GROUP BY
        user_id
),
t2 AS (
    SELECT
        TOP 1 name AS results
    FROM
        Users u
        JOIN t1 ON u.user_id = t1.user_id
    ORDER BY
        movie_num DESC,
        name
) 

-- movie title
,
t3 AS (
    SELECT
        movie_id,
        AVG(rating * 1.0) AS avg_rating
    FROM
        MovieRating
    WHERE
        MONTH(created_at) = 2
        AND YEAR(created_at) = 2020
    GROUP BY
        movie_id
),
t4 AS (
    SELECT
        TOP 1 title AS results
    FROM
        Movies m
        JOIN t3 ON m.movie_id = t3.movie_id
    ORDER BY
        avg_rating DESC,
        title
) 

-- Union name and title
SELECT
    results
FROM
    t2
UNION
ALL
SELECT
    results
FROM
    t4;
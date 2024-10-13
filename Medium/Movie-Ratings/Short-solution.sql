-- Top User
WITH t1 AS (
    SELECT
        TOP 1 name AS results
    FROM
        MovieRating m
        JOIN users u ON m.user_id = u.user_id
    GROUP BY
        name
    ORDER BY
        COUNT(*) DESC,
        name
),

-- Top movie
t2 AS (
    SELECT
        TOP 1 title AS results
    FROM
        MovieRating m
        JOIN Movies mo ON m.movie_id = mo.movie_id
    WHERE
        MONTH(created_at) = 2
        AND YEAR(created_at) = 2020
    GROUP BY
        title
    ORDER BY
        AVG(rating * 1.0) DESC,
        title
)
SELECT
    *
FROM
    t1
UNION
ALL
SELECT
    *
FROM
    t2;
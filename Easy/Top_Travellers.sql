WITH t1 AS (
    SELECT
        name,
        u.id,
        SUM(distance) AS travelled_distance
    FROM
        Users u
        JOIN Rides r ON u.id = r.user_id
    GROUP BY
        name,
        u.id
)
SELECT
    u.name,
    COALESCE(travelled_distance, 0) AS travelled_distance
FROM
    Users u
    LEFT JOIN t1 ON u.name = t1.name
    AND u.id = t1.id
ORDER BY
    travelled_distance DESC,
    name;
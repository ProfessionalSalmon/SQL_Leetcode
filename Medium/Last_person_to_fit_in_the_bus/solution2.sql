-- maximum total weight

WITH accumulative_weight AS (
    SELECT
        person_name,
        SUM(weight) OVER (
            ORDER BY
                turn 
            ROWS BETWEEN UNBOUNDED PRECEDING
                AND CURRENT ROW
        ) AS total_weight
    FROM
        Queue
)
SELECT
    person_name
FROM
    accumulative_weight
WHERE
    total_weight IN (
        SELECT
            MAX(total_weight)
        FROM
            accumulative_weight
        WHERE
            total_weight <= 1000
    )
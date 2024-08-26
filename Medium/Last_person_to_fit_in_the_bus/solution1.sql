-- order total weight descendingly

SELECT
    TOP 1 person_name
FROM
    (
        SELECT
            person_name,
            weight,
            SUM(weight) OVER (
                ORDER BY
                    turn
                ROWS BETWEEN UNBOUNDED PRECEDING
                    AND CURRENT ROW
            ) AS total_weight
        FROM
            Queue
    ) AS accumulative_weight
WHERE
    total_weight <= 1000
ORDER BY
    total_weight DESC;
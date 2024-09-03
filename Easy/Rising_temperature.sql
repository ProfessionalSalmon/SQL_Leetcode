WITH t1 AS (
    SELECT
        *,
        LAG(recordDate) OVER (
            ORDER BY
                recordDate
        ) AS previous_day,
        LAG(temperature) OVER (
            ORDER BY
                recordDate
        ) AS previous_temp
    FROM
        Weather
)
SELECT
    id
FROM
    t1
WHERE
    temperature > previous_temp
    AND DATEDIFF(day, previous_day, recordDate) = 1;
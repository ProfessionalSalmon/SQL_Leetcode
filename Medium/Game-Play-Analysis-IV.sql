-- find next day
WITH t1 AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER (
            PARTITION BY player_id
            ORDER BY
                event_date
        ) AS next
    FROM
        Activity
),
-- first login
t2 AS (
    SELECT
        player_id,
        MIN(event_date) AS min_date
    FROM
        Activity
    GROUP BY
        player_id
)
SELECT
    ROUND(
        SUM(
            CASE
                WHEN DATEDIFF(day, event_date, next) = 1 THEN 1.0
                ELSE 0
            END
        ) / COUNT(DISTINCT t1.player_id),
        2
    ) AS fraction
FROM
    t1
    JOIN t2 ON t1.player_id = t2.player_id
    AND event_date = min_date;
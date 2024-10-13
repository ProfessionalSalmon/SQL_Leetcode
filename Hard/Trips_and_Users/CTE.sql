-- CTE
WITH t1 AS (
    SELECT
        *
    FROM
        Trips
    WHERE
        client_id IN (
            SELECT
                users_id
            FROM
                Users
            WHERE
                banned = 'No'
        )
        AND driver_id IN (
            SELECT
                users_id
            FROM
                Users
            WHERE
                banned = 'No'
        )
)
SELECT
    request_at AS Day,
    ROUND(
        SUM(
            CASE
                WHEN status LIKE 'cancelled%' THEN 1.0
                ELSE 0.0
            END
        ) / COUNT(*),
        2
    ) AS 'Cancellation Rate'
FROM
    t1
WHERE
    request_at BETWEEN '2013-10-01'
    AND '2013-10-03'
GROUP BY
    request_at;
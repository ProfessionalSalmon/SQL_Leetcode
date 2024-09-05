-- JOIN two times

WITH t1 AS (
    SELECT
        client_id,
        driver_id,
        status,
        (
            CASE
                WHEN status IN ('cancelled_by_client', 'cancelled_by_driver') THEN 1.0
                ELSE 0
            END
        ) AS status_count,
        request_at
    FROM
        Trips
        LEFT JOIN Users u1 ON client_id = u1.users_id
        LEFT JOIN Users u2 ON driver_id = u2.users_id
    WHERE
        (
            request_at BETWEEN '2013-10-01'
            AND '2013-10-03'
        )
        AND u1.banned = 'No'
        AND u2.banned = 'No'
)
SELECT
    request_at AS Day,
    ROUND(SUM(status_count) / COUNT(*), 2) AS 'Cancellation Rate'
FROM
    t1
GROUP BY
    request_at;
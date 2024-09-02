WITH t1 AS (
    SELECT
        requester_id,
        COUNT(*) AS request
    FROM
        RequestAccepted
    GROUP BY
        requester_id
),
t2 AS (
    SELECT
        accepter_id,
        COUNT(*) AS accept
    FROM
        RequestAccepted
    GROUP BY
        accepter_id
)
SELECT
    TOP 1 COALESCE(requester_id, accepter_id) AS id,
    COALESCE(request, 0) + COALESCE(accept, 0) AS num
FROM
    t1 FULL
    OUTER JOIN t2 ON requester_id = accepter_id
ORDER BY
    num DESC;
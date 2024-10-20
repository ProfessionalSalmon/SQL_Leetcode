WITH t1 AS(
    SELECT
        a.id
    FROM
        Stadium a,
        Stadium b,
        Stadium c
    WHERE
        a.id = b.id - 1
        AND b.id = c.id -1
        AND a.people >= 100
        AND b.people >= 100
        AND c.people >= 100
    UNION
    SELECT
        b.id
    FROM
        Stadium a,
        Stadium b,
        Stadium c
    WHERE
        a.id = b.id - 1
        AND b.id = c.id -1
        AND a.people >= 100
        AND b.people >= 100
        AND c.people >= 100
    UNION
    SELECT
        c.id
    FROM
        Stadium a,
        Stadium b,
        Stadium c
    WHERE
        a.id = b.id - 1
        AND b.id = c.id -1
        AND a.people >= 100
        AND b.people >= 100
        AND c.people >= 100
)
SELECT
    *
FROM
    Stadium
WHERE
    id IN (
        SELECT
            id
        FROM
            t1
    )
ORDER BY
    visit_date;
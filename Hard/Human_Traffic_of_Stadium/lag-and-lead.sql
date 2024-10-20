WITH t1 AS (
    SELECT
        id,
        visit_date,
        LAG(people) OVER (
            ORDER BY
                id
        ) AS prev,
        LAG(people, 2) OVER (
            ORDER BY
                id
        ) AS prev_2,
        people,
        LEAD(people) OVER (
            ORDER BY
                id
        ) AS next,
        LEAD(people, 2) OVER (
            ORDER BY
                id
        ) AS next_2
    FROM
        Stadium
)
SELECT
    id,
    visit_date,
    people
FROM
    t1
WHERE
    (people >= 100)
    AND (
        (
            prev >= 100
            AND next >= 100
        )
        OR (
            prev_2 >= 100
            AND prev >= 100
        )
        OR (
            next >= 100
            AND next_2 >= 100
        )
    )
ORDER BY
    visit_date;
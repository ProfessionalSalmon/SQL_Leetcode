WITH t1 AS (
    SELECT
        id,
        student,
        LAG(student) OVER (
            ORDER BY
                id
        ) AS lag,
        LEAD(student) OVER (
            ORDER BY
                id
        ) AS lead
    FROM
        Seat
)
SELECT
    id,
    (
        CASE
            WHEN id IN (
                SELECT
                    COUNT(*) AS id
                FROM
                    Seat
            )
            AND id % 2 = 1 THEN student
            WHEN id NOT IN (
                SELECT
                    COUNT(*) AS id
                FROM
                    Seat
            )
            AND id % 2 = 1 THEN lead
            ELSE lag
        END
    ) AS student
FROM
    t1;
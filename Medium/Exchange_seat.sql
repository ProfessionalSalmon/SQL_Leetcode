SELECT
    id,
    (
        CASE
            WHEN id % 2 = 1
            AND LEAD(student) OVER (
                ORDER BY
                    id
            ) IS NULL THEN student
            WHEN id % 2 = 1
            AND LEAD(student) OVER (
                ORDER BY
                    id
            ) IS NOT NULL THEN LEAD(student) OVER (
                ORDER BY
                    id
            )
            ELSE LAG(student) OVER (
                ORDER BY
                    id
            )
        END
    ) AS student
FROM
    Seat;
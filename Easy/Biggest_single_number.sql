WITH t1 AS (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING
        COUNT(*) = 1
)
SELECT
    MAX(num) AS num
FROM
    t1;
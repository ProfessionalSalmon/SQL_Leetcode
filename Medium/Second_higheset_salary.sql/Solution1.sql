-- use DENSE_RANK()

WITH t1 AS (
    SELECT
        salary
    FROM
        Employee
    UNION
    SELECT
        NULL
)
SELECT
    SecondHighestSalary
FROM
    (
        SELECT
            salary AS SecondHighestSalary,
            DENSE_RANK() OVER (
                ORDER BY
                    salary DESC
            ) AS rank
        FROM
            t1
    ) AS t2
WHERE
    rank = 2;
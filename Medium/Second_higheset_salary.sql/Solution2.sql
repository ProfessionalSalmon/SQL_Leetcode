-- use DISTINCT to remove duplicate salary

WITH t1 AS (
    SELECT
        null AS salary
    UNION
    SELECT
        DISTINCT salary
    FROM
        Employee
),
t2 AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY
                salary DESC
        ) AS row
    FROM
        t1
)
SELECT
    salary AS SecondHighestSalary
FROM
    t2
WHERE
    row = 2;
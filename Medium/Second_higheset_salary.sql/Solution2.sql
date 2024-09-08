-- if you don't know what DENSE_RANK() is and you don't wanna know

WITH t0 AS (
    SELECT
        DISTINCT salary
    FROM
        Employee
),
t1 AS (
    SELECT
        salary,
        (
            ROW_NUMBER() OVER (
                ORDER BY
                    salary DESC
            )
        ) AS row_number
    FROM
        t0
)
SELECT
    TOP 1 SecondHighestSalary
FROM
    (
        SELECT
            DISTINCT t1.salary AS SecondHighestSalary
        FROM
            t1
            JOIN Employee e ON t1.salary = e.salary
        WHERE
            row_number = 2
        UNION
        SELECT
            null
    ) AS t2
ORDER BY
    SecondHighestSalary DESC;
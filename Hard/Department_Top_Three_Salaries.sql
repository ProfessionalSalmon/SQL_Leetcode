WITH salary_order AS (
    SELECT
        name,
        salary,
        departmentID,
        DENSE_RANK() OVER (
            partition by departmentID
            ORDER BY
                salary DESC
        ) AS rank
    FROM
        Employee
)
SELECT
    d.name AS Department,
    s.name AS Employee,
    salary AS Salary
FROM
    Department d
    JOIN salary_order s ON departmentID = id
WHERE
    rank <= 3
ORDER BY
    d.name,
    salary DESC;
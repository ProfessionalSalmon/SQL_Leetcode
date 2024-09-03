SELECT
    DISTINCT s.name
FROM
    SalesPerson s
    LEFT JOIN Orders o ON s.sales_id = o.sales_id
    LEFT JOIN Company c ON o.com_id = c.com_id
WHERE
    s.sales_id NOT IN (
        SELECT
            sales_id
        FROM
            Company c
            JOIN Orders o ON c.com_id = o.com_id
        WHERE
            name = 'RED'
    )
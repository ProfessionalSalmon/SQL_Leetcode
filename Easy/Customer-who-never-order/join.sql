SELECT
    name AS Customers
FROM
    Customers c
    LEFT JOIN Orders o ON c.id = customerId
WHERE
    o.id IS NULL;
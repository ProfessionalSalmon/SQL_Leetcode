SELECT
    product_name,
    SUM(unit) AS unit
FROM
    Products p
    JOIN Orders o ON p.product_id = o.product_id
WHERE
    DATEPART(month, order_date) = 2
    AND DATEPART(year, order_date) = 2020
GROUP BY
    product_name
HAVING
    SUM(unit) >= 100;
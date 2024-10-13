SELECT
    p.product_id,
    product_name
FROM
    Product p
    LEFT JOIN Sales s ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    product_name
HAVING
    DATEPART(month, MAX(sale_date)) BETWEEN 1
    AND 3
    AND DATEPART(year, MAX(sale_date)) = 2019
    AND DATEPART(month, MIN(sale_date)) BETWEEN 1
    AND 3
    AND DATEPART(year, MIN(sale_date)) = 2019;
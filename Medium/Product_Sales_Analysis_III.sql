WITH t1 AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
)
SELECT
    t1.product_id,
    first_year,
    quantity,
    price
FROM
    t1
    JOIN Sales s ON t1.product_id = s.product_id
    AND first_year = year;
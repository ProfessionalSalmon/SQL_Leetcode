WITH unique_lat_lon AS (
    SELECT
        lat,
        lon
    FROM
        Insurance
    GROUP BY
        lat,
        lon
    HAVING
        COUNT(*) = 1
),
same2015 AS (
    SELECT
        tiv_2015
    FROM
        Insurance
    GROUP BY
        tiv_2015
    HAVING
        COUNT(*) >= 2
)
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance i
    JOIN unique_lat_lon u ON i.lat = u.lat
    AND i.lon = u.lon
    JOIN same2015 s ON i.tiv_2015 = s.tiv_2015;
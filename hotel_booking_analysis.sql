CREATE DATABASE hotel_booking_analysis;

USE hotel_booking_analysis;
SELECT * 
FROM hotel_bookings
LIMIT 5;
-- Q1. How many total bookings are present in the dataset?
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;
-- Q2. Which hotel has the highest number of bookings?
SELECT
    hotel,
    COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY hotel
ORDER BY total_bookings DESC;
DESCRIBE hotel_bookings;
SELECT * 
FROM hotel_bookings
LIMIT 5;
SHOW TABLES;
SELECT COUNT(*) AS total_rows
FROM hotel_bookings;
USE hotel_booking_analysis;

DESCRIBE hotel_bookings;
SELECT *
FROM hotel_bookings
LIMIT 5;
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;
SELECT COUNT(*) AS total_rows
FROM hotel_bookings;
SELECT
    hotel,
    COUNT(*) AS bookings
FROM hotel_bookings
GROUP BY hotel;
SELECT *
FROM hotel_bookings
LIMIT 5;
SELECT COUNT(*) AS total_rows
FROM hotel_bookings_cleaned;

DROP TABLE hotel_bookings_cleaned;


CREATE TABLE hotel_bookings_cleaned (
    hotel VARCHAR(50),
    is_canceled INT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month VARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    adults INT,
    children DECIMAL(5,2),
    babies INT,
    meal VARCHAR(20),
    country VARCHAR(10),
    market_segment VARCHAR(50),
    distribution_channel VARCHAR(50),
    is_repeated_guest INT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type VARCHAR(10),
    assigned_room_type VARCHAR(10),
    booking_changes INT,
    deposit_type VARCHAR(30),
    days_in_waiting_list INT,
    customer_type VARCHAR(50),
    adr DECIMAL(10,2),
    required_car_parking_spaces INT,
    total_of_special_requests INT,
    reservation_status VARCHAR(30),
    reservation_status_date DATE,
    arrival_date DATE,
    total_stay INT,
    total_guests DECIMAL(10,2),
    estimated_revenue DECIMAL(12,2),
    lead_time_group VARCHAR(30)
);
DESCRIBE hotel_bookings_cleaned;
SELECT COUNT(*) AS total_rows
FROM hotel_bookings_cleaned;
SHOW TABLES;
SELECT * FROM hotel_bookings_cleaned LIMIT 10;
-- ============================================================
-- HOTEL BOOKING & REVENUE ANALYSIS
-- COMPLETE SQL ANALYSIS
-- ============================================================


-- ============================================================
-- 1. SELECT
-- ============================================================

-- Q1. Display all records from the hotel booking table.

SELECT *
FROM hotel_bookings_cleaned;


-- Q2. Display the hotel, arrival year and ADR of each booking.

SELECT hotel, arrival_date_year, adr
FROM hotel_bookings_cleaned;


-- Q3. Display only the first 10 bookings.

SELECT *
FROM hotel_bookings_cleaned
LIMIT 10;


-- ============================================================
-- 2. DISTINCT
-- ============================================================

-- Q4. What different hotel types are present in the dataset?

SELECT DISTINCT hotel
FROM hotel_bookings_cleaned;


-- Q5. What different market segments are present?

SELECT DISTINCT market_segment
FROM hotel_bookings_cleaned;


-- Q6. What different customer types are present?

SELECT DISTINCT customer_type
FROM hotel_bookings_cleaned;


-- ============================================================
-- 3. WHERE
-- ============================================================

-- Q7. How many bookings were cancelled?

SELECT COUNT(*) AS cancelled_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 1;


-- Q8. How many bookings were successfully completed?

SELECT COUNT(*) AS completed_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 0;


-- Q9. How many bookings have an ADR greater than 100?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE adr > 100;


-- Q10. How many bookings have a lead time greater than 100 days?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE lead_time > 100;


-- ============================================================
-- 4. AND / OR
-- ============================================================

-- Q11. How many completed bookings have an ADR greater than 100?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
AND adr > 100;


-- Q12. How many bookings have more than 2 adults and ADR greater than 100?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE adults > 2
AND adr > 100;


-- Q13. How many bookings came from either Online TA or Offline TA?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE market_segment = 'Online TA'
OR market_segment = 'Offline TA';


-- ============================================================
-- 5. IN
-- ============================================================

-- Q14. How many bookings came from Online TA or Offline TA?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE market_segment IN ('Online TA', 'Offline TA');


-- Q15. Display bookings from City Hotel or Resort Hotel.

SELECT *
FROM hotel_bookings_cleaned
WHERE hotel IN ('City Hotel', 'Resort Hotel');


-- ============================================================
-- 6. BETWEEN
-- ============================================================

-- Q16. How many bookings have an ADR between 50 and 100?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE adr BETWEEN 50 AND 100;


-- Q17. How many bookings have a lead time between 30 and 90 days?

SELECT COUNT(*) AS bookings
FROM hotel_bookings_cleaned
WHERE lead_time BETWEEN 30 AND 90;


-- ============================================================
-- 7. LIKE
-- ============================================================

-- Q18. Find countries whose names start with the letter 'A'.

SELECT DISTINCT country
FROM hotel_bookings_cleaned
WHERE country LIKE 'A%';


-- Q19. Find market segments containing the word 'Online'.

SELECT DISTINCT market_segment
FROM hotel_bookings_cleaned
WHERE market_segment LIKE '%Online%';


-- ============================================================
-- 8. NULL VALUES
-- ============================================================

-- Q20. How many bookings have missing country information?

SELECT COUNT(*) AS missing_country
FROM hotel_bookings_cleaned
WHERE country IS NULL;


-- Q21. How many bookings have missing children information?

SELECT COUNT(*) AS missing_children
FROM hotel_bookings_cleaned
WHERE children IS NULL;


-- ============================================================
-- 9. AGGREGATE FUNCTIONS
-- ============================================================

-- Q22. How many total bookings are there?

SELECT COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned;


-- Q23. What is the average ADR?

SELECT AVG(adr) AS average_adr
FROM hotel_bookings_cleaned;


-- Q24. What is the highest ADR?

SELECT MAX(adr) AS highest_adr
FROM hotel_bookings_cleaned;


-- Q25. What is the lowest ADR?

SELECT MIN(adr) AS lowest_adr
FROM hotel_bookings_cleaned;


-- Q26. What is the total ADR value?

SELECT SUM(adr) AS total_adr
FROM hotel_bookings_cleaned;


-- Q27. What is the average lead time?

SELECT AVG(lead_time) AS average_lead_time
FROM hotel_bookings_cleaned;


-- ============================================================
-- 10. GROUP BY
-- ============================================================

-- Q28. How many bookings are there for each hotel?

SELECT hotel, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY hotel;


-- Q29. What is the average ADR for each hotel?

SELECT hotel, AVG(adr) AS average_adr
FROM hotel_bookings_cleaned
GROUP BY hotel;


-- Q30. How many bookings are there for each market segment?

SELECT market_segment, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY market_segment;


-- Q31. How many bookings are there for each customer type?

SELECT customer_type, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY customer_type;


-- Q32. How many bookings are there for each arrival year?

SELECT arrival_date_year, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY arrival_date_year;


-- ============================================================
-- 11. ORDER BY
-- ============================================================

-- Q33. Arrange hotels by their number of bookings from highest to lowest.

SELECT hotel, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY hotel
ORDER BY total_bookings DESC;


-- Q34. Arrange hotels by average ADR from highest to lowest.

SELECT hotel, AVG(adr) AS average_adr
FROM hotel_bookings_cleaned
GROUP BY hotel
ORDER BY average_adr DESC;


-- Q35. Display the 10 countries with the highest number of bookings.

SELECT country, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY country
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 12. HAVING
-- ============================================================

-- Q36. Which countries have more than 100 bookings?

SELECT country, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY country
HAVING COUNT(*) > 100;


-- Q37. Which market segments have more than 1,000 bookings?

SELECT market_segment, COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY market_segment
HAVING COUNT(*) > 1000;


-- Q38. Which hotels have an average ADR greater than 100?

SELECT hotel, AVG(adr) AS average_adr
FROM hotel_bookings_cleaned
GROUP BY hotel
HAVING AVG(adr) > 100;


-- ============================================================
-- 13. DISTINCT COUNT
-- ============================================================

-- Q39. How many different countries are represented in the bookings?

SELECT COUNT(DISTINCT country) AS different_countries
FROM hotel_bookings_cleaned;


-- Q40. How many different market segments are there?

SELECT COUNT(DISTINCT market_segment) AS different_segments
FROM hotel_bookings_cleaned;


-- ============================================================
-- 14. CASE
-- ============================================================

-- Q41. Categorize bookings as Cancelled or Completed.

SELECT
    CASE
        WHEN is_canceled = 1 THEN 'Cancelled'
        ELSE 'Completed'
    END AS booking_status,
    COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY booking_status;


-- Q42. Categorize bookings based on ADR.

SELECT
    CASE
        WHEN adr < 50 THEN 'Low'
        WHEN adr BETWEEN 50 AND 100 THEN 'Medium'
        ELSE 'High'
    END AS adr_category,
    COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY adr_category;


-- ============================================================
-- 15. DATE EXTRACTION
-- ============================================================

-- Q43. Extract the year from the arrival date.

SELECT YEAR(arrival_date) AS arrival_year
FROM hotel_bookings_cleaned;


-- Q44. Extract the month from the arrival date.

SELECT MONTH(arrival_date) AS arrival_month
FROM hotel_bookings_cleaned;


-- Q45. Extract the day from the arrival date.

SELECT DAY(arrival_date) AS arrival_day
FROM hotel_bookings_cleaned;


-- Q46. How many bookings were made in each arrival year?

SELECT
    YEAR(arrival_date) AS arrival_year,
    COUNT(*) AS total_bookings
FROM hotel_bookings_cleaned
GROUP BY YEAR(arrival_date)
ORDER BY arrival_year;


-- ============================================================
-- 16. REVENUE ANALYSIS
-- ============================================================

-- Q47. What is the estimated room revenue from completed bookings?

SELECT
    SUM(adr * (stays_in_weekend_nights + stays_in_week_nights))
    AS estimated_revenue
FROM hotel_bookings_cleaned
WHERE is_canceled = 0;


-- Q48. What is the estimated revenue for each hotel?

SELECT
    hotel,
    SUM(adr * (stays_in_weekend_nights + stays_in_week_nights))
    AS estimated_revenue
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY hotel
ORDER BY estimated_revenue DESC;


-- Q49. Which arrival year generated the highest estimated revenue?

SELECT
    arrival_date_year,
    SUM(adr * (stays_in_weekend_nights + stays_in_week_nights))
    AS estimated_revenue
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY arrival_date_year
ORDER BY estimated_revenue DESC;


-- ============================================================
-- 17. CANCELLATION ANALYSIS
-- ============================================================

-- Q50. How many cancelled bookings are there for each hotel?

SELECT
    hotel,
    COUNT(*) AS cancelled_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 1
GROUP BY hotel;


-- Q51. How many completed bookings are there for each hotel?

SELECT
    hotel,
    COUNT(*) AS completed_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY hotel;


-- Q52. Which market segment has the most cancelled bookings?

SELECT
    market_segment,
    COUNT(*) AS cancelled_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 1
GROUP BY market_segment
ORDER BY cancelled_bookings DESC;


-- ============================================================
-- 18. SUBQUERY
-- ============================================================

-- Q53. Which bookings have an ADR greater than the overall average ADR?

SELECT *
FROM hotel_bookings_cleaned
WHERE adr > (
    SELECT AVG(adr)
    FROM hotel_bookings_cleaned
);


-- Q54. Which hotels have an average ADR greater than the overall average ADR?

SELECT hotel, AVG(adr) AS average_adr
FROM hotel_bookings_cleaned
GROUP BY hotel
HAVING AVG(adr) > (
    SELECT AVG(adr)
    FROM hotel_bookings_cleaned
);


-- ============================================================
-- 19. CTE
-- ============================================================

-- Q55. Find the total bookings for each hotel using a CTE.

WITH hotel_bookings AS (
    SELECT
        hotel,
        COUNT(*) AS total_bookings
    FROM hotel_bookings_cleaned
    GROUP BY hotel
)
SELECT *
FROM hotel_bookings
ORDER BY total_bookings DESC;


-- ============================================================
-- 20. WINDOW FUNCTION
-- ============================================================

-- Q56. Rank hotels based on their total number of bookings.

SELECT
    hotel,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM hotel_bookings_cleaned
GROUP BY hotel;


-- Q57. Show each hotel's booking count along with the overall booking count.

SELECT
    hotel,
    COUNT(*) AS total_bookings,
    SUM(COUNT(*)) OVER () AS overall_bookings
FROM hotel_bookings_cleaned
GROUP BY hotel;


-- ============================================================
-- 21. FINAL BUSINESS ANALYSIS
-- ============================================================

-- Q58. Which hotel has the highest number of completed bookings?

SELECT
    hotel,
    COUNT(*) AS completed_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY hotel
ORDER BY completed_bookings DESC
LIMIT 1;


-- Q59. Which market segment generates the most completed bookings?

SELECT
    market_segment,
    COUNT(*) AS completed_bookings
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY market_segment
ORDER BY completed_bookings DESC
LIMIT 1;


-- Q60. Which room type has the highest average ADR?

SELECT
    reserved_room_type,
    AVG(adr) AS average_adr
FROM hotel_bookings_cleaned
WHERE is_canceled = 0
GROUP BY reserved_room_type
ORDER BY average_adr DESC
LIMIT 1;

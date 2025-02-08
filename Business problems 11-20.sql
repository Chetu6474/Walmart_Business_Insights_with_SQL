---11. Identify the highest revenue month in the last two years.
WITH monthly_revenue AS (
    SELECT 
        TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'YYYY-MM') AS month,
        SUM(unit_price * quantity) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) IN (2022, 2023)
    GROUP BY month
)
SELECT month, revenue
FROM monthly_revenue
ORDER BY revenue DESC
LIMIT 1;

---12. Find the correlation between discount percentage and total revenue.
SELECT CORR(profit_margin, unit_price * quantity) AS correlation
FROM walmart;


---13. Rank branches based on the number of unique customers.
SELECT Branch, COUNT(DISTINCT invoice_id) AS unique_customers,
       RANK() OVER (ORDER BY COUNT(DISTINCT invoice_id) DESC) AS rank
FROM walmart
GROUP BY Branch;

---14. Identify the time period with the highest number of transactions.
SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS transaction_count
FROM walmart
GROUP BY time_of_day
ORDER BY transaction_count DESC
LIMIT 1;


---15. Determine seasonal sales trends by quarter.
SELECT 
    EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) AS year,
    EXTRACT(QUARTER FROM TO_DATE(date, 'DD/MM/YY')) AS quarter,
    SUM(unit_price * quantity) AS total_sales
FROM walmart
GROUP BY year, quarter
ORDER BY year, quarter;


---16. Identify the impact of customer ratings on total sales revenue per branch.

WITH branch_ratings AS (
    SELECT 
        Branch,
        AVG(rating) AS avg_rating,
        SUM(unit_price * quantity) AS total_revenue
    FROM walmart
    GROUP BY Branch
)
SELECT Branch, avg_rating, total_revenue,
       RANK() OVER (ORDER BY avg_rating DESC) AS rating_rank,
       RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM branch_ratings
ORDER BY rating_rank;

---17. Determine the most profitable time of the day for each branch.

WITH profit_per_shift AS (
    SELECT 
        Branch,
        CASE 
            WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_shift,
        SUM(unit_price * quantity * profit_margin) AS total_profit,
        RANK() OVER (PARTITION BY Branch ORDER BY SUM(unit_price * quantity * profit_margin) DESC) AS rnk
    FROM walmart
    GROUP BY Branch, time_shift
)
SELECT Branch, time_shift, total_profit
FROM profit_per_shift
WHERE rnk = 1;



---18. Identify the top 3 customer segments based on spending behavior.

WITH customer_spending AS (
    SELECT 
        invoice_id, 
        SUM(unit_price * quantity) AS order_value
    FROM walmart
    GROUP BY invoice_id
),
customer_segments AS (
    SELECT 
        invoice_id,
        order_value,
        CASE 
            WHEN order_value > 500 THEN 'High-Value Customer'
            WHEN order_value BETWEEN 200 AND 500 THEN 'Mid-Value Customer'
            ELSE 'Low-Value Customer'
        END AS customer_segment
    FROM customer_spending
)
SELECT customer_segment, COUNT(*) AS num_customers
FROM customer_segments
GROUP BY customer_segment
ORDER BY num_customers DESC;



---19. Identify the Most Profitable Product Category in Each City
WITH category_profit AS (
    SELECT 
        City,
        category,
        SUM(unit_price * quantity * profit_margin) AS total_profit,
        RANK() OVER (PARTITION BY City ORDER BY SUM(unit_price * quantity * profit_margin) DESC) AS rnk
    FROM walmart
    GROUP BY City, category
)
SELECT City, category AS most_profitable_category, total_profit
FROM category_profit
WHERE rnk = 1;



---20. Analyze the Relationship Between Payment Method and Profitability per Branch
WITH payment_profit AS (
    SELECT 
        Branch,
        payment_method,
        SUM(unit_price * quantity * profit_margin) AS total_profit
    FROM walmart
    GROUP BY Branch, payment_method
)
SELECT 
    Branch, 
    payment_method, 
    total_profit,
    RANK() OVER (PARTITION BY Branch ORDER BY total_profit DESC) AS rnk
FROM payment_profit
WHERE total_profit > 0
ORDER BY Branch, total_profit DESC;

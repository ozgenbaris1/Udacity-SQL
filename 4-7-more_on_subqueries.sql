-- Use DATE_TRUNC to pull month level information about the first order ever placed in the orders table.

SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
FROM orders;

-- Use the results of the previous query to find only the orders that took place in the same month and year as the first order, and then pull the average for each type of paper qty in this month

SELECT	DATE_TRUNC('month', occurred_at),
		AVG(standard_qty) AS avg_standard,
		AVG(gloss_qty) AS avg_gloss,
		AVG(poster_qty) AS avg_poster
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (
	SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
	FROM orders)
GROUP BY 1;
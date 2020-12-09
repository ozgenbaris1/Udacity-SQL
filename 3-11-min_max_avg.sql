-- When was the earliest order ever placed? You only need to return the date.

SELECT MIN(occured_at)
FROM orders;

-- Try performing the same query as in question 1 without using an aggregation function.

SELECT occured_at
FROM orders
ORDER BY occured_at
LIMIT 1;

-- When did the most recent (latest) web_event occur?

SELECT MAX(occured_at)
FROM web_events;

-- Try to perform the result of the previous query without using an aggregation function.

SELECT occured_at
FROM web_events
ORDER BY occured_at DESC
LIMIT 1;

-- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.

SELECT 	AVG(standard_qty) AS mean_standard, AVG(gloss_qty) AS mean_gloss,
		AVG(poster_qty) AS mean_poster, AVG(standard_amt_usd) AS mean_standard_usd,
		AVG(gloss_amt_usd) AS mean_gloss_usd, AVG(poster_amt_usd) AS mean_poster_usd
FROM orders;



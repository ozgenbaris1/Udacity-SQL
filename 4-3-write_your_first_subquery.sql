-- Find the number of events that occur for each day for each channel.

SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) num_event
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;

-- Create a subquery that simply provides all of the data from your first query.

SELECT * 
FROM 
	(SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) num_event
	 FROM web_events
	 GROUP BY 1,2) sub

-- Now find an average number of events for each channel. Since you broke out by day earlier, this is giving you an average per day.

SELECT channel, AVG(num_event)
FROM 
	(SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) num_event
	 FROM web_events
	 GROUP BY 1,2) sub
GROUP BY 1
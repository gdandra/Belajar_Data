WITH customer_last_purchase AS (
	SELECT
		customerkey,
		cleaned_named,
		orderdate,
		ROW_NUMBER() OVER(PARTITION BY customerkey ORDER BY orderdate DESC) AS ROW_NUMBER,
		first_purchase_date,
		cohort_year
	FROM
		cohort_analysis
),
churned_customer AS (
	SELECT
		customerkey,
		cleaned_named,
		orderdate AS last_purchase_date,
		first_purchase_date,
		CASE
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales WHERE orderdate = '2024-04-20') - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Activate'
		END AS customer_status,
		cohort_year
	FROM
		customer_last_purchase
	WHERE
		ROW_NUMBER = 1
		AND first_purchase_date < (SELECT MAX(orderdate) FROM sales WHERE orderdate = '2024-04-20') - INTERVAL '6 months'
)
SELECT 
	cohort_year,
	customer_status,
	COUNT(customerkey) AS num_customers,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
	ROUND(COUNT(customerkey) / SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year), 2) AS status_pct
FROM churned_customer 
GROUP BY 
	cohort_year,
	customer_status
	
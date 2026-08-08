-- Credit Card Launch Analytics


-- 1. Adoption Rate (Overall)
SELECT 
    ROUND(AVG(CASE WHEN adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM marketing_response;

-- 2. Adoption Rate by Region
SELECT 
    c.region,
    ROUND(AVG(CASE WHEN m.adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM customers c
JOIN marketing_response m ON c.customer_id = m.customer_id
GROUP BY c.region
ORDER BY adoption_rate DESC;

-- 3. Average Monthly Spend by Occupation
SELECT 
    c.occupation,
    ROUND(AVG(t.monthly_spend)::numeric, 2) AS avg_monthly_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.occupation
ORDER BY avg_monthly_spend DESC;

-- 4. Segmentation by Credit Score Brackets
SELECT 
    CASE 
        WHEN credit_score < 580 THEN 'Poor'
        WHEN credit_score BETWEEN 580 AND 669 THEN 'Fair'
        WHEN credit_score BETWEEN 670 AND 739 THEN 'Good'
        WHEN credit_score BETWEEN 740 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END AS credit_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(CASE WHEN m.adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM credit_history ch
JOIN marketing_response m ON ch.customer_id = m.customer_id
GROUP BY credit_segment
ORDER BY adoption_rate DESC;

-- 5. Income vs Adoption Correlation (Income Brackets)
SELECT 
    CASE 
        WHEN income < 40000 THEN 'Low Income'
        WHEN income BETWEEN 40000 AND 80000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_bracket,
    COUNT(*) AS customer_count,
    ROUND(AVG(CASE WHEN m.adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM customers c
JOIN marketing_response m ON c.customer_id = m.customer_id
GROUP BY income_bracket
ORDER BY adoption_rate DESC;

-- 6. Default History vs Adoption
SELECT 
    ch.default_history,
    COUNT(*) AS customer_count,
    ROUND(AVG(CASE WHEN m.adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM credit_history ch
JOIN marketing_response m ON ch.customer_id = m.customer_id
GROUP BY ch.default_history;

-- 7. Top 10 High-Spend Customers (Potential Premium Segment)
SELECT 
    c.customer_id,
    c.age,
    c.income,
    c.occupation,
    SUM(t.monthly_spend) AS total_spend,
    m.adopted
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN marketing_response m ON c.customer_id = m.customer_id
GROUP BY c.customer_id, c.age, c.income, c.occupation, m.adopted
ORDER BY total_spend DESC
LIMIT 10;

-- 8. Region-Wise Average Spend and Adoption
SELECT 
    c.region,
    ROUND(AVG(t.monthly_spend)::numeric, 2) AS avg_spend,
    ROUND(AVG(CASE WHEN m.adopted THEN 1 ELSE 0 END)::numeric, 2) AS adoption_rate
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN marketing_response m ON c.customer_id = m.customer_id
GROUP BY c.region
ORDER BY avg_spend DESC;

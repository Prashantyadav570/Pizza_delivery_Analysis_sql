-- Calculate the average delivery time during weekends.
SELECT
    ROUND(AVG(Delivery_Duration), 2) AS Avg_Weekend_Delivery_Time
FROM pizza_delivery
WHERE Is_Weekend = 1;


-- Find the busiest hour of the day 
select
Hour(order_time) As Order_Hours,
count(*) As Total_Orders
from pizza_delivery
group by Order_Hours
order by Total_Orders Desc
Limit 1;

-- Find Average delivery Time by order Hour
SELECT
    HOUR(Order_Time) AS Order_Hour,
    ROUND(AVG(Delivery_Duration), 2) AS Avg_Delivery_Time
FROM pizza_delivery
GROUP BY Order_Hour
ORDER BY Order_Hour;

-- Find the number of delayed orders by month 
Select order_month as Order_Month,
count(Delayed_status) as Delayed_Orders
from pizza_delivery
where Delayed_status = 'Delayed'
Group by Order_Month;

-- Find the number of orders placed each day
select dayname(Order_date) as Day_Name,
count(*) as Total_Orders
from pizza_delivery
Group by Day_Name 
order by Total_Orders Desc;

-- Rank restaurants by average delivery time using RANK()
SELECT
    Restaurant_Name,
    ROUND(AVG(Delivery_Duration), 2) AS Avg_Delivery_Time,
    RANK() OVER (ORDER BY AVG(Delivery_Duration) ASC) AS Restaurant_Rank
FROM pizza_delivery
GROUP BY Restaurant_Name;

-- find the restaurant whose average delivery time is above the overall average 
SELECT
    Restaurant_Name,
    ROUND(AVG(Delivery_Duration), 2) AS Avg_Delivery_Time
FROM pizza_delivery
GROUP BY Restaurant_Name
HAVING AVG(Delivery_Duration) >
(
    SELECT AVG(Delivery_Duration)
    FROM pizza_delivery
);



-- Create a report showing:
-- Restaurant Name
-- Total Orders
-- Average Delivery Time
-- Average Delay
-- Delay Percentage
-- Average Distance
SELECT
    Restaurant_Name,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Delivery_Duration), 2) AS Avg_Delivery_Time,
    ROUND(AVG(Delay), 2) AS Avg_Delay,
    CONCAT(
        ROUND(
            COUNT(CASE
                    WHEN Delayed_status = 'Delayed' THEN 1
                  END) * 100.0 / COUNT(*),
            2
        ),
        '%'
    ) AS Delay_Percentage,
    ROUND(AVG(Distance), 2) AS Avg_Distance
FROM pizza_delivery
GROUP BY Restaurant_Name
ORDER BY Total_Orders DESC;

-- Which restaurant perform best during peak hour
SELECT
    Restaurant_Name,
    ROUND(AVG(Delivery_Duration),2) AS Avg_Delivery_Time
FROM pizza_delivery
WHERE Is_Peak_Hour = 1
GROUP BY Restaurant_Name
ORDER BY Avg_Delivery_Time
LIMIT 1;


-- Executive KPI Report
SELECT
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Delivery_Duration),2) AS Avg_Delivery_Time,
    ROUND(AVG(Delay),2) AS Avg_Delay,
    CONCAT(
        ROUND(
            COUNT(CASE
                WHEN Delayed_status='Delayed'
                THEN 1
            END)*100.0/COUNT(*),2
        ),
        '%'
    ) AS Delay_Percentage,
    ROUND(AVG(Distance),2) AS Avg_Distance,
    COUNT(DISTINCT Restaurant_Name) AS Total_Restaurants
    from pizza_delivery;
-- Resturant Analysis

-- Resturant wise order 
select Restaurant_name, 
count(*) as No_of_orders
from pizza_delivery
Group by Restaurant_Name;

-- Average Delivery time 
select Restaurant_name,
Round(avg(Delivery_Duration),2) as Avg_Delivery_duration_min
from pizza_delivery
group by Restaurant_Name;

-- Slow Restaurant 
select Restaurant_name,
Round(avg(Delivery_Duration),2) as Avg_Delivery_duration_min
from pizza_delivery
group by Restaurant_Name
Order by 2 Desc
Limit 5;

-- Pizza Anlaysis 
-- Most Order pizza
select Pizza_Type,
count(*)
from pizza_delivery
Group by Pizza_Type
Order by 2 Desc;


-- pizza size distribution
select Pizza_Size,
Count(*)
from pizza_delivery
Group by 1
order by 2 desc;

-- Time Analysis
-- Order by hours
SELECT
    HOUR(Order_Time) AS Order_Hour,
    COUNT(*) AS Total_Orders
FROM pizza_delivery
GROUP BY Order_Hour
ORDER BY Order_Hour;

-- Order by month
select Order_month,
Count(*) as Total_Orders
from pizza_delivery
Group by Order_Month;


-- Traffic Analysis
-- Average Delivery Time 
Select Traffic_Level,
Round(Avg(Delivery_Duration),2) Avg_delivery_time
From pizza_delivery
Group by Traffic_Level;

-- Delay by Traffic
select 
Traffic_level,
count(*) No_Delayed
from pizza_delivery
Where Delayed_status = "Delayed"
Group by Traffic_Level
Order by 2 desc;

-- Distance Analysis
-- Average Distance
Select 
concat(Round(AVg(Distance),2),' km') as Avg_Distance_km
From pizza_delivery;

-- Long Distance 
Select * from pizza_delivery
Where Distance > 8;

-- Payment Analysis
-- Payment Method 
Select Payment_Method,
count(*) Total_orders
from pizza_delivery
Group by Payment_Method;

-- Weekend Analysis
select Is_Weekend,
Avg(Delivery_Duration) Avg_Deliver_Duration
From pizza_delivery
Group by Is_Weekend;

-- Peak Hour Analyis 
Select Is_Peak_Hour,
Avg(Delivery_Duration) as Avg_Time
From pizza_delivery
Group by Is_Peak_Hour;


-- Ranking 
-- Fastest Resturant 
Select Restaurant_Name,
Avg(Delivery_Duration) as Avg_Time,
Rank() Over(
Order by Avg(Delivery_Duration)) As Ranking
from pizza_delivery
Group by Restaurant_Name;


-- Business Insight:-
-- 1) High traffic increases delivery time significantly.
-- 2) Assign additional delivery staff during high-traffic periods.
-- 3) optimize routes Using GPS.





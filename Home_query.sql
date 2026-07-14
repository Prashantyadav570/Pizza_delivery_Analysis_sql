create database pizza_sale2;
use pizza_sale2;


CREATE TABLE pizza_delivery(
Order_ID VARCHAR(20),
Restaurant_Name VARCHAR(50),
Location VARCHAR(100),
Order_Date DATE,
Order_Time TIME,
Deliver_status VARCHAR(20),
Delivery_Duration INT,
Pizza_Size VARCHAR(20),
Pizza_Type VARCHAR(50),
Distance DECIMAL(5,2),
Traffic_Level VARCHAR(20),
Payment_Method VARCHAR(30),
Is_Peak_Hour BOOLEAN,
Is_Weekend BOOLEAN,
Order_Month VARCHAR(20),
Estimated_Duration Decimal(5,2),
Delay Decimal(5,2),
Delayed_status VARCHAR(20)
);

describe pizza_delivery;

drop table pizza_delivery;

Alter table pizza_delivery
ADD PRIMARY KEY (Order_id);


select * from pizza_delivery;

-- Check Data  
select count(*) from pizza_delivery;
select * from pizza_delivery
Limit 10;

select * from pizza_delivery
where Restaurant_Name IS null;

-- Data Cleaning
SELECT order_id, count(*)    -- Duplicate value 
from pizza_delivery
Group by Order_ID
Having count(*)>1;

select * from pizza_delivery    -- Invalid delivery duration
where Delivery_Duration <= 0;

select * from pizza_delivery    -- Negative Delay 
where Delay <= 0;

-- Analysis
select count(*) 
from pizza_delivery;

SELECT AVG(Delivery_Duration) as Avg_Duration_min
from pizza_delivery;

select Avg(Distance) as Avg_Distance_Km
from pizza_delivery;

select Restaurant_Name, Count(*)  -- delay by resturant_name
from pizza_delivery
Where Delayed_status = 'Delayed'
Group By Restaurant_Name
Order By 2 Desc;

-- Delayed Percentage
Select 
concat(Round(
Count(Case When Delayed_status = "Delayed" Then 1 End) *100 / count(*),2),'%')
As Delay_percentage
From pizza_delivery;




select * from walmart;

-- Tasks on the Data

--1Q: Finding different payment methods, NO. of transaction, No. of Qty sold
select distinct(payment_method) as "Payment Method", 
	count(*) as "Number of Transaction",
	sum(quantity) as "Quantities Sold"
from walmart
group by payment_method;

--2Q: Find HighestRated category in each branch 
select branch, category, avg(rating) as "Average Rating",
	rank() over(partition by branch order by avg(rating) desc) as Ranking
from walmart
group by branch, category;

select  branch, category, "Average Rating" from (
select branch, category, avg(rating) as "Average Rating",
	rank() over(partition by branch order by avg(rating) desc) as Ranking
from walmart
group by branch, category
)
where Ranking = 1;

--3.0Q get day name from date which is in text format
select date,
	to_char(to_date(date, 'DD/MM/YY'), 'Day') as Day_Name
from walmart;

--3.1Q Busy Day for each branch based on No. of Transactions
select branch, "Day Name", "No of Transactions" from 
(
select branch,
	to_char(to_date(date, 'DD/MM/YY'), 'Day') as "Day Name",
	count(*) as "No of Transactions",
	rank() over(partition by branch order by count(*) desc) as Ranking
	from walmart
	group by branch, "Day Name"
)
where Ranking = 1;

--4Q Find Average, Minimum, Maximum rating of category for each city
select city, category, avg(rating) as Average, min(rating) as Minimum, max(rating) as Maximum
from walmart
group by city, category;

/* 5Q Calculate the total profit for each category by 
considering total_profit as (unit_price quantity profit_margin).
List category and total_profit, ordered from highest to lowest profit. */
select category, sum(unit_price * quantity * profit_margin) as Total_Profit
from walmart
group by category
order by Total_Profit desc

--6Q Common Payment method for each Branch 
with cte as (
select branch, payment_method, count(*) as Total_Transactions,
	rank() over(partition by branch order by count(*) desc) as Ranking
from walmart
group by branch, payment_method
)
select branch, payment_method, Total_Transactions
from cte
where ranking = 1;

-- 7Q Categorise sales to Morning, aftn, evng. Find out which shift has high sales
select 
case 
	when extract(hour from(time::time)) < 12 then 'Morning'
	when extract(hour from(time::time)) between 12 and 17 then 'Afternoon'
	else 'Evening'
end Day_Time,
count(*) as Total
from walmart
group by Day_Time;

-- 7.1Q Categorise sales to Morning, aftn, evng. Find out which shift has high sales, branch
select branch, 
case 
	when extract(hour from(time::time)) < 12 then 'Morning'
	when extract(hour from(time::time)) between 12 and 17 then 'Afternoon'
	else 'Evening'
end Day_Time,
count(*) as Total
from walmart
group by branch, Day_Time
order by branch, Total desc;

/* 8Q compare last year revenue and last year revenue
	  also find Revenue decrease ratio.
	  Show only 5 records

	  rev_dec_ratio = ((last_year_revenue - Curr_year_revenue) / last_year_revenue)  * 100 */
	  
with rev_2022 as (
select branch,
	sum(total) as Revenue
from walmart
where extract(year from TO_DATE(date, 'dd/mm/yy')) = 2022
group by branch
),
rev_2023 as 
(
select branch,
	sum(total) as Revenue
from walmart
where extract(year from TO_DATE(date, 'dd/mm/yy')) = 2023
group by branch
)
select last.branch,
	last.revenue as Last_Year_Revenue,
	curr.revenue Current_Year_Revenue,
	round((last.revenue - curr.revenue)::numeric/last.revenue::numeric * 100, 2) as Revenue_Dec_Ratio
from rev_2022 last 
join rev_2023 curr 
on last.branch = curr.branch
where last.revenue > curr.revenue
order by Revenue_Dec_Ratio desc
limit 5;



--find month over month growth comparison for 2022 and 2023 sales eg jan 2022 vs jan 2023

with cte as (select YEAR(order_date) as order_year, MONTH(order_date) as Order_month , round(sum(sale_price),2) as sales 
from 
	df_orders
group by
	YEAR(order_date) , MONTH(order_date))
select order_month
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by order_month
order by order_month;







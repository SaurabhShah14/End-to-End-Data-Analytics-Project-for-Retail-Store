--for each category which month had highest sales

with cte AS (select category, format(order_date,'MM - yyyy') as Order_month, sum(sale_price) as sales
from
	df_orders
group by
	category, format(order_date,'MM - yyyy'))
select * from(
				select *, ROW_NUMBER() over (partition by category order by sales desc) as rn
				from 
					cte) a
where rn = 1;




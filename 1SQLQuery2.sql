--find top 5 highest selling products in each region.

with cte AS (select region, product_id, sum(sale_price) as sales
from
	df_orders
group by
	region, product_id)
	select * from(
	select *, ROW_NUMBER() over (partition by region order by sales desc) as rn
	from cte) a
	where rn <= 5;








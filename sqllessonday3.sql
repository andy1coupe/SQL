use sakilla;
#1 get the total revenue using the column amount from table payment , display as total revenue
#2 get the total rental revenue by customer_id sorted by total revenue in descending order

select sum(amount) as total_revenue from payment;

select customer_id, sum(amount) as total_revenue from payment
group by customer_id
order by total_revenue desc;


#less flexible - more like SQL
SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY';
SELECT @@global.sql_mode;
select * from pizza_types;
select * from pizzas;
select * from orders;
select * from order_details;
use pizzahut;

#retrieve total number of orders 
select count(order_id) as total_orders from orders;

#calculate total revenuue generated from pizza sales
select 
round(sum(order_details.quantity*pizzas.price),2) as total_sales 
from 
order_details 
join 
pizzas on pizzas.pizza_id=order_details.pizza_id;

#identify the highest priced pizza 
select pizza_types.name,pizzas.price 
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price asc limit 10;

select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by order_count desc;

Select 
pizza_types.name, SUM(order_details.quantity) AS quantity
from 
pizza_types
join
pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join
order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc
limit 5;




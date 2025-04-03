 -- Calculate the percentage contribution of each pizza type to total revenue.
 
 SELECT pizza_types.category AS category ,
 CONCAT(ROUND((SUM(order_details.quantity * pizzas.price)  / 
 ( SELECT ROUND(SUM(order_details.quantity * pizzas.price),2)  AS Total_SALES
       FROM order_details
       JOIN pizzas
       ON order_details.pizza_id = pizzas.pizza_id
       ) ) * 100,2),"%") AS Revenue
      
 FROM pizza_types
 JOIN pizzas
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details
 ON pizzas.pizza_id = order_details.pizza_id 
 GROUP BY category
 ORDER BY Revenue DESC;
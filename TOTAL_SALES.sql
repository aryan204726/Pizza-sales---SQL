-- Calculate the total revenue generated from pizza sales

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS TOTAL_SALES
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id; 
CREATE DATABASE ecommerce_shipping;
USE ecommerce_shipping;

ALTER TABLE ecommerce_shipping_data
CHANGE `Reached.on.Time_Y.N` Reached_On_Time_Y_N INT;

SELECT * FROM ecommerce_shipping.ecommerce_shipping_data;

-- 1. List the first 10 rows from the dataset.

Select * from ecommerce_shipping_data limit 10;

-- 2. Find all shipments that were not delivered on time

SELECT * FROM ecommerce_shipping_data
WHERE Reached_on_Time_Y_N = 0;

-- 3. Show all female customers who made more than 5 prior purchases.

Select Gender,Prior_purchases from ecommerce_shipping_data where Gender = 'F' and Prior_purchases = 5;

-- 4. What is the average cost of the product?

Select avg(Cost_of_the_product) as Average_Cost_of_product from ecommerce_shipping_data;

-- 5. Which mode of shipment is used most often?

SELECT Mode_of_Shipment, COUNT(*) AS total
FROM ecommerce_shipping_data
GROUP BY Mode_of_Shipment
ORDER BY total DESC;

-- 6. What is the total discount given for each product importance category?

Select product_importance,Sum(discount_offered) as Total_discount from ecommerce_shipping_data
group by Product_importance;

-- 7. What’s the average customer rating by shipment mode?

Select  Mode_of_Shipment, avg(Customer_rating) as Avg_rating from ecommerce_shipping_data group by Mode_of_Shipment;

-- 8. How many late deliveries were made by each warehouse block?

Select count(*) as late_deliveries ,warehouse_block from ecommerce_shipping_data where reached_on_time_Y_N = 1 group by Warehouse_block;

-- 9. Find all records with a cost higher than the average cost

SELECT * FROM ecommerce_shipping_data
WHERE Cost_of_the_Product > (
    SELECT AVG(Cost_of_the_Product)
    FROM ecommerce_shipping_data
);

-- 10. Create a view to analyze product cost by importance
CREATE VIEW cost_by_importance AS
SELECT Product_importance, AVG(Cost_of_the_Product) AS avg_cost
FROM ecommerce_shipping_data
GROUP BY Product_importance;

SELECT * FROM cost_by_importance;

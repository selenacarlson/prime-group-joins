-- 1. Get all customers and their addresses.
    SELECT * FROM customers 
    JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
    SELECT * FROM line_items
    JOIN orders ON line_items.order_id = orders.id;

-- 3. Which warehouses have cheetos?
    SELECT * FROM warehouse 
    JOIN warehouse_product ON warehouse.id = warehouse_id
    JOIN products ON products.id = product_id
    WHERE product_id=5;

-- 4. Which warehouses have diet pepsi?
    SELECT * FROM warehouse 
    JOIN warehouse_product ON warehouse.id = warehouse_id
    JOIN products ON products.id = product_id
    WHERE product_id=6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT customers.first_name, customers.last_name, count(line_items.order_id) FROM customers
    JOIN addresses ON customers.id = addresses.customer_id
    JOIN orders ON addresses.id = orders.address_id
    JOIN line_items ON line_items.order_id = orders.id
    GROUP BY customers.first_name, customers.last_name;

-- 6. How many customers do we have?
    SELECT count(*) from customers;

-- 7. How many products do we carry?
    SELECT count(*) from products;

-- 8. What is the total available on-hand quantity of diet pepsi?
    SELECT SUM(on_hand) FROM warehouse_product
    JOIN products ON warehouse_product.product_id = products.id
    WHERE products.description='diet pepsi';

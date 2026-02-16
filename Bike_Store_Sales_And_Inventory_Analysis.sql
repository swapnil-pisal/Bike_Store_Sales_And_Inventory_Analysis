-- SQL Minor Project: 
-- Bike Store Sales And Inventory Analysis 

-- Project Overview -:
-- This project focuses strictly on relational logic using JOINs and aggregation functions.
-- Subqueries and CTEs are intentionally excluded to strengthen core SQL fundamentals.

-- Problem Statement:
-- Analyze store performance and inventory levels for a bicycle retail chain.


-- Create the Database
CREATE DATABASE BikeStoreProject;


-- Use the database
USE BikeStoreProject; 


-- Create the table brands
CREATE TABLE brands(
brand_id INT PRIMARY KEY,
brand_name VARCHAR(50) NOT NULL);


-- Create the table categories
CREATE TABLE categories(
category_id	INT PRIMARY KEY,
category_name VARCHAR(50)
);


-- Create the table customers
CREATE TABLE customers(
customer_id	INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone BIGINT,
email VARCHAR(50),
street VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
zip_code BIGINT
);


-- Create the table order_items
CREATE TABLE order_items(
order_id INT PRIMARY KEY,
item_id INT,
product_id INT,
quantity INT,	
list_price FLOAT,	
discount FLOAT
);


-- Create the table orders
CREATE TABLE orders(
order_id INT PRIMARY KEY,	
customer_id INT,	
order_status INT,	
order_date	DATE,
required_date DATE,	
shipped_date DATE,
store_id INT,
staff_id INT
);


-- Create the table products
CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
brand_id INT,
category_id INT,
model_year INT,	
list_price FLOAT
);


-- Create the table staffs
CREATE TABLE staffs(
staff_id INT PRIMARY KEY,	
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),	
phone BIGINT,
active	INT,
store_id INT,
manager_id INT
);


-- Create the table stocks
CREATE TABLE stocks(
store_id INT PRIMARY KEY,
product_id INT,
quantity INT
);


-- Create the table stores
CREATE TABLE stores(
store_id INT PRIMARY KEY,
store_name VARCHAR(50),
phone BIGINT,
email VARCHAR(50),
street VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
zip_code BIGINT
);

-- Create the table orderss
CREATE TABLE orderss(
order_id INT PRIMARY KEY,	
customer_id INT,	
order_status INT,	
order_date	DATE,
required_date DATE,	
shipped_date DATE,
store_id INT,
staff_id INT
);


-- show all the created tables
SHOW TABLES; 


-- insert the values into brands table
INSERT INTO brands VALUES
(1,"Electra"),
(2,"Haro"),
(3,"Heller"),
(4,"Pure Cycles"),
(5,"Ritchey"),
(6,"Strider"),
(7,"Sun Bicycles"),
(8,"Surly"),
(9,"Trek");


-- insert the values into categories table
INSERT INTO categories VALUES
(1,"Children Bicycles"),
(2,"Comfort Bicycles"),
(3,"Cruisers Bicycles"),
(4,"Cyclocross Bicycles"),
(5,"Electric Bikes"),
(6,"Mountain Bikes"),
(7,"Road Bikes");


-- insert the values into customers table
INSERT INTO customers VALUES
(1,"Debra","Burks",NULL,"debra.burks@yahoo.com","9273 Thorne Ave.","Orchard Park","NY",14127),
(2,"Kasha","Todd",NULL,"kasha.todd@yahoo.com","910 Vine Street","Campbell","CA",95008),
(3,"Tameka","Fisher",NULL,"tameka.fisher@aol.com","769C Honey Creek St.", "Redondo Beach","CA",90278),
(4,"Daryl","Spence",NULL,"daryl.spence@aol.com","988 Pearl Lane","Uniondale","NY",11553),
(5,"Charolette","Rice",9163816003,"charolette.rice@msn.com","107 River Dr.","Sacramento","CA",95820),
(6,"Lyndsey","Bean",NULL,"lyndsey.bean@hotmail.com","769 West Road","Fairport","NY",14450),
(7,"Latasha","Hay",7169863359,"latasha.hays@hotmail.com","7014 Manor Station Rd.","Buffalo","NY",14215),
(8,"Jacquline","Duncan",NULL,"jacquline.duncan@yahoo.com","15 Brown St.","Jackson Heights","NY",11372),
(9,"Genoveva","Baldwin",NULL,"genoveva.baldwin@msn.com","8550 Spruce Drive","Port Washington","NY",11050),
(10,"Pamelia","Newman",NULL,"pamelia.newman@gmail.com","476 Chestnut Ave.","Monroe","NY",10950),
(11,"Deshawn","Mendoza",NULL,"deshawn.mendoza@yahoo.com","8790 Cobblestone Street","Monsey","NY",10952),
(12,"Robby","Sykes",5165837761,"robby.sykes@hotmail.com","486 Rock Maple Street","Hempstead","NY",11550),
(13,"Lashawn","Ortiz",NULL,"lashawn.ortiz@msn.com","27 Washington Rd.","Longview","TX",75604),
(14,"Garry","Espinoza",NULL,"garry.espinoza@hotmail.com","7858 Rockaway Court","Forney","TX",75126),
(15,"Linnie","Branch",NULL,"linnie.branch@gmail.com","314 South Columbia Ave.","Plattsburgh","NY",12901),
(16,"Emmitt","Sanchez",2129458823,"emmitt.sanchez@hotmail.com","461 Squaw Creek Road","New York","NY",10002),
(17,"Caren","Stephens",NULL,"caren.stephens@msn.com","914 Brook St.","Scarsdale","NY",10583),
(18,"Georgetta","Hardin",NULL,"georgetta.hardin@aol.com","474 Chapel Dr.","Canandaigua","NY",14424),
(19,"Lizzette","Stein",NULL,"lizzette.stein@yahoo.com","19 Green Hill Lane","Orchard Park","NY",14127),
(20,"Aleta","Shepard",NULL,"aleta.shepard@aol.com","684 Howard St.","Sugar Land","TX",77478);


-- insert the values into order_items table
INSERT INTO order_items VALUES
(1,1,20,1,599.99,0.2),
(1,2,8,2,1799.99,0.07),
(1,3,10,2,1549,0.05),
(1,4,16,2,599.99,0.05),
(1,5,4,1,2899.99,0.2),
(2,1,20,1,599.99,0.07),
(2,2,16,2,599.99,0.05),
(3,1,3,1,999.99,0.05),
(3,2,20,1,599.99,0.05),
(4,1,2,2,749.99,0.1),
(5,1,10,2,1549,0.05),
(5,2,17,1,429,0.07),
(5,3,26,1,599.99,0.07),
(6,1,18,1,449,0.07),
(6,2,12,2,549.99,0.05),
(6,3,20,1,599.99,0.1),
(6,4,3,2,999.99,0.07),
(6,5,9,2,2999.99,0.07),
(7,1,15,1,529.99,0.07);


ALTER TABLE order_items DROP PRIMARY KEY; 


SELECT * FROM order_items;


-- insert the values into orders table
INSERT INTO orders VALUES
(1,259,4,"2016-01-01","2016-01-03","2016-01-03",1,2),
(2,1212,4,"2016-01-01","2016-01-04","2016-01-03",2,6),
(3,523,4,"2016-01-02","2016-01-05","2016-01-03",2,7),
(4,175,4,"2016-01-03","2016-01-04","2016-01-05",1,3),
(5,1324,4,"2016-01-03","2016-01-06","2016-01-06",2,6),
(6,94,4,"2016-01-04","2016-01-07","2016-01-05",2,6),
(7,324,4,"2016-01-04","2016-01-07","2016-01-05",2,6),
(8,1204,4,"2016-01-04","2016-01-05","2016-01-05",2,7),
(9,60,4,"2016-01-05","2016-01-08","2016-01-08",1,2),
(10,442,4,"2016-01-05","2016-01-06","2016-01-06",2,6),
(11,1326,4,"2016-01-05","2016-01-08","2016-01-07",2,7),
(12,91,4,"2016-01-06","2016-01-08","2016-01-09",1,2),
(13,873,4,"2016-01-08","2016-01-11","2016-01-11",2,6),
(14,258,4,"2016-01-09","2016-01-11","2016-01-12",1,3),
(15,450,4,"2016-01-09","2016-01-10","2016-01-12",2,7),
(16,552,4,"2016-01-12","2016-01-15","2016-01-15",1,3),
(17,1175,4,"2016-01-12","2016-01-14","2016-01-14",1,3),
(18,541,4,"2016-01-14","2016-01-17","2016-01-15",1,3),
(19,696,4,"2016-01-14","2016-01-17","2016-01-16",1,2),
(20,923,4,"2016-01-14","2016-01-16","2016-01-17",1,2);


-- insert the values into products table
INSERT INTO products VALUES
(1,"Trek 820 - 2016",9,6,2016,379.99),
(2,"Ritchey Timberwolf Frameset - 2016",5,6,2016,749.99),
(3,"Surly Wednesday Frameset - 2016",8,6,2016,999.99),
(4,"Trek Fuel EX 8 29 - 2016",9,6,2016,2899.99),
(5,"Heller Shagamaw Frame - 2016",3,6,2016,1320.99),
(6,"Surly Ice Cream Truck Frameset - 2016",8,6,2016,469.99),
(7,"Trek Slash 8 27.5 - 2016",9,6,2016,3999.99),
(8,"Trek Remedy 29 Carbon Frameset - 2016",9,6,2016,1799.99),
(9,"Trek Conduit+ - 2016",9,5,2016,2999.99),
(10,"Surly Straggler - 2016",8,4,2016,1549),
(11,"Surly Straggler 650b - 2016",8,4,2016,1680.99),
(12,"Electra Townie Original 21D - 2016",1,3,2016,549.99),
(13,"Electra Cruiser 1 (24-Inch) - 2016",1,3,2016,269.99),
(14,"Electra Girl's Hawaii 1 (16-inch) - 2015/2016",1,3,2016,269.99),
(15,"Electra Moto 1 - 2016",1,3,2016,529.99),
(16,"Electra Townie Original 7D EQ - 2016",1,3,2016,599.99),
(17,"Pure Cycles Vine 8-Speed - 2016",4,3,2016,429),
(18,"Pure Cycles Western 3-Speed - Women's - 2015/2016",4,3,2016,449),
(19,"Pure Cycles William 3-Speed - 2016",4,3,2016,449),
(20,"Electra Townie Original 7D EQ - Women's - 2016",1,3,2016,599.99);


-- insert the values into staffs table
INSERT INTO staffs VALUES
(1,"Fabiola","Jackson","fabiola.jackson@bikes.shop","8315555554",1,1,NULL),
(2,"Mireya","Copeland","mireya.copeland@bikes.shop","8315555555",1,1,1),
(3,"Genna","Serrano","genna.serrano@bikes.shop","8315555556",1,1,2),
(4,"Virgie","Wiggins","virgie.wiggins@bikes.shop","8315555557",1,1,2),
(5,"Jannette","David","jannette.david@bikes.shop","5163794444",1,2,1),
(6,"Marcelene","Boyer","marcelene.boyer@bikes.shop","5163794445",1,2,5),
(7,"Venita","Daniel","venita.daniel@bikes.shop","5163794446",1,2,5),
(8,"Kali","Vargas","kali.vargas@bikes.shop","9725305555",1,3,1),
(9,"Layla","Terrell","layla.terrell@bikes.shop","9725305556",1,3,7),
(10,"Bernardine","Houston","bernardine.houston@bikes.shop","9725305557",1,3,7);


ALTER TABLE stocks DROP PRIMARY KEY;


-- insert the values into stocks table
INSERT INTO stocks VALUES
(1,1,27),
(1,2,5),
(1,3,6),
(1,4,23),
(1,5,22),
(1,6,0),
(1,7,8),
(1,8,0),
(1,9,11),
(1,10,15),
(1,11,8),
(1,12,16),
(1,13,13),
(1,14,8),
(1,15,3),
(1,16,4),
(1,17,2),
(1,18,16),
(1,19,4),
(1,20,26);


-- insert the values into stores table
INSERT INTO stores VALUES
(1,"Santa Cruz Bikes","8314764321","santacruz@bikes.shop","3700 Portola Drive","Santa Cruz","CA",95060),
(2,"Baldwin Bikes","5163798888","baldwin@bikes.shop","4200 Chestnut Lane","Baldwin","NY",11432),
(3,"Rowlett Bikes","9725305555","rowlett@bikes.shop","8000 Fairway Avenue","Rowlett","TX",75088);


-- insert the values into orderss table
INSERT INTO orderss VALUES
(1,2,4,"2016-01-01","2016-01-03","2016-01-03",1,2),
(2,12,4,"2016-01-01","2016-01-04","2016-01-03",2,6),
(3,5,4,"2016-01-02","2016-01-05","2016-01-03",2,7),
(4,16,4,"2016-01-03","2016-01-04","2016-01-05",1,3),
(5,13,4,"2016-01-03","2016-01-06","2016-01-06",2,6),
(6,4,4,"2016-01-04","2016-01-07","2016-01-05",2,6),
(7,3,4,"2016-01-04","2016-01-07","2016-01-05",2,6),
(8,20,4,"2016-01-04","2016-01-05","2016-01-05",2,7),
(9,6,4,"2016-01-05","2016-01-08","2016-01-08",1,2),
(10,19,4,"2016-01-05","2016-01-06","2016-01-06",2,6),
(11,13,4,"2016-01-05","2016-01-08","2016-01-07",2,7),
(12,1,4,"2016-01-06","2016-01-08","2016-01-09",1,2),
(13,8,4,"2016-01-08","2016-01-11","2016-01-11",2,6),
(14,18,4,"2016-01-09","2016-01-11","2016-01-12",1,3),
(15,15,4,"2016-01-09","2016-01-10","2016-01-12",2,7),
(16,17,4,"2016-01-12","2016-01-15","2016-01-15",1,3),
(17,11,4,"2016-01-12","2016-01-14","2016-01-14",1,3),
(18,9,4,"2016-01-14","2016-01-17","2016-01-15",1,3),
(19,14,4,"2016-01-14","2016-01-17","2016-01-16",1,2),
(20,7,4,"2016-01-14","2016-01-16","2016-01-17",1,2);


-- to check the values from the table brands
SELECT * FROM brands;


-- to check the values from the table categories
SELECT * FROM categories;


-- to check the values from the table customers
SELECT * FROM customers;


-- to check the values from the table order_items
SELECT * FROM order_items;


-- to check the values from the table orders
SELECT * FROM orders;


-- to check the values from the table products
SELECT * FROM products;


-- to check the values from the table staffs
SELECT * FROM staffs;


-- to check the values from the table stocks
SELECT * FROM stocks;


-- to check the values from the table stores
SELECT * FROM stores;

-- to check the values from the table orderss
SELECT * FROM orderss;


-- Key SQL Tasks:

-- 1. Store Performance – Total revenue generated by each store. 
-- Task 1: Store Revenue Analysis 
SELECT  
    s.store_name,  
    SUM(i.list_price * i.quantity * (1 - i.discount)) AS Total_Revenue 
FROM stores s 
JOIN orders o ON s.store_id = o.store_id 
JOIN order_items i ON o.order_id = i.order_id 
GROUP BY s.store_name 	
ORDER BY Total_Revenue DESC;


-- 2. Product Popularity – Top 5 most sold products by quantity. 
SELECT
  p.product_name,
  o.quantity
FROM products AS p
JOIN order_items AS o ON p.product_id = o.product_id
ORDER BY o.quantity DESC
LIMIT 5;


  
-- 3. Customer Location – Customers who placed orders with store names. 
SELECT 
      c.customer_id,
      c.first_name,
      c.last_name,
      o.store_id,
      s.store_name
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN stores AS s ON o.store_id = s.store_id; 


-- 3. Customer Location – Customers who placed orders with store names. 
SELECT 
      c.customer_id,
      c.first_name,
      c.last_name,
      o.store_id,
      s.store_name
FROM customers AS c
JOIN orderss AS o ON c.customer_id = o.customer_id
JOIN stores AS s ON o.store_id = s.store_id; 


-- 4. Brand Insights – Total number of products per brand.
SELECT
b.brand_name,COUNT(p.product_name) AS total_number_of_products_per_brand
FROM brands AS b
JOIN products AS p ON b.brand_id = p.brand_id
GROUP BY b.brand_name
ORDER BY total_number_of_products_per_brand DESC;
 


-- 5. Low Stock Alert – Products with zero quantity in stock.
SELECT
p.product_name,s.quantity
FROM  products AS p
JOIN stocks AS s ON p.product_id = s.product_id
WHERE s.quantity = 0;


















 


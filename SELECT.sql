-- 1.¿CUALES SON LOS PRODUCTOS QUE CUESTAN MENOS DE $100 
-- EN STOCK Y QUE SEAN MAS DE 50 PRODUCTOS, ORDDENADOS DE MAYOR A MENOR?

SELECT product_id, name, price, stock
FROM products
WHERE price <= 100
AND stock > 50
ORDER BY stock DESC;
--RESPUESTA#1-------------------------------------------------------------------------------------------
| product_id | name                       | price | stock |
+------------+----------------------------+-------+-------+
|       1642 | Small Marble Computer      | 13.65 |   100 |
|        801 | Heavy Duty Rubber Gloves   | 97.69 |    79 |
|         34 | Durable Aluminum Clock     | 40.12 |    76 |
|       1134 | Durable Marble Watch       | 46.55 |    76 |
|       1193 | Fantastic Wool Gloves      | 69.73 |    73 |
|        447 | Durable Marble Gloves      | 23.66 |    70 |
|       2341 | Intelligent Copper Shoes   | 75.58 |    70 |
|         31 | Durable Paper Clock        | 65.09 |    69 |
|       1606 | Sleek Bronze Car           | 18.62 |    62 |
|       1711 | Rustic Linen Bag           | 25.49 |    54 |
|       2276 | Lightweight Leather Wallet | 43.30 |    54 |
|       2306 | Rustic Leather Lamp        | 49.41 |    53 |
+------------+----------------------------+-------+-------+

    
-- 2.DE ESOS PRODUCTOS ¿CUANTO DINERO TENGO EN MIS EXISTENCIAS 
-- ORDENADOS DE MAYOR A MENOR EN TOTAL?
    
SELECT product_id, name, price, stock, 
price * stock as total
FROM products
WHERE price <= 100
AND stock > 50
ORDER BY total DESC;
--RESPUESTA#2-------------------------------------------------------------------------------------------------
| product_id | name                       | price | stock | total   |
+------------+----------------------------+-------+-------+---------+
|        801 | Heavy Duty Rubber Gloves   | 97.69 |    79 | 7717.51 |
|       2341 | Intelligent Copper Shoes   | 75.58 |    70 | 5290.60 |
|       1193 | Fantastic Wool Gloves      | 69.73 |    73 | 5090.29 |
|         31 | Durable Paper Clock        | 65.09 |    69 | 4491.21 |
|       1134 | Durable Marble Watch       | 46.55 |    76 | 3537.80 |
|         34 | Durable Aluminum Clock     | 40.12 |    76 | 3049.12 |
|       2306 | Rustic Leather Lamp        | 49.41 |    53 | 2618.73 |
|       2276 | Lightweight Leather Wallet | 43.30 |    54 | 2338.20 |
|        447 | Durable Marble Gloves      | 23.66 |    70 | 1656.20 |
|       1711 | Rustic Linen Bag           | 25.49 |    54 | 1376.46 |
|       1642 | Small Marble Computer      | 13.65 |   100 | 1365.00 |
|       1606 | Sleek Bronze Car           | 18.62 |    62 | 1154.44 |

    
-- 3.¿CUALES SON LOS 10 PRODUCTOS EN DONDE MÁS DINERO TENGO INVERTIDO EN MIS EXISTENCIAS?

SELECT product_id, name, price, stock, 
round(price * stock) as total
FROM products
ORDER BY total DESC
LIMIT 10;
--RESPUESTA#3-----------------------------------------------------------------------------------------------
product_id | name                        | price   | stock | total  |
+------------+-----------------------------+---------+-------+--------+
|          2 | Practical Copper Bench      | 4959.32 |   100 | 495932 |
|        615 | Gorgeous Marble Lamp        | 4858.96 |    99 | 481037 |
|       1646 | Ergonomic Concrete Computer | 4957.67 |    97 | 480894 |
|       2236 | Ergonomic Copper Pants      | 4730.92 |   100 | 473092 |
|       1529 | Sleek Granite Hat           | 4945.29 |    94 | 464857 |
|       1785 | Ergonomic Cotton Wallet     | 4884.26 |    94 | 459120 |
|         71 | Ergonomic Rubber Knife      | 4984.04 |    92 | 458532 |
|         67 | Fantastic Steel Watch       | 4802.34 |    95 | 456222 |
|          8 | Practical Concrete Coat     | 4546.20 |   100 | 454620 |
|       1759 | Gorgeous Granite Plate      | 4870.60 |    93 | 452966 |
+------------+-----------------------------+---------+-------+--------+

    
-- 4.¿CUANTOS PRODUCTOS TENGO?

SELECT COUNT(*) FROM products;
--RESPUESTA---------------------------------------------------------------------------
+----------+
| COUNT(*) |
+----------+
|     2358 |
+----------+

    
-- 5.¿CUANTOS PRODUCTOS TENGO CON UN PRECIO MENOR O IGUAL A $500?

SELECT COUNT(*) FROM products
WHERE price <= 500;
--RESPUESTA#5-----------------------------------------------------------------
+----------+
| COUNT(*) |
+----------+
|      201 |
+----------+

--6.¿CUANTOS ELEMENTOS CUENTO EN MIS EXISTENCIAS?

SELECT SUM(stock) FROM products;
--RESPUESTA--------------------------------------------------------------------------------
+------------+
| SUM(stock) |
+------------+
|     117891 |
+------------+

    
-- 7.¿CUAL ES EL PRECIO PROMEDIO DE MIS PRODUCTOS?

SELECT round(AVG(price)) FROM products;
--RESPUESTA--------------------------------------------------------------------------------------------
+-------------------+
| round(AVG(price)) |
+-------------------+
|              2539 |
+-------------------+

-- 8.¿CUANTO DINERO TENGO INVERTIDO EN MIS PRODUCTOS?

SELECT SUM(price*stock) FROM products;
--RESPUESTA#8--------------------------------------------------------------------------------------------------------
+------------------+
| SUM(price*stock) |
+------------------+
|     300605686.69 |
+------------------+

    
-- 9.¿CUANTOS DE MIS USUARIOS TIENEN LOS SIGUIENTES CORREOS @gmail, @yahoo, @hotmail?
    
SELECT 
    CASE 
        WHEN email LIKE '%gmail.com' THEN 'gmail'
        WHEN email LIKE '%yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%hotmail.com' THEN 'hotmail'
        ELSE 'otro proveedor de correo'
    END AS proveedor,
    COUNT(*) AS total_clients
FROM clients
GROUP BY proveedor
ORDER BY total_clients DESC;
--RESPUESTA#9------------------------------------------------------------------------------------------------------------------
+--------------------------+---------------+
| proveedor                | total_clients |
+--------------------------+---------------+
| otro proveedor de correo |         50367 |
| yahoo                    |         16096 |
| gmail                    |         15903 |
| hotmail                  |         15657 |
+--------------------------+---------------+

    
-- 10.¿CUAL ES EL MONTO FINAL DE LAS FACTURAS CON TODO Y DESCUENTOS?

SELECT b.bill_id, b.status, c.name, 
count(bp.bill_product_id) as number_of_products,
round(sum(bp.quantity * p.price * (1- bp.discount/100))) as total
FROM bills as b
LEFT JOIN clients as c
    ON b.client_id = c.client_id
LEFT JOIN bill_products as bp
    ON bp.bill_id = b.bill_id
LEFT JOIN products as p
    ON p.product_id = bp.product_id
GROUP BY b.bill_id;
--RESPUESTA#10------------------------------------------------------------------------------------------------------------
+---------+--------+------------------------+--------------------+---------+
| bill_id | status | name                   | number_of_products | total   |
+---------+--------+------------------------+--------------------+---------+
|       1 | open   | Thaddeus Wyman         |                 45 |  598187 |
|       2 | open   | Miss Mina Davis        |                 60 | 1022432 |
|       3 | open   | Josiah Kirlin DDS      |                 54 |  699758 |
|       4 | open   | Mr. Lenny Hartmann Sr. |                 60 | 1138482 |
|       5 | open   | Theo Koch              |                 64 |  984338 |
|       6 | open   | Jillian Predovic       |                 50 |  733690 |
|       7 | open   | Dr. Bettye Pacocha V   |                 63 | 1039086 |
|       8 | open   | Myles Little           |                 54 |  863493 |
|       9 | open   | Heaven Lynch           |                 56 |  951417 |
|      10 | open   | Titus Herzog           |                 71 |  926630 |
|      11 | open   | Kathryne Conroy        |                 47 |  726666 |
|      12 | open   | Dr. Addison Dare II    |                 63 | 1064682 |
|      13 | open   | Bridie Sporer III      |                 63 | 1067891 |
|      14 | open   | Elvie Vandervort       |                 66 |  704407 |
|      15 | open   | Dr. Andrew Harber      |                 56 |  992980 |
|      16 | open   | Andy Funk              |                 48 |  751504 |
|      17 | open   | Carlo Bashirian        |                 60 | 1109581 |
|      18 | open   | Miss Cathy Brekke III  |                 63 | 1009147 |
|      19 | open   | Rocky Block            |                 44 |  712369 |
|      20 | open   | Ben Rosenbaum          |                 66 | 1086189 |
+---------+--------+------------------------+--------------------+---------+

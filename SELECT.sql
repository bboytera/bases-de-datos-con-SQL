-- 1.¿CUALES SON LOS PRODUCTOS QUE CUESTAN MENOS DE $100 
-- EN STOCK Y QUE SEAN MAS DE 50 PRODUCTOS, ORDDENADOS DE MAYOR A MENOR?

SELECT product_id, name, price, stock
FROM products
WHERE price <= 100
AND stock > 50
ORDER BY stock DESC;


-- DE ESOS PRODUCTOS ¿CUANTO DINERO TENGO EN MIS EXISTENCIAS 
-- ORDENADOS DE MAYOR A MENOR EN TOTAL?

SELECT product_id, name, price, stock, 
price * stock as total
FROM products
WHERE price <= 100
AND stock > 50
ORDER BY total DESC;

-- ¿CUALES SON LOS 10 PRODUCTOS EN DONDE MÁS DINERO TENGO INVERTIDO EN MIS EXISTENCIAS?

SELECT product_id, name, price, stock, 
round(price * stock) as total
FROM products
ORDER BY total DESC
LIMIT 10;


-- ¿CUANTOS PRODUCTOS TENGO?

SELECT COUNT(*) FROM products;

-- ¿CUANTOS PRODUCTOS TENGO CON UN PRECIO MENOR O IGUAL A $500?

SELECT COUNT(*) FROM products
WHERE price <= 500;

--¿CUANTOS ELEMENTOS CUENTO EN MIS EXISTENCIAS?

SELECT SUM(stock) FROM products;

-- ¿CUAL ES EL PRECIO PROMEDIO DE MIS PRODUCTOS?

SELECT round(AVG(price)) FROM products;

-- ¿CUANTO DINERO TENGO INVERTIDO EN MIS PRODUCTOS?

SELECT SUM(price*stock) FROM products;

-- ¿CUANTOS DE MIS USUARIOS TIENEN LOS SIGUIENTES CORREOS @gmail, @yahoo, @hotmail?


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

-- ¿CUAL ES EL MONTO FINAL DE LAS FACTURAS CON TODO Y DESCUENTOS?

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
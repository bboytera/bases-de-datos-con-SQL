SELECT product_id, name, price, stock
FROM products
WHERE price <= 100
AND stock > 50
ORDER BY stock DESC;

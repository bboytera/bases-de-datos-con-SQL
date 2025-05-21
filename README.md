# Bases de Datos con SQL

## Descripción general del proyecto 📘

Este repositorio contiene un conjunto de scripts SQL destinados a crear y poblar una base de datos de ejemplo, usando **MySQL Shell**. Se definen tablas típicas de un sistema de facturación: clientes (`clients`), productos (`products` ), facturas (`bills`) y detalles de factura (`bill_products`), junto con las relaciones entre ellas. El proyecto sirve como ejercicio para practicar comandos SQL básicos y avanzados: creación de tablas, inserción masiva de datos y consultas (SELECT) con joins y agregaciones. Además incluye un diagrama en PDF (`DIAGRAMA.pdf`) que ilustra la estructura relacional de las tablas.

## Tecnologías utilizadas 🛠️
- **MySQL 8.0+:** Sistema de gestión de base de datos relacional donde se ejecutan los scripts.
- **MySQL Shell** (cliente de línea de comandos): herramienta empleada para ejecutar los scripts SQL.
- **SQL:** Lenguaje de consultas estructurado para crear tablas, insertar datos y realizar consultas.
  
## Estructura del proyecto 📂

El repositorio está organizado con archivos clave en la raíz:
- `CREATE_TABLES.sql` : Script que crea el esquema de la base de datos (tablas clients, products, bills y bill_products). Incluye campos como identificadores (PRIMARY KEY), referencias entre tablas y marcas de tiempo.
- `insert_clients.sql`: Inserta registros de ejemplo en la tabla clients (clientes ficticios con nombre, correo, teléfono, etc.).
- `insert_products.sql`: Inserta registros de ejemplo en la tabla products (productos con nombre, descripción, precio, etc.).
- `insert_bills.sql`: Inserta registros en la tabla bills (facturas asociadas a clientes).
- `insert_bill_products.sql`: Inserta registros en la tabla bill_products (detalles de cada factura, relacionando facturas con productos y cantidades).
- `SELECT.sql`: Contiene consultas de ejemplo para extraer información de la base de datos (por ejemplo, joins entre tablas y agregaciones).
- `DIAGRAMA.pdf`: Diagrama visual de la base de datos que muestra la estructura de tablas y sus relaciones.

## Optimización de mis tablas

Realicé una serie de optimizaciones a mis tablas utilizando los comandos `UPDATE`  y `ALTER TABLE` ... `ADD COLUMN`, con el objetivo de mejorar la estructura y funcionalidad de la base de datos.Estas mejoras incluyeron la normalización de datos, la corrección de valores específicos, y la actualización de registros para reflejar cambios recientes. Incorporé nuevas columnas como `sku`, `stock`, `date_added`, `discount` y `price`, que permiten un control más detallado sobre los productos y sus movimientos en las facturas, llevé a cabo la inserción de los datos nuevos mediante el comando `INSERT`, con el propósito de poblar la base de datos y probar su funcionamiento. Estos datos me permitieron simular escenarios reales, validar relaciones entre tablas, y ejecutar consultas significativas.
También establecí claves únicas para evitar duplicados (`email`, `slug`, `sku`), y utilicé funciones como `DEFAULT CURRENT_TIMESTAMP` y `on update CURRENT_TIMESTAMP` para mantener un registro automático y actualizado de cada operación. Estas optimizaciones mejoraron la consistencia, trazabilidad y eficiencia general de la base de datos.

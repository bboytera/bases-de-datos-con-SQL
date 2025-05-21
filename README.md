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

## Consultas en mi base de datos con SQL

Finalmente, realicé consultas **SQL** orientadas a la segmentación y obtención de información relevante a partir de los datos almacenados. Este proyecto refleja el uso práctico de MySQL en la gestión de bases de datos, y demuestra cómo utilizar sus principales comandos para organizar, consultar y analizar información de manera eficiente.

## 📊 Resultados del Análisis SQL
Durante el análisis de la base de datos, se realizaron múltiples consultas SQL para entender mejor el inventario de productos, los patrones de los usuarios y las facturas emitidas. A continuación, se resumen los hallazgos más importantes:

### 🛒 Inventario de Productos
- Se identificaron 12 productos que cuestan menos de $100 y tienen un stock mayor a 50 unidades. Estos productos fueron ordenados por el valor total en existencias, revelando que el más valioso de esta categoría es "Heavy Duty Rubber Gloves" con una inversión total de $7,717.51.

- Los 10 productos con mayor inversión en inventario (sin importar el precio) tienen un valor total en existencias que oscila entre $452,966 y $495,932, siendo el más significativo "Practical Copper Bench".

- En total, existen 2,358 productos en la base de datos, de los cuales 201 productos tienen un precio menor o igual a $500.

- El total de unidades disponibles en el inventario es de 117,891 y el precio promedio de los productos es aproximadamente $2,539.

- La inversión total en el inventario (precio × cantidad) asciende a $300,605,686.69.

### 👥 Usuarios por Proveedor de Correo
Se realizó un conteo del número de usuarios según su proveedor de correo:

- **Yahoo:** 16,096 usuarios

- **Gmail:** 15,903 usuarios

- **Hotmail:** 15,657 usuarios

- **Otros proveedores:** 50,367 usuarios

Esto indica que **Yahoo** es el proveedor con más usuarios registrados, aunque la mayoría utiliza correos fuera de estos tres dominios.

### 🧾 Facturación e Ingresos
Para conocer los ingresos reales, se calculó el monto total por factura, tomando en cuenta descuentos aplicados por producto. Se analizaron las primeras 20 facturas abiertas y se observó que:

- El total por factura (con descuentos) varía desde aproximadamente $598,187 hasta más de $1,130,000.

- El cliente con la factura de mayor valor es Mr. Lenny Hartmann Sr., con una factura de $1,138,482.

- Estos valores se obtuvieron mediante un `JOIN` entre las tablas de facturas, clientes, productos y detalles de facturación, aplicando la fórmula:
`total = SUM(cantidad × precio × (1 - descuento))`.

CREATE TABLE `clients` (
  `client_id` int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(30) UNIQUE NOT NULL,
  `phone_number` varchar(15),
  `created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP) on update CURRENT_TIMESTAMP
);

CREATE TABLE `products` (
  `product_id` int UNSIGNED PRIMARY KEY  AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL UNIQUE,
  `description` text,
  `price` decimal(10,2),
  `created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP) on update CURRENT_TIMESTAMP
);

CREATE TABLE `bills` (
  `bill_id` int UNSIGNED PRIMARY KEY  AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `total` float,
  `status` enum('open','paid','lost') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP) on update CURRENT_TIMESTAMP
);

CREATE TABLE `bill_products` (
  `bill_product_id` int UNSIGNED PRIMARY KEY  AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `bill_id` int UNSIGNED NOT NULL,
  `quantity` int  NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP) on update CURRENT_TIMESTAMP
);

--CREATE TABLE `product_changes` (
 -- `change_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 -- `product_id` int NOT NULL,
 --- `modified_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
--  `change_description` text
--);

--CREATE UNIQUE INDEX `product_changes_index_0` ON `product_changes` (`product_id`);

--ALTER TABLE `bills` ADD FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--ALTER TABLE `bill_products` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--ALTER TABLE `bill_products` ADD FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`);

--ALTER TABLE `product_changes` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--ALTER TABLE `bills` ADD FOREIGN KEY (`bill_id`) REFERENCES `bills` (`total`);

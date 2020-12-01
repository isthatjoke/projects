create database if not exists ozon;

use ozon;

CREATE TABLE users (
  id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  second_name VARCHAR(30) NOT NULL,
  middle_name VARCHAR(30),
  phone VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(60) NOT NULL UNIQUE,
  personal_account DECIMAL(7,2) DEFAULT 0 COMMENT 'Лицевой счет, рубли',
  rights_groups_id TINYINT(1) UNSIGNED NOT NULL COMMENT 'Идентификатор прав пользователя',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_rights_groups_id(rights_groups_id));
  
 
CREATE TABLE profiles (
  id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  users_id INT UNSIGNED NOT NULL,
  gender ENUM('male', 'female', 'NULL') DEFAULT 'NULL',
  city VARCHAR(30) DEFAULT NULL,
  country VARCHAR(30) DEFAULT NULL,
  media_users_id INT UNSIGNED DEFAULT NULL COMMENT 'Фото профиля',
  birth_date DATE NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);


CREATE TABLE buyer_opinions (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 users_id INT UNSIGNED NOT NULL,
 opinion TEXT COMMENT 'Отзыв',
 stars ENUM('1', '2', '3', '4', '5') COMMENT 'По 5-ти бальной шкале',
 products_id INT UNSIGNED NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_stars(stars)) COMMENT = 'Отзыв о товаре';

CREATE TABLE favourites (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 users_id INT UNSIGNED NOT NULL,
 products_id INT UNSIGNED NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_users_id_products_id(users_id, products_id)) COMMENT = 'Избранные товары';

CREATE TABLE main_catalogs (
 id SMALLINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(50) UNIQUE NOT NULL COMMENT 'Название раздела',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Название общего раздела'; 

CREATE TABLE sub_catalogs (
 id SMALLINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 main_catalogs_id SMALLINT UNSIGNED NOT NULL,
 name VARCHAR(70) UNIQUE NOT NULL COMMENT 'Название подраздела',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Название подразделов интернет-магазина'; 
 
CREATE TABLE catalogs (
 id SMALLINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 sub_catalogs_id SMALLINT UNSIGNED NOT NULL,
 name VARCHAR(70) UNIQUE NOT NULL COMMENT 'Название типа товара',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Название раздела товаров по типу товара';

CREATE TABLE products (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 catalogs_id SMALLINT UNSIGNED NOT NULL,
 name VARCHAR(100) UNIQUE NOT NULL,
 description TEXT COMMENT 'Описание товара',
 price DECIMAL(8,2) NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_name(name),
 KEY index_of_price(price))
 COMMENT = 'Товар';
 
CREATE TABLE `attributes` (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(100) UNIQUE NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Типы характеристик';

CREATE TABLE `values` (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 attributes_id INT UNSIGNED NOT NULL,
 value VARCHAR(100) NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_value(value),
 KEY index_of_attributes_id_value(attributes_id, value))
 COMMENT = 'Значения характеристик';

CREATE TABLE links ( 
 id SERIAL PRIMARY KEY,
 products_id INT UNSIGNED NOT NULL,
 media_products_id INT UNSIGNED NOT NULL COMMENT 'Изображение товара',
 attributes_id INT UNSIGNED NOT NULL,
 values_id INT UNSIGNED NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_products_id_attributes_id_values_id
  (products_id, attributes_id, values_id))
 COMMENT = 'Таблица соответствий товаров, характеристик и значений';

CREATE TABLE media_products (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 products_id INT UNSIGNED NOT NULL,
 file_path VARCHAR(255) UNIQUE NOT NULL,
 size INT UNSIGNED NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_products_id(products_id))
 COMMENT = 'Фото товаров';

CREATE TABLE media_users (
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 users_id INT UNSIGNED NOT NULL,
 file_path VARCHAR(255) UNIQUE NOT NULL,
 size INT UNSIGNED NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_users_id(users_id))
 COMMENT = 'Фото профиля';

CREATE TABLE storehauses ( 
 id SMALLINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(100) UNIQUE NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Склады';

CREATE TABLE storehauses_products ( 
 id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 products_id INT UNSIGNED NOT NULL,
 value SMALLINT NOT NULL,
 storehauses_id SMALLINT NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_products_id_value(products_id, value),
 KEY index_of_value(value))
 COMMENT = 'Наличие товара на складе';

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  users_id INT UNSIGNED NOT NULL,
  delivery_status ENUM('yes', 'no') DEFAULT 'no',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP) 
  COMMENT = 'Заказы';

CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  orders_id BIGINT UNSIGNED NOT NULL,
  products_id INT UNSIGNED NOT NULL,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP) 
  COMMENT = 'Состав заказа';

CREATE TABLE `bin` (
  id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cookies_id VARCHAR(255) UNIQUE NOT NULL COMMENT 'Идентификатор cookies',
  logged_in ENUM('yes', 'no') NOT NULL,
  users_id INT UNSIGNED UNIQUE DEFAULT NULL,
  products_id INT UNSIGNED NOT NULL,
  total SMALLINT UNSIGNED DEFAULT 1 COMMENT 'Количество товарных позиций в корзине',
  payed ENUM('yes', 'no') DEFAULT 'no',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP) 
  COMMENT = 'Корзина'; 
 
CREATE TABLE delivery ( 
 id SERIAL PRIMARY KEY,
 orders_id BIGINT UNSIGNED UNIQUE NOT NULL,
 address VARCHAR(255) NOT NULL COMMENT 'Адрес доставки',
 delivery_date DATE NOT NULL COMMENT 'Дата доставки',
 delivery_time VARCHAR(100) NOT NULL COMMENT 'Время доставки, интервал',
 delivery_name VARCHAR(100) NOT NULL COMMENT 'Название курьерской службы',
 delivery_status ENUM('yes', 'no') DEFAULT 'no' COMMENT 'Статус доставки',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY index_of_address(address),
 KEY index_of_delivery_date(delivery_date),
 KEY index_of_delivery_time(delivery_time),
 KEY index_of_delivery_name(delivery_name),
 KEY index_of_delivery_status(delivery_status))
 COMMENT = 'Таблица Доставки';
 
CREATE TABLE discounts (
  id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  products_id INT UNSIGNED NOT NULL,
  discount_percent ENUM('0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9') COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME NOT NULL,
  finished_at DATETIME NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_discount_percent(discount_percent),
  KEY index_of_started_at(started_at),
  KEY index_of_finished_at(finished_at))
  COMMENT = 'Общие скидки';

CREATE TABLE rights_groups (
 id TINYINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(20) UNIQUE NOT NULL)
 COMMENT = 'Группы пользователей по правам доступа'; 
 
CREATE TABLE rights (
 id TINYINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(30) UNIQUE NOT NULL,
 KEY index_of_name(name))
 COMMENT = 'Типы прав доступа и действий';

INSERT INTO rights VALUES
 (NULL, 'Добавлять новую запись'),
 (NULL, 'Удалять свою запись'),
 (NULL, 'Удалять любую запись'),
 (NULL, 'Видеть свою запись'),
 (NULL, 'Видеть любую запись'),
 (NULL, 'Редактировать свою запись'),
 (NULL, 'Редактировать любую запись'),
 (NULL, 'Изменять права');

CREATE TABLE users_rights_groups (
 id TINYINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 db_tables_id TINYINT UNSIGNED NOT NULL,
 rights_id TINYINT UNSIGNED NOT NULL,
 rights_groups_id TINYINT UNSIGNED NOT NULL)
 COMMENT = 'Таблицы соответствия прав доступа по таблицам и группам пользователей';
 
CREATE TABLE db_tables (
 id TINYINT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name VARCHAR(30) UNIQUE NOT NULL,
 KEY index_of_name(name))
 COMMENT = 'Названия таблиц в базе данных';

INSERT INTO db_tables VALUES
 (NULL, 'users'),
 (NULL, 'profiles'),
 (NULL, 'buyer_opinions'),
 (NULL, 'favourites'),
 (NULL, 'main_catalogs'),
 (NULL, 'sub_catalogs'),
 (NULL, 'catalogs'),
 (NULL, 'products'),
 (NULL, 'attributes'),
 (NULL, 'values'),
 (NULL, 'links'),
 (NULL, 'media_products'),
 (NULL, 'media_users'),
 (NULL, 'storehauses'),
 (NULL, 'storehauses_products'),
 (NULL, 'orders'),
 (NULL, 'orders_products'),
 (NULL, 'bin'),
 (NULL, 'delivery'),
 (NULL, 'discounts'),
 (NULL, 'rights'),
 (NULL, 'rights_groups'),
 (NULL, 'users_rights_groups'),
 (NULL, 'db_tables');

ALTER TABLE profiles
  ADD CONSTRAINT profiles_users_id_fk
  FOREIGN KEY (users_id) REFERENCES users(id)
  ON DELETE CASCADE,
  ADD CONSTRAINT profiles_media_users_id_fk
  FOREIGN KEY (media_users_id) REFERENCES media_users(id)
  ON DELETE SET DEFAULT;
  
ALTER TABLE buyer_opinions 
 ADD CONSTRAINT buyer_opinions_users_id_fk
 FOREIGN KEY (users_id) REFERENCES users(id)
 ON DELETE NO ACTION,
 ADD CONSTRAINT buyer_opinions_products_id_fk
 FOREIGN KEY (products_id) REFERENCES products(id)
 ON DELETE NO ACTION;

ALTER TABLE favourites 
 ADD CONSTRAINT favourites_users_id_fk
 FOREIGN KEY (users_id) REFERENCES users(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT favourites_products_id_fk
 FOREIGN KEY (products_id) REFERENCES products(id)
 ON DELETE CASCADE;

ALTER TABLE sub_catalogs 
 ADD CONSTRAINT sub_catalogs_main_catalogs_id_fk
 FOREIGN KEY (main_catalogs_id) REFERENCES main_catalogs(id)
 ON DELETE CASCADE;
 
ALTER TABLE catalogs 
 ADD CONSTRAINT catalogs_sub_catalogs_id_fk
 FOREIGN KEY (sub_catalogs_id) REFERENCES sub_catalogs(id)
 ON DELETE CASCADE;
 
ALTER TABLE products 
 ADD CONSTRAINT products_catalogs_id_fk
 FOREIGN KEY (catalogs_id) REFERENCES catalogs(id)
 ON DELETE CASCADE;
 
ALTER TABLE `values` 
 ADD CONSTRAINT values_attributes_id_fk
 FOREIGN KEY (attributes_id)
 REFERENCES `attributes`(id)
 ON DELETE CASCADE;
 
ALTER TABLE links 
 ADD CONSTRAINT links_products_id_fk
 FOREIGN KEY (products_id) REFERENCES products(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT links_attributes_id_fk
 FOREIGN KEY (attributes_id) REFERENCES `attributes`(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT links_values_id_fk
 FOREIGN KEY (values_id) REFERENCES `values`(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT links_media_products_id_fk
 FOREIGN KEY (media_products_id)
 REFERENCES media_products(id)
 ON DELETE SET DEFAULT;
 
ALTER TABLE media_products 
 ADD CONSTRAINT media_products_products_id_fk
 FOREIGN KEY (products_id) REFERENCES products(id)
 ON DELETE CASCADE;
 
ALTER TABLE media_users 
 ADD CONSTRAINT media_users_users_id_fk
 FOREIGN KEY (users_id) REFERENCES users(id)
 ON DELETE CASCADE;
 
ALTER TABLE storehauses_products 
 ADD CONSTRAINT storehauses_products_products_id_fk
 FOREIGN KEY (products_id) REFERENCES products(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT storehauses_products_storehauses_id_fk
 FOREIGN KEY (storehauses_id) REFERENCES storehauses(id)
 ON DELETE CASCADE;
 
ALTER TABLE storehauses_products MODIFY COLUMN storehauses_id SMALLINT UNSIGNED NOT NULL;
 
ALTER TABLE orders 
  ADD CONSTRAINT orders_users_id
  FOREIGN KEY (users_id) REFERENCES users(id)
  ON DELETE NO ACTION;
  
ALTER TABLE orders_products 
  ADD CONSTRAINT orders_products_orders_id_fk
  FOREIGN KEY (orders_id) REFERENCES orders(id)
  ON DELETE CASCADE,
  ADD CONSTRAINT orders_products_products_id_fk
  FOREIGN KEY (products_id) REFERENCES products(id)
  ON DELETE NO ACTION;
 
ALTER TABLE delivery
 ADD CONSTRAINT delivery_orders_id_fk
 FOREIGN KEY (orders_id) REFERENCES orders(id)
 ON DELETE CASCADE;
 
ALTER TABLE discounts
  ADD CONSTRAINT discounts_products_id_fk
  FOREIGN KEY (products_id) REFERENCES products(id)
  ON DELETE CASCADE;
  
ALTER TABLE users_rights_groups 
  ADD CONSTRAINT users_rights_groups_db_tables_id_fk
  FOREIGN KEY (db_tables_id) REFERENCES db_tables(id)
  ON DELETE CASCADE,
  ADD CONSTRAINT users_rights_groups_rights_id
  FOREIGN KEY (rights_id) REFERENCES rights(id)
  ON DELETE CASCADE,
  ADD CONSTRAINT rights_groups_id
  FOREIGN KEY (rights_groups_id) REFERENCES rights_groups(id)
  ON DELETE CASCADE;
 
ALTER TABLE users 
  ADD CONSTRAINT users_rights_groups_id
  FOREIGN KEY (rights_groups_id) REFERENCES rights_groups(id)
  ON DELETE NO ACTION;

ALTER TABLE `bin`
  ADD CONSTRAINT bin_users_id
  FOREIGN KEY (users_id) REFERENCES users(id)
  ON DELETE CASCADE,
  ADD CONSTRAINT bin_products_id
  FOREIGN KEY (products_id) REFERENCES products(id)
  ON DELETE CASCADE;
 
SHOW tables;

SELECT * FROM `attributes` LIMIT 30;
DESC `attributes`;
UPDATE `attributes` SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM `bin` LIMIT 30;
DESC `bin`;
UPDATE `bin` SET users_id = NULL WHERE logged_in = 'no';
UPDATE `bin` SET updated_at = created_at WHERE created_at > updated_at;
UPDATE `bin` SET payed = 'no' WHERE logged_in = 'no';
UPDATE `bin` SET payed = 'no';

SELECT * FROM buyer_opinions LIMIT 30;
DESC buyer_opinions;
UPDATE buyer_opinions SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM catalogs;
UPDATE catalogs SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM db_tables;
ALTER TABLE db_tables ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE db_tables ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SELECT * FROM delivery LIMIT 30;
UPDATE delivery SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM discounts LIMIT 30;
UPDATE discounts SET finished_at = (SELECT started_at + INTERVAL 7 DAY);

SHOW tables;

SELECT * FROM favourites LIMIT 30;
UPDATE favourites SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM links LIMIT 30;
UPDATE links SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM main_catalogs;
UPDATE main_catalogs SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM media_products LIMIT 30;
DESC media_products;
SELECT COUNT(*) FROM products;
UPDATE media_products SET file_path = @num := @num + 1 WHERE 0 IN (SELECT @num := 0);
UPDATE media_products SET file_path = CONCAT('https://dropbox/ozon/media_products/product_', file_path, '.png'); 
UPDATE media_products SET size = FLOOR(1 + RAND() * 2000000); 

SELECT * FROM media_users LIMIT 30;
UPDATE media_users SET file_path = @num := @num + 1 WHERE 0 IN (SELECT @num := 0);
UPDATE media_users SET file_path = CONCAT('https://dropbox/ozon/media_users/user_', file_path, '.png'); 
UPDATE media_users SET size = FLOOR(1 + RAND() * 2000000); 

SELECT * FROM orders LIMIT 30;
UPDATE orders SET updated_at = created_at WHERE created_at > updated_at;

SHOW tables;

SELECT * FROM orders_products LIMIT 30;
UPDATE orders_products SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM products LIMIT 30;
UPDATE products SET price = 1 + RAND() * 99998 WHERE price = 999999.99;
UPDATE products SET price = 1 + RAND() * 99998 WHERE price = 0;
UPDATE products SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM profiles LIMIT 30;
UPDATE profiles SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM rights;
ALTER TABLE rights ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE rights ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE rights MODIFY COLUMN name VARCHAR(60);
INSERT INTO rights (name) VALUES
 ('Добавлять, удалять, видеть, редактировать свою запись'),
 ('Добавлять, удалять, видеть, редактировать все записи'),
 ('Полный доступ'),
 ('Добавлять, видеть, редактировать свою запись');

SELECT * FROM rights_groups;
ALTER TABLE rights_groups ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE rights_groups ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SELECT * FROM storehauses LIMIT 30;
UPDATE storehauses SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM storehauses_products;
UPDATE storehauses_products SET value = FLOOR(1 + RAND() * 99) WHERE value = 32767;
UPDATE storehauses_products SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM sub_catalogs LIMIT 30;
UPDATE sub_catalogs SET updated_at = created_at WHERE created_at > updated_at;

SELECT * FROM users LIMIT 30;
UPDATE users SET phone = CONCAT('+', FLOOR(1 + RAND() * 9), '(', FLOOR(100 + RAND() * 899), 
  ')', FLOOR(100 + RAND() * 899), '-', FLOOR(10 + RAND() * 89), '-', FLOOR(10 + RAND() * 89));
UPDATE users SET rights_groups_id = 3;
UPDATE users SET rights_groups_id = 1 WHERE id = 6;
UPDATE users SET rights_groups_id = 1 WHERE id = 63;
UPDATE users SET rights_groups_id = 1 WHERE id = 2275;
UPDATE users SET rights_groups_id = 1 WHERE id = 3215;
UPDATE users SET rights_groups_id = 2 WHERE id = 100;
UPDATE users SET rights_groups_id = 2 WHERE id = 101;
UPDATE users SET personal_account = RAND() * 99999 WHERE personal_account = 99999.99;

SELECT * FROM users_rights_groups;
ALTER TABLE users_rights_groups ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users_rights_groups ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
INSERT INTO users_rights_groups (db_tables_id, rights_id, rights_groups_id) VALUES
 ('1', '10', '1'),
 ('2', '10', '1'),
 ('3', '10', '1'),
 ('4', '10', '1'),
('5', '10', '1'),
('6', '10', '1'),
('7', '10', '1'),
('8', '10', '1'),
('9', '10', '1'),
('10', '10', '1'),
('11', '10', '1'),
('12', '10', '1'),
('13', '10', '1'),
('14', '10', '1'),
('15', '10', '1'),
('16', '10', '1'),
('17', '10', '1'),
('18', '10', '1'),
('19', '10', '1'),
('20', '10', '1'),
('21', '5', '1'),
('22', '5', '1'),
('23', '5', '1'),
('24', '5', '1'),
('1', '11', '2'),
('2', '11', '2'),
('3', '11', '2'),
('4', '11', '2'),
('5', '11', '2'),
('6', '11', '2'),
('7', '11', '2'),
('8', '11', '2'),
('9', '11', '2'),
('10', '11', '2'),
('11', '11', '2'),
('12', '11', '2'),
('13', '11', '2'),
('14', '11', '2'),
('15', '11', '2'),
('16', '11', '2'),
('17', '11', '2'),
('18', '11', '2'),
('19', '11', '2'),
('20', '11', '2'),
('21', '11', '2'),
('22', '11', '2'),
('23', '11', '2'),
('24', '11', '2'),
('1', '12', '3'),
('2', '12', '3'),
('3', '9', '3'),
('4', '9', '3'),
('5', '5', '3'),
('6', '5', '3'),
('7', '5', '3'),
('8', '5', '3'),
('9', '5', '3'),
('10', '5', '3'),
('11', '5', '3'),
('12', '5', '3'),
('13', '4', '3'),
('14', '5', '3'),
('15', '5', '3'),
('16', '4', '3'),
('17', '4', '3'),
('18', '4', '3'),
('19', '4', '3'),
('20', '5', '3');

SELECT * FROM `values` LIMIT 30;
UPDATE `values` SET updated_at = created_at WHERE created_at > updated_at;





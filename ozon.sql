create database if not exists ozon;
use ozon;

create table accounts
create table buyer -- указывается информация о сессии для покупок без регистрации
-- информация о пользователе, если залогинился


create table users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  second_name VARCHAR(100) NOT NULL,
  middle_name VARCHAR(100),
  phone VARCHAR(20) NOT NULL UNIQUE,
  mail VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
  
create table profiles (

 user_id SERIAL PRIMARY KEY,
 gender ENUM('мужской', 'женский', NULL),
 city VARCHAR(100),
 country VARCHAR(100),
 birth_date DATE,
 created_at CURRENT_TIMESTAMP,
 updated_at CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

 
create table manufacture (
 id SERIAL PRIMARY KEY,
 name VARCHAR(255) UNIQUE);

create table buyer_opinion (
 id SERIAL PRIMARY KEY,
 user_id SERIAL,
 opinion TEXT,
 product_id INT UNSIGNED,
 created_at CURRENT_TIMESTAMP,
 updated_at CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

create table favorites (
 user_id INT UNSIGNED,
 
 
create table main_catalog (
 id SERIAL,
 name VARCHAR(255) UNIQUE PRIMARY KEY NOT NULL COMMENT 'Название раздела')
 COMMENT = 'Название общего раздела';
 

create table sub_catalog (
 id SERIAL PRIMARY KEY,
 main_catalog_id INT UNSIGNED NOT NULL,
 name VARCHAR(255) NOT NULL COMMENT 'Название подраздела')
 COMMENT = 'Название подразделов интернет-магазина';
 
create table catalogs (
 id SERIAL,
 sub_catalog_id INT UNSIGNED NOT NULL,
 name VARCHAR(255) UNIQUE NOT NULL COMMENT 'Название типа товара')
 COMMENT = 'Название раздела товаров по типу товара';

create table model_line

create table goods (
 id SERIAL,
 catalogs_id INT UNSIGNED NOT NULL,
 name) COMMENT = 'Название товара и отнесение его к категории';
 
create table attribute_values (
 id SERIAL,
 screen_diagonal DECIMAL(2,2),
 ram INT UNSIGNED,
 CPU VARCHAR(30),
 OS VARCHAR(30),
 sim_card INT UNSIGNED,
 resolution VARCHAR(50),
 bat_capacity INT UNSIGNED,
 wireless_type VARCHAR(30)
 )
 COMMENT = 'Типы характеристик';


create products (
 id SERIAL,
 goods_id INT UNSIGNED NOT NULL,
 attribute_values_id INT UNSIGNED NOT NULL COMMENT 'Характеристика товара',
 description TEXT COMMENT 'Описание продукта',
 created_at CURRENT_TIMESTAMP,
 updated_at CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Товар';
 
create table description (
 id SERIAL,
 goods_id INT UNSIGNED NOT NULL,
 description TEXT,
 created_at CURRENT_TIMESTAMP,
 updated_at CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Описание товара';

create table media (
 id SERIAL,
 goods_id INT UNSIGNED NOT NULL, 
 file_path VARCHAR(255),
 created_at CURRENT_TIMESTAMP,
 updated_at CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 COMMENT = 'Фото товара';

create table store_bin
/*
 Если хранить корзину в базе то ее можно реализовывать примерно также, 
 только там в кто заказал будет например идентификатор сессии клиента. 
 Ну и указывать датувремя протухания значений в корзине и с течением времени 
 удалять протухшие или накапливать статистику какие товары чаще всего добавляют в корзину.
 */
create table storehause

create table orders

create table orders_products



 





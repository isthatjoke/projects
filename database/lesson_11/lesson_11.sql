use shop;

/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в 
 * таблицах users, catalogs и products в таблицу logs помещается время и 
 * дата создания записи, название таблицы, идентификатор первичного ключа 
 * и содержимое поля name.*/
desc users;
desc catalogs;
desc products;
select * from users;
select * from catalogs;
select * from products;
show engines;

create table logs (
 table_id INT UNSIGNED NOT NULL,
 table_name VARCHAR(255) NOT NULL,
 name VARCHAR(255),
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP) ENGINE=ARCHIVE;

create trigger new_data_in_users after insert on users
for each row 
BEGIN 
	insert into logs (table_id, name, table_name) values (new.id, new.name, 'users');
END;

create trigger new_data_in_catalogs after insert on catalogs
for each row 
BEGIN 
	insert into logs (table_id, name, table_name) values (new.id, new.name, 'catalogs');
END;

create trigger new_data_in_products after insert on products
for each row 
BEGIN 
	insert into logs (table_id, name, table_name) values (new.id, new.name, 'products');
END;

insert into users (name) values ('Inna');

select * from logs;

/*При помощи базы данных Redis решите задачу поиска имени пользователя по электронному
адресу и наоборот, поиск электронного адреса пользователя по его имени.*/

/*desc users;
alter table users add email VARCHAR(100) after name;
select * from users;
update users set email = 'natalia.beregova@mail.ru' where name = 'Наталья';
update users set email = 'alexander.pal@gmail.com' where name = 'Александр';
update users set email = 'sergey.ivanov@yahoo.com' where name = 'Сергей';
update users set email = 'ivan.durakov@list.ru' where name = 'Иван';
update users set email = 'maria.fedorova@mail.ru' where name = 'Мария';
update users set email = 'kate.shkirdova@gmail.com' where name = 'Kate';
update users set email = 'inna.baranova@mail.ru' where name = 'Inna';*/

redis:
set Наталья natalia.beregova@mail.ru
set Александр alexander.pal@gmail.com
set natalia.beregova@mail.ru Наталья
set alexander.pal@gmail.com Александр
get Наталья
get alexander.pal@gmail.com


/*Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB*/

in mongo
db.shop.insert({"_id" : 1, "name" : "Intel Core i5-7400", 
"description" : "Процессор для настольных персональных компьютеров, основанных на платформе Intel.", 
"price" : 12700.00, "catalog_id" : 1})

db.shop.find({"_id" : 1})
db.shop.find({"name" : "Intel Core i5-7400"})


/* В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*/
set "192.168.1.1" 0
set "127.0.0.1" 0
set "172.32.0.1" 0
incr "192.168.1.1"
decr "192.168.1.1" -- for example










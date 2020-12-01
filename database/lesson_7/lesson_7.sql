use sample;

show tables;

desc orders;

select * from orders;

desc users;

select * from users;

insert into orders (user_id) values
  ('1'),
  ('3');
  
/* Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */
 
select id, name from users where id in (select user_id from orders);

select u.name, 
       o.user_id 
         from 
         users u 
         join 
         orders o
           on u.id = o.user_id ;


/* Выведите список товаров products и разделов catalogs: который соответствует товару.
*/
desc products;
desc catalogs;

select p.name, 
       c.name 
         from products p 
         join catalogs c on p.catalog_id = c.id;


/* (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и 
 * таблица городов cities (label, name). Поля from, to и label содержат 
 * английские названия городов, поле name — русское. Выведите список рейсов 
 * flights с русскими названиями городов.
 */

create table flights (
  id serial primary key,
  `from` varchar(30) not null,
  `to` varchar(30) not null
);

create table cities (
  label varchar(30),
  name varchar(30)
);

insert into flights (`from`, `to`) values
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
 
insert into cities values 
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

desc flights;
desc cities;

select * from flights;
select * from cities;

select c.name `from`, 
       c2.name `to` 
         from flights f 
         join 
         cities c on f.`from` = c.label 
         join 
         cities c2 on f.`to` = c2.label;















  
  
  
  
  
  
  
  
  
  
  










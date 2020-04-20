/*В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
Используйте транзакции.*/

use sample;
select * from users;
desc users;

use shop;

create table users_2 (
  id serial,
  name varchar(255) default null,
  birthday_at date default null,
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update current_timestamp
);
desc users_2;

start transaction;
insert into sample.users_2 select * from shop.users where id = 1;
delete from shop.users where id = 1;
commit;
select * from users_2;
select * from shop.users;

/*Создайте представление, которое выводит название name товарной позиции 
из таблицы products и соответствующее название каталога name из таблицы catalogs.*/
select * from products;
select * from catalogs;
create view prod as select p.name product, c.name catalog_name from shop.products p 
join shop.catalogs c on p.catalog_id = c.id;
show tables;
select * from prod;
drop view prod;

select time_format(now(),"%H:%i:%s");



/*Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop*/

create user user_1 identified with sha256_password by '1234';
create user user_2 identified with sha256_password by '5678';
grant select on shop.* to user_1;
grant all on shop.* to user_2;

show grants;

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

drop function if exists hello;
create function hello()
returns varchar(30) deterministic
begin 
	declare some_text varchar(30);
    if(select curtime() between ("06:00:01") and ("12:00:00")) then
    set some_text = "Доброе утро";
    elseif(select curtime() between ("12:00:01") and ("18:00:00")) then
    set some_text = "Добрый день";
    elseif(select curtime() between ("18:00:01") and ("23:59:59")) then
    set some_text = "Добрый вечер";
    else
    set some_text = "Доброй ночи"; 
	end if;
return some_text;
end;

select hello();



/*В таблице products есть два текстовых поля: name с названием товара 
и description с его описанием. Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

use shop;
desc products;

drop trigger if exists check_prod_null_update;
create trigger check_prod_null_update before update on products
for each row
begin
	if new.name is NULL and new.description is NULL then
	signal sqlstate '45000' set message_text = "using NULL in description and name is forbidden while making update";
end if;
end;

drop trigger if exists check_prod_null_insert;

create trigger check_prod_null_insert before insert on products
for each row
begin 
	if new.name is NULL and new.description is NULL  then
	signal sqlstate '45001' set message_text = "using NULL in description and name is forbidden while making insert";
end if;
end;

select * from products;
update products set name = NULL where id = 1;
update products set description = NULL where id = 1;

insert into products (name, description, price, catalog_id) values (
  NULL, NULL, NULL, '1');



/*(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.*/
 
 
drop function if exists fibonacci;
create function fibonacci(value int)
returns int deterministic
begin 
	declare summ, first_val, second_val, i int;
	set first_val = 1;
	set second_val = 1;
	set i = 0;
	set summ = 0;
    if (value = 0) then
    set summ = 0;
    elseif (value = 1 or value = 2) then 
    set summ = 1;
    elseif (value < 0) then
    set summ = 0;
   else
    set value = value - 2;
	while i < value do
	set summ = first_val + second_val;
	set first_val = second_val;
	set second_val = summ;
	set i = i + 1;
	end while;
	end if;
return summ;
end;

select fibonacci(10); 







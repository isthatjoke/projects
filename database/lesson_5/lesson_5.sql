CREATE DATABASE sample;

USE sample;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(30),
  updated_at VARCHAR(30)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Timur', '1987-05-15'),
  ('Andrey', '1984-02-29'),
  ('Maria', '1990-01-02'),
  ('Anastasia', '1989-01-21'),
  ('Andru', '1989-05-09');

SHOW tables;

DESC users;

SELECT * FROM users;

UPDATE users SET created_at = NOW();
UPDATE users SET updated_at = NOW();

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

UPDATE users SET created_at = ('20.10.2017 8:10') WHERE id = 1;
UPDATE users SET created_at = ('15.02.2004 16:43') WHERE id = 2;
UPDATE users SET created_at = ('27.04.2015 15:23') WHERE id = 3;
UPDATE users SET created_at = ('05.08.2007 4:30') WHERE id = 4;
UPDATE users SET created_at = ('18.02.2001 14:23') WHERE id = 5;

UPDATE users SET updated_at = ('27.11.2017 16:30') WHERE id = 1;
UPDATE users SET updated_at = ('30.08.2012 20:00') WHERE id = 2;
UPDATE users SET updated_at = ('21.05.2017 15:23') WHERE id = 3;
UPDATE users SET updated_at = ('18.10.2008 23:55') WHERE id = 4;
UPDATE users SET updated_at = ('11.09.2001 10:00') WHERE id = 5;

ALTER TABLE users ADD new_created_at DATETIME, ADD new_updated_at DATETIME;

UPDATE users SET
  new_created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i:%s'),
  new_updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i:%s');
 
ALTER TABLE users DROP updated_at, DROP created_at,
  RENAME COLUMN new_created_at TO created_at,
  RENAME COLUMN new_updated_at TO updated_at;



-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

DESC storehouses_products;

INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
  ('1', '1', '4'),
  ('1', '2', '0'),
  ('1', '1', '150'),
  ('2', '2', '300'),
  ('2', '1', '500'),
  ('2', '2', '0');
 
SELECT * FROM storehouses_products ORDER BY value > 1 DESC, value ASC;


-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august'). август заменил на февраль, тк августа в датах не было.

SELECT name, MONTHNAME(birthday_at) AS birthday_month FROM users WHERE MONTHNAME(birthday_at) IN ('May', 'February');

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id = 5 DESC, id = 1 DESC;


-- Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS average_age FROM users;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

ALTER TABLE users ADD year_diff DATE;

UPDATE users SET year_diff = CONCAT(YEAR(CURRENT_DATE()), '-', DATE_FORMAT(birthday_at, '%m-%d'));

SELECT DAYNAME(year_diff) AS week_days, COUNT(DAYNAME(year_diff)) AS count_week_days FROM users GROUP BY DAYNAME(year_diff);

ALTER TABLE users DROP year_diff;

-- (по желанию) Подсчитайте произведение чисел в столбце таблицы

SELECT SUM(value) FROM storehouses_products AS summ;










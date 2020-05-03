use ozon;

-- триггер, срабатыващий после того, как значение об оплате товаров в корзине поменяется на "да"
CREATE TRIGGER payed_order_in_bin AFTER UPDATE ON `bin`
FOR EACH ROW 
BEGIN 
	IF new.payed = 'yes' THEN
	  DROP TEMPORARY TABLE IF EXISTS temp_2;
	  CREATE TEMPORARY TABLE temp_2
	  (id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	  products_id INT UNSIGNED,
      total SMALLINT UNSIGNED DEFAULT 1,
      orders_id BIGINT UNSIGNED);
  	  INSERT INTO temp_2 (products_id, total) 
  	  SELECT new.products_id, new.total FROM `bin`
  	  WHERE payed = 'yes';
  	  INSERT INTO orders (users_id) SELECT users_id FROM `bin`
  	  WHERE payed = 'yes';
	END IF;
END;

-- триггер, срабатывающий после добавления строки в orders_products
CREATE TRIGGER orders_products AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE temp_2 SET orders_id = new.id;
	INSERT INTO orders_products (orders_id, products_id, total)
	SELECT orders_id, products_id, total FROM temp_2;
END;


CALL del_bin_payed(); 



-- процедура удаления строки с меткой оплаты "да" 
CREATE PROCEDURE del_bin_payed()
BEGIN
	DELETE FROM `bin` WHERE payed = 'yes';
END;
-- 
UPDATE `bin` SET payed = 'yes' WHERE id = 1;
-- 



-- процедура очищения корзины по истечении 5 дней
CREATE PROCEDURE del_bin_expired()
BEGIN
	DELETE FROM `bin` WHERE logged_in = 'no' AND updated_at < NOW() - INTERVAL 5 DAY ;
END;


UPDATE discounts SET started_at = NOW() WHERE products_id = 100;
UPDATE discounts SET finished_at = NOW() + INTERVAL 7 DAY WHERE products_id = 100;

-- представление с товарами со скидками
CREATE VIEW discount_products AS SELECT p.name, (p.price * d.discount_percent) AS new_price
 FROM products p
 JOIN discounts d ON d.products_id = p.id
 WHERE started_at > NOW() - INTERVAL 7 DAY;


-- представление с новыми товарами
CREATE VIEW new_products AS SELECT name, price FROM products WHERE updated_at > NOW() - INTERVAL 7 DAY;
SELECT * FROM new_products;



-- найти 10 пользователей, кто сделал большее количество заказов
SELECT CONCAT(first_name, ' ', second_name) AS user,
  (SELECT COUNT(*) FROM orders WHERE users_id = users.id) AS total_orders
    FROM users
    ORDER BY total_orders DESC
    LIMIT 10;
-- подсчитать количество товаров, которые больше всего заказывались
SELECT p.id, p.name, p.price, count(p.id)
	FROM products p
	RIGHT JOIN orders_products op ON op.products_id = p.id
	GROUP BY p.id
	ORDER BY p.id DESC LIMIT 10;

-- вывести список товаров и соответствующих им каталогов, субкаталогов, главного каталога
     
SELECT 
  p.id,
  p.name,
  p.price,
  c.name AS catalog,
  sc.name AS sub_catalog,
  mc.name AS main_catalog
  FROM products AS p
    LEFT JOIN catalogs c ON p.catalogs_id = c.id 
    LEFT JOIN sub_catalogs sc ON c.sub_catalogs_id = sc.id 
    LEFT JOIN main_catalogs mc ON sc.main_catalogs_id = mc.id;
   

-- подсчитать количество товаров в каждом каталоге   
SELECT 
  c.name,
  COUNT(p.id)
  FROM catalogs c
  JOIN products p ON p.catalogs_id = c.id
  GROUP BY c.name;
 
 
/*SELECT DISTINCT p.id, p.name,
   (SELECT )
   FROM orders o
   JOIN orders_products op ON op.orders_id = o.id 
   LEFT JOIN products p ON p.id = op.products_id 
   LEFT JOIN users u ON o.users_id = u.id
   JOIN profiles pr ON pr.users_id = u.id;
*/   
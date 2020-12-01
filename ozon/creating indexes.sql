use ozon;
-- создание индексов
CREATE INDEX users_id_first_name_second_name_idx ON users(id, first_name, second_name);
CREATE INDEX users_rights_groups_id_idx ON users(rights_groups_id);
CREATE INDEX users_id_phone_idx ON users(id, phone);
CREATE INDEX users_id_personal_account_idx ON users(id, personal_account);

CREATE INDEX profiles_users_id_idx ON profiles(users_id);
CREATE INDEX profiles_city_idx ON profiles(city);
CREATE INDEX profiles_country_idx ON profiles(country);
CREATE INDEX profiles_media_users_id_idx ON profiles(media_users_id);
CREATE INDEX profiles_birth_date_idx ON profiles(birth_date);

CREATE INDEX buyer_opinions_users_id_idx ON buyer_opinions(users_id);
CREATE INDEX buyer_opinions_products_id_idx ON buyer_opinions(products_id);

CREATE INDEX favourites_users_id_idx ON favourites(users_id);
CREATE INDEX favourites_products_id_idx ON favourites(products_id);

CREATE INDEX sub_catalogs_main_catalogs_id_name_idx ON sub_catalogs(main_catalogs_id, name);
CREATE INDEX sub_catalogs_main_catalogs_id_idx ON sub_catalogs(main_catalogs_id);

CREATE INDEX catalogs_sub_catalogs_id_name_idx ON catalogs(sub_catalogs_id, name);
CREATE INDEX catalogs_sub_catalogs_id_idx ON catalogs(sub_catalogs_id);

CREATE INDEX products_catalogs_id_name_idx ON products(catalogs_id, name);
CREATE INDEX products_catalogs_id_idx ON products(catalogs_id);
CREATE INDEX products_name_price_idx ON products(name, price);

CREATE INDEX values_attributes_id_idx ON `values`(attributes_id);

CREATE INDEX links_products_id_idx ON links(products_id);
CREATE INDEX links_media_products_id_idx ON links(media_products_id);
CREATE INDEX links_attributes_id_idx ON links(attributes_id);
CREATE INDEX links_values_id_idx ON links(values_id);

CREATE INDEX media_products_products_id_file_path_idx ON media_products(products_id, file_path);

CREATE INDEX media_users_users_id_file_path_idx ON media_users(users_id, file_path);

CREATE INDEX storehauses_products_products_id_idx ON storehauses_products(products_id);
CREATE INDEX storehauses_products_storehauses_id_idx ON storehauses_products(storehauses_id);

CREATE INDEX orders_users_id_idx ON orders(users_id);

CREATE INDEX orders_products_orders_id_idx ON orders_products(orders_id);
CREATE INDEX orders_products_orders_id_products_id_idx ON orders_products(orders_id, products_id);
CREATE INDEX orders_products_orders_id_products_id_total_idx ON orders_products(orders_id, products_id, total);
CREATE INDEX orders_products_products_id_total_idx ON orders_products(products_id, total);

CREATE INDEX bin_products_id_total_idx ON `bin`(products_id, total);
CREATE INDEX bin_users_id_idx ON `bin`(users_id);
CREATE INDEX bin_products_id_idx ON `bin`(products_id);

DROP INDEX index_of_delivery_status ON delivery;
CREATE INDEX delivery_orders_id_address_date_time_name_idx ON
 delivery(orders_id, address, delivery_date, delivery_time, delivery_name);

CREATE INDEX discounts_products_id_idx ON discounts(products_id);
CREATE INDEX discounts_products_id_discount_percent_idx ON discounts(products_id, discount_percent);

CREATE INDEX users_rights_groups_db_tables_id_idx ON users_rights_groups(db_tables_id);
CREATE INDEX users_rights_groups_rights_id_idx ON users_rights_groups(rights_id);
CREATE INDEX users_rights_groups_db_tables_id_rights_id_rights_groups_id_idx ON
 users_rights_groups(db_tables_id, rights_id, rights_groups_id);




   
   
   
   
   
   
   
   



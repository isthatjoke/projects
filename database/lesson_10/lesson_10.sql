use vk;
select * from target_types limit 10;
show tables;
desc communities; -- +
desc communities_users; -- 
desc friendship; --
desc friendship_statuses; -- 
desc likes; -- +
desc media; -- +
desc media_types; -- 
desc messages; -- +
desc posts; -- +
desc profiles; -- +
desc target_types; -- 
desc users; -- +
drop index users_phone on users;
create unique index communities_name_idx on communities(name);
create index likes_target_id on likes(target_id);
create unique index media_user_id_file_path_idx on media(user_id, file_path);
create index messages_from_user_id_to_user_id_idx on messages(from_user_id, to_user_id);
create index messages_to_user_id_from_user_id on messages(to_user_id, from_user_id);
create index posts_head on posts(head);
create index profiles_city_country on profiles(city, country);
create index profiles_city on profiles(city);
create index profiles_gender on profiles(gender);
create index users_first_name_last_name on users(first_name, last_name);
create index users_first_name on users(first_name);
create index users_last_name on users(last_name);
create unique index users_email on users(email);
create unique index users_phone on users(phone);





/*Проанализировать какие запросы могут выполняться наиболее часто в процессе 
работы приложения и добавить необходимые индексы.*/




/*
Построить запрос, который будет выводить следующие столбцы:
имя группы +
среднее количество пользователей в группах
самый молодой пользователь в группе +
самый пожилой пользователь в группе +
количество пользователей в группе +
всего пользователей в системе +
отношение в процентах (количество пользователей в группе / всего пользователей в системе) * 100 +
*/


 
select distinct c.name, (select count(*) from users) total_users, 
  (select count(*) from communities) total_communities,
  count(cu.user_id) over (partition by c.id) users_in_group,
  first_value(u.first_name) over (partition by c.id order by p.birthdate desc) name_oldest,
  max(p.birthdate) over (partition by c.id) oldest,
  first_value(u.first_name) over (partition by c.id order by p.birthdate asc) name_youngest,
  min(p.birthdate) over (partition by c.id) yuongest,
  count(cu.user_id) over (partition by c.id) / (select count(*) from users) * 100 '%%'
from communities c 
join communities_users cu on cu.community_id = c.id
left join profiles p on p.user_id = cu.user_id
join users u on u.id = p.user_id;


















 

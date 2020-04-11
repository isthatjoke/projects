use vk;
desc users;
desc profiles;

alter table profiles
  add constraint profiles_user_id_fk
  foreign key (user_id)
  references users (id)
  on delete cascade;

alter table profiles
  add constraint profiles_photo_id_fk
  foreign key (photo_id)
  references media (id)
  on delete SET DEFAULT;
 
desc media;

alter table media
  add constraint media_media_type_id_fk
  foreign key (media_type_id)
  references media_types (id)
  on delete cascade;
 
alter table media
  add constraint media_user_id_fk
  foreign key (user_id)
  references users (id)
  on delete cascade;

show tables;

desc friendship;

alter table friendship
  add constraint friendship_status_id_fk
  foreign key (status_id)
  references friendship_statuses (id)
  on delete SET DEFAULT
  on update CASCADE;
 
alter table friendship
  add constraint friendship_user_id_fk
  foreign key (user_id)
  references users (id)
  on delete cascade;
 
alter table friendship
  add constraint friendship_friend_id_fk
  foreign key (friend_id)
  references users (id)
  on delete cascade;
 
desc communities_users;

desc communities;

alter table communities_users
  add constraint communities_users_user_id_fk
  foreign key (user_id)
  references users (id)
  on delete cascade; 
 
alter table communities_users
  add constraint communities_users_community_id_fk
  foreign key (community_id)
  references communities (id)
  on delete cascade;
 
show tables;

desc messages;

alter table messages
  add constraint messages_from_user_id_fk
  foreign key (from_user_id)
  references users (id),
  add constraint messages_to_user_id_fk
  foreign key (to_user_id)
  references users (id);


/* use to del fk  
  alter table communities_users
  drop foreign key user_id_fk;
*/  
  

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 200)), 
    FLOOR(1 + (RAND() * 200)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

-- Проверим
SELECT count(*) FROM likes;

-- Создадим таблицу постов
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

desc posts;

alter table posts
  add constraint posts_user_id_fk
    foreign key (user_id)
      references users (id)
        on delete cascade,
  add constraint posts_community_id_fk
    foreign key (community_id)
      references communities (id)
        on delete cascade,
  add constraint posts_media_id_fk
    foreign key (media_id)
      references media_types (id)
        on delete SET DEFAULT;

desc likes;

alter table likes
  add constraint likes_user_id_fk
    foreign key (user_id)
      references users (id)
        on delete set DEFAULT,
  add constraint likes_target_type_id_fk
    foreign key (target_type_id)
      references target_types (id)
        on delete set DEFAULT;
       
/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.
*/

select from_user_id, count(*) summ
  from messages 
    where to_user_id = 93 and from_user_id in 
      (select user_id from friendship 
        where friend_id = 93 and status_id = (
          select id from friendship_statuses where name = 'confirmed'))
    group by from_user_id
    order by summ desc limit 1;

insert into messages (from_user_id, to_user_id, body, is_important, is_delivered) values
 ('28', '93', 'hello there', '1', '0'),
 ('28', '93', 'are u there?', '0', '1'),
 ('58', '93', 'hey, my darling', '0', '1');

insert into friendship (user_id, friend_id, status_id) values
 ('28', '93', '3'),
 ('58', '93', '3');
       
/*
Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/

select sum(lc.likes_count) likes_count from  
  (select 
    (select count(*) from likes 
      where user_id = p.user_id) as likes_count
    from profiles p
    order by birthdate desc limit 10)lc;  

/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/ 

select lik.gender, sum(lik.likes_count) as likes_count 
  from
   (select gender, 
   (select count(*) from likes 
     where user_id = p.user_id) as likes_count
       from profiles p)lik
    group by lik.gender
    order by likes_count desc limit 1;
   
/*
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
*/


select id, (temp.summ_mess + temp.summ_likes) summ_all from 
  (select id, 
    (select count(*) from messages 
      where from_user_id = u.id) summ_mess, 
    (select count(*) from likes 
      where target_id = u.id) summ_likes
    from users u)temp
  order by summ_all desc limit 10;



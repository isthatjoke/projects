/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.
*/
select * from friendship_statuses; 
desc users;
desc friendship_statuses;
select first_name from users where id in (28, 58, 151, 26, 86, 120);
select * from friendship where friend_id = 93;
select * from friendship where user_id = 93;

select tmp.first_name, count(*) summ from (select u.id, first_name from users u 
  join messages m on u.id = from_user_id
  join friendship f ON u.id = f.user_id where friend_id = 93 
  and status_id = (select fs.id from friendship_statuses fs where name = "confirmed") 
  and m.to_user_id = 93)tmp
   group by first_name
   order by summ desc limit 1;
  
  
select tmp.first_name, count(*) summ from (select u.id, first_name from users u 
  join messages m on u.id = from_user_id
  join friendship f ON u.id = f.user_id where f.friend_id in (select user_id from friendship where user_id = 93 or friend_id = 93)
  and status_id = (select fs.id from friendship_statuses fs where name = "confirmed") 
  and m.to_user_id = 93)tmp
   group by first_name
   order by summ desc limit 1;

select first_name, f.friend_id, fs.id, count(*)
  from users u 
  join friendship f on f.friend_id = u.id
  join friendship_statuses fs on fs.id = 3
  join messages m on from_user_id = f.friend_id 
  where f.user_id = 93 and m.to_user_id = 93
  group by first_name, f.friend_id, fs.id;
 
/*select distinct first_name, m.body 
  from users u 
  join messages m on m.from_user_id = u.id 
  join friendship f on f.status_id = 3 and f.friend_id = u.id or f.user_id = u.id;
*/ 
select tmp.name id, count(tmp.body) from (select distinct m.from_user_id name, m.body 
  from friendship f 
  right join messages m on m.to_user_id = 93
  where f.status_id = 3 and f.friend_id = 93 or f.user_id = 93)tmp
  group by id;
 
 select * from messages where to_user_id = 93;
 
/*
Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/
select sum(summ_likes) likes_summary from (select tmp.summ summ_likes from 
(select u.id, u.first_name, count(*) summ, p.birthdate day_of_birth from users u
join
profiles p on u.id = p.user_id 
left join 
likes l on u.id = target_id where target_type_id = (select id from target_types where name = "users")
group by u.id, u.first_name, p.birthdate)tmp
order by tmp.day_of_birth desc limit 10) summ_likes;

/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/ 

select gender, count(*) summ from 
  profiles p 
  join 
  likes l on p.user_id = l.user_id
  group by gender
  order by summ desc limit 1;

/*
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
*/


select tmp.id, sum(summ_mess) summary from
  ((select u.id, count(*) summ_mess
    from users u
  join
    messages m on u.id = m.from_user_id 
   group by u.id)
  union
   (select u.id, count(*) summ_likes
    from users u
  join 
    likes l on u.id = l.user_id
   group by u.id)) tmp
  group by tmp.id
  order by summary asc limit 10;
 
-- the correct answer is below

select tmp.id, (tmp.summ_mess + tmp.summ_likes) summ from 
(select u.id id, count(distinct(m.id)) summ_mess, count(distinct(l.id)) summ_likes from users u
left join messages m on m.from_user_id = u.id 
join likes l on l.user_id = u.id
group by u.id)tmp
order by summ asc limit 10;

select * from messages m where m.from_user_id = 172;
select * from likes l where l.user_id = 172;

select * from messages limit 10;


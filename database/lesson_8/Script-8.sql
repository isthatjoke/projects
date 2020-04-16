/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.
*/
select * from friendship_statuses; 
desc users;
desc friendship_statuses;

select tmp.first_name, count(*) summ from (select u.id, first_name from users u 
  join messages m on u.id = from_user_id
  join friendship f ON u.id = f.user_id where friend_id = 93 
  and status_id = (select fs.id from friendship_statuses fs where name = "confirmed") 
  and m.to_user_id = 93)tmp
   group by first_name
   order by summ desc limit 1;

/*
Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/
select sum(summ_likes) likes_summary from (select tmp.summ summ_likes from 
(select u.id, u.first_name, count(*) summ, p.birthdate day_of_birth from users u
join
profiles p on u.id = p.user_id 
join 
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






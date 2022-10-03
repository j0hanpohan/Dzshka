-- 1) Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

select firstname, lastname from users join messages
	where from_user_id = users.id and to_user_id = 2
	group by firstname, lastname
	order by count(from_user_id) desc limit 1;
	
-- 2) Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

select profiles.user_id, profiles.birthday from profiles join posts
WHERE posts.user_id = profiles.user_id AND TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;


--- 3) Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT CASE (gender)
        WHEN 'm' THEN 'male'
        WHEN 'f' THEN 'female'
    	END AS 'gender',count(*)  as 'likes'
FROM profiles
JOIN
posts_likes 
WHERE profiles.user_id = posts_likes.user_id
GROUP BY gender ;





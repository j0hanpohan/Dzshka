-- 1) Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

select firstname, lastname from users join messages
	where from_user_id = users.id and to_user_id = 2
	group by firstname, lastname
	order by count(from_user_id) desc limit 1;


	-- 2) Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

-- нахожу пользователей младше 10 лет
select user_id  from profiles where timestampdiff(year, birthday, now()) < 10;

-- нахожу их посты 
select user_id from posts where user_id in (7,9);
-- в результате постов нет и получить лайки они не могли 


-- 3) Определить кто больше поставил лайков (всего): мужчины или женщины.

-- Получилась полная ерунда , но я пытался
select like_type, case(gender)  
when 'f' then 'female'
when 'm' then 'male'
when 'x' then 'not defined'
end 
from profiles join posts_likes
where like_type = 1
group by gender
order by count(like_type) desc; 
 

-- Пробные варианты
select user_id from posts_likes where like_type = 1;

select user_id, gender from profiles where gender = 'm'; 
select user_id, gender from profiles where gender = 'f';

select count(*) , gender from profiles group by gender;
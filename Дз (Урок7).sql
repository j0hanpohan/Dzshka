-- 1)Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- заполняю таблицу orders
insert into orders values
(default, 1, default, default),
(default, 1, default, default),
(default, 1, default, default);
insert into orders values
(default, 0, default, default);

-- решение
select name from users
join orders where user_id = orders.id
having count(user_id) > 0;
-- не пойму , что здесь не так 

-- c вложенным запрос тоже че то не то получается 
select id, 
	name 
from users where id in (select user_id from orders);

-- 2) Выведите список товаров products и разделов catalogs, который соответствует товару.

select id,
	name,
	price,
	(select name from catalogs where id = products.catalog_id) as catalogs
from products ;


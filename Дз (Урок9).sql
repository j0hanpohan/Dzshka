-- 1) Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

start transaction;
insert into sample.users select * from shop.users where id = 1;
commit;

-- 2)Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

create or replace view products_catalogs as
select p.name as product,
	c.name as catalog 
	from products as p 
	join catalogs as c
	on p.catalog_id = c.id;

select * from products_catalogs;
-- 1) Заполняю таблицы
insert into users (firstname, lastname, email, phone)
values ('Сергей','Сергеев','qwe@asdf.qw',123123123),
('Ирина','Кийко','cattack2@unc.edu',2139527247),
('Виктория','Водопьянова','scasotti3@usgs.gov',4187011526),
('Пётр','Иванов','13sss51jpalfreeman11@example.com',6843424170),
('Аноним','Анонимов5','anonymous5@anonymous.qw',123123123),
('Дмитрий','Тимашов','segginton4@cam.ac.uk',4513359033),
('Владислав','Авраменко','aswaddle5@altervista.org',1874462339),
('Алексей','Величко','fleahey6@ftc.gov',2951798252),
('Артем','Филипцов','rcasley7@exblog.jp',3237322265),
('Елена','Колдаева','rlantry8@pen.io',3731144657);

insert into profiles (gender , birtday, city , country )
values ('m', 1923-02-12, 'Moscow', 'Russian'),
('m', 1953-03-02, 'Moscow', 'Russian'),
('m', 1993-12-02, 'Moscow', 'Russian'),
('f', 1984-04-12, 'Moscow', 'Russian'),
('m', 1983-07-22, 'Spb', 'Russian'),
('f', 1999-11-11, 'Omsk', 'Russian'),
('f', 1989-08-15, 'Rastov', 'Russian'),
('f', 1963-12-09, 'Moscow', 'Russian'),
('m', 1993-11-23, 'Oms', 'Russian'),
('f', 1987-05-19, 'Soshi', 'Russian');

-- 2) Выбираю имена без повторений в алфовитном порядке
select distinct * from users order by firstname;

-- 3)Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных 
alter table profiles add column is_active boolean default true;
update profiles 
set is_active = 0
where timestampdiff(year, birtday, curdate()) < 18;

-- 4)Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
delete from messages where created_at < current_timestamp();
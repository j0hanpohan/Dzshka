create database vk;

use vk;

show TABLES;

create table users(
	id bigint unsigned auto_increment primary key,
	firstname varchar(150) not null,
	lastname varchar(150) not null,
	email varchar(150) not null unique,
	phone char(11) not null unique,
	password_hash char(65) default null,
	created_at datetime not null default current_timestamp
);

insert users values (1, 'Petya', 'Petushov', 'petya"mail.ru', '89522636763', null, default);
insert users values (default, 'Vasya', 'Vasilkov', 'vasya"mail.ru', '89212347272', default, default);

select * from users;

drop table if exists profiles;

create table profiles(
	user_id bigint unsigned primary key,
	gender enum('f', 'm', 'x') not null,
	birtday date not null,
	photo_id bigint unsigned,
	city varchar(130),
	country varchar(130),
	foreign key (user_id) references users (id)
);

insert profiles values (1, 'm', '1993-02-12', null, 'Moscow', 'Russian');
insert profiles values (2, 'm', '1989-11-08', null, 'Moscow', 'Russian');

select * from profiles;

create table messages(
	id serial primary key,
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	txt text not null,
	is_delivered boolean default false,
	created_at datetime not null default now(),
	updated_at datetime default current_timestamp on update current_timestamp,
	foreign key (from_user_id) references users (id),
	foreign key (to_user_id) references users (id)
);

insert messages values (default, 1, 2, 'привет', default, default, default);
insert messages values (default, 1, 2, 'ау', default, default, default);
insert messages values (default, 2, 1, 'хай', default, default, default);

select * from messages;


create table friend_requests(
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	accepted bool default false,
	primary key (from_user_id, to_user_id),
	constraint fk_friend_requests_from_user_id foreign key (from_user_id) references users (id),
	constraint fk_friend_requests_to_user_id foreign key (to_user_id) references users (id)
);

insert friend_requests values (1, 2, default);

insert friend_requests values (2, 1, default);

select * from friend_requests;

create table communities(
	id serial primary key,
	name varchar(150) not null,
	description varchar(255),
	admin_id bigint unsigned not null,
	index (name),
	foreign key (admin_id) references user (id)
);

insert communities values (default, 'грязь', 'мы любим', 1);
insert communities values (default, 'гномы', 'маленькие люди', 1);

select * from communities;

create table communities_users(
	community_id bigint unsigned not null,
	user_id bigint unsigned not null,
	created_at datetime not null default current_timestamp,
	primary key (community_id, user_id),
	foreign key (community_id) references communities (id),
	foreign key (user_id) references users (id)
);

insert communities_users values (1, 2, default);

create table media_types (
	id int auto_increment primary key,
	name varchar(50) not null unique
);

insert into media_types values (default, 'изображения');
insert into media_types values (default, 'музыка');
insert into media_types values (default, 'документы');

create table media (
	id serial primary key,
	user_id bigint unsigned not null,
	file_name varchar(255) not null  comment '/files/folder/img.png',
	file_size bigint unsigned,
	media_types_id int not null,
	created_at datetime not null default now(),
	foreign key (user_id) references users (id),
	foreign key (media_types_id) references media_types (id)
);

insert media values (default, 1, 'text.jpg', 100, 1, default);
insert media values (default, 1, 'text.jpg', 120, 1, default);


insert media values (default, 2, 'text.doc', 500, 3, default);

select * from media;

alter table profiles add column is_active bit default false null;




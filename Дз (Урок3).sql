create table music (
	id serial primary key,
	user_id bigint unsigned not null,
	file_name varchar(255) not null,
	file_size bigint unsigned,
	media_types_id int not null,
	created_at datetime not null default now(),
	foreign key (user_id) references users (id),
	foreign key (media_types_id) references media_types (id)
);

create table calls (
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	accepted bool default false,
	foreign key (from_user_id) references users (id),
	foreign key (to_user_id) references users (id)
);

create table  news (
	id serial primary key,
	txt text not null,
	created_at datetime not null default now(),
	updated_at datetime default current_timestamp on update current_timestamp,
	foreign key (user_id) references users (id)
);
create table procuratio.users (
    id int auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null,
    user_name varchar(100) not null,
    password char(60) not null,
    constraint users_user_name_uindex unique (user_name)
);
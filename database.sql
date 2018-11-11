create database ar;

create table dishes (
  id serial primary key,
  name varchar(100) not null,
  obj text,
  mtl text,
  image varchar(100),
  description text,
  price numeric(4,2)
);

create table users (
id serial primary key,
user_name varchar(50),
user_password text
);

create table orders (
id serial primary key,
user_id int,
foreign key (user_id) references users (id)
);

create table dishes_orders (
id serial primary key,
user_id int,
dish_id int,
foreign key (user_id) references users (id),
foreign key (dish_id) references dishes (id),
quantity int not null
);

alter table dishes add column category varchar(100);

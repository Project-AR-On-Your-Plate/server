create database ar;

create table dishes (
  id serial primary key,
  image varchar(100),
  description text,
  price numeric(4,2),
  category varchar(100),
  dish_name varchar(100),
  url text
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
dish_id int,
quantity int not null,
order_id int,
foreign key (order_id) references orders (id),
foreign key (dish_id) references dishes (id)
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/pmGBEfwi1b2jwL6lb29uE_pmGIlBy9Mt8Dsz-_wwZSk_N16JRCLbqRxOlAr1JS-v',
'Assorted sushi set with salmon nigiri,salmon uramaki, California uramaki.',
12,
'main',
'Assorted sushi',
'https://poly.googleapis.com/downloads/bWRnM-3pmS5/bbJIjF-59Ut'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/GewMgUIDU24-ViwS2osK4SF2GUGZkJdyKdXN8fYuAYx0Xu-WPbxfRwcLwH2k9IY',
'Chipotle rubbed chicken. Habanero & pumpkin seed salsa.',
7.5,
'main',
'Grilled chicken tacos',
'https://poly.googleapis.com/downloads/33nYH5Sdxqb/1Qr8ITDI3b9'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/CZ6ZmNxWH6XDb98Uy52Wpg0YBWTZQVIvzQcPBCVxeLYFVtDKHjWug5lMet86Jwwa4A',
'Finger sandwiches, scones with clotted cream and jam, sweet pastries and cakes.',
21.5,
'main',
'Afternoon tea',
'https://poly.googleapis.com/downloads/2cX88a40PMz/fqrE8mMo9fi'
);

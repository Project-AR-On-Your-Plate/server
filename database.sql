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

alter table dishes drop column url;
alter table dishes add column obj text;
alter table dishes add column mtl text;

update dishes set obj='https://lh3.googleusercontent.com/pmGBEfwi1b2jwL6lb29uE_pmGIlBy9Mt8Dsz-_wwZSk_N16JRCLbqRxOlAr1JS-v/model.obj' where id =1;
update dishes set mtl='https://lh3.googleusercontent.com/pmGBEfwi1b2jwL6lb29uE_pmGIlBy9Mt8Dsz-_wwZSk_N16JRCLbqRxOlAr1JS-v/materials.mtl' where id =1;

update dishes set obj='https://lh3.googleusercontent.com/GewMgUIDU24-ViwS2osK4SF2GUGZkJdyKdXN8fYuAYx0Xu-WPbxfRwcLwH2k9IY/model.obj' where id =2;
update dishes set mtl='https://lh3.googleusercontent.com/GewMgUIDU24-ViwS2osK4SF2GUGZkJdyKdXN8fYuAYx0Xu-WPbxfRwcLwH2k9IY/materials.mtl' where id =2;
update dishes set category='starter' where id =2;
delete from dishes where id=3;

  insert into dishes values (
  default,
  'https://lh3.googleusercontent.com/H9uT-g2uXMRdAGlCjuRuhG1Leogxjvn7sf6HM4LkTo-tlAHC4AQSECLgtEr8GfA-Jg',
  'It is made from cured pork and beef mixed together and seasoned with paprika or other chili pepper. Pepperoni Pizza is characteristically soft, slightly smoky, and bright red in color.',
  9.49,
  'main',
  'Pepperoni Pizza',
  'https://poly.googleapis.com/downloads/1A7p4z5tJd9/1Qp8zjEst0G/model.obj',
  'https://poly.googleapis.com/downloads/1A7p4z5tJd9/1Qp8zjEst0G/materials.mtl'
  );
  insert into dishes values (
  default,
 'https://lh3.googleusercontent.com/GqNhzRx7s157WQERy6v5_1oTRXoSS28C6afzeCU3TesGuTLkU_aZFRkKomwez7fN',
 'Crème caramel dessert is a custard dessert with a layer of clear caramel sauce.',
 6,
 'dessert',
 'Flan',
 'https://poly.googleapis.com/downloads/6_9ioxcIar4/65nomqSWV47/Flan_01.obj',
 'https://poly.googleapis.com/downloads/6_9ioxcIar4/65nomqSWV47/Flan_01.mtl'
 );

 insert into dishes values (
 default,
 'https://lh3.googleusercontent.com/gcc3kmMm_N_FGkjVw0o1qgLmc3anHb26EgGkBaDyqKdj62YYgfCC9jQWkOg5yEY5',
 'A shish kebab is a skewer with meat and vegetables and is grilled. It has lamb, green peppers, onions, and mushrooms.',
 7,
 'main',
 'Shish keba',
 'https://poly.googleapis.com/downloads/6uTsH2jqgVn/arWtwoZ4eSS/Shishkebab_251.obj',
 'https://poly.googleapis.com/downloads/6uTsH2jqgVn/arWtwoZ4eSS/Shishkebab_251.mtl'
 );

 insert into dishes values (
 default,
 'https://lh3.googleusercontent.com/ciwQjPD-iB7c_ZzaO7d5S9Gqxcm9HXEd0-u_HF2rOZEBeHbm03l9qsQLIYSQ-vq1rg',
 'All their beef is from the Argentinian Pampas.',
 17,
 'main',
 'Fillet steak',
 'https://poly.googleapis.com/downloads/8EnDRHkPSXG/5x8u0E0vKgD/Steak_245.obj',
 'https://poly.googleapis.com/downloads/8EnDRHkPSXG/5x8u0E0vKgD/Steak_245.mtl'
 );

 insert into dishes values (
default,
'https://lh3.googleusercontent.com/k00KQIMNXJqkXxqbGpUUzcgMdDFkxqVINYg18q88PkGuCWUzpPIJcYRL-x9PTcC9',
'Steamed crawfish.',
15.5,
'main',
'Crawfish',
'https://poly.googleapis.com/downloads/ct4Z0kUIHdT/9QIqKfubrNc/NOVELO_CRAYFISH.obj',
'https://poly.googleapis.com/downloads/ct4Z0kUIHdT/9QIqKfubrNc/NOVELO_CRAYFISH.mtl'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/jfSpge6AmpvOadB86nOnOA7s2CkKbSqh7a8PYwHxDy0r9px3Nuo_cKLmo-kfqFdiJA',
'Burger with beef and vegetables, large chips and large soft drink (coke, fanta, sprite or water).',
5.99,
'main',
'Burger, chips and soft drink.',
'https://poly.googleapis.com/downloads/87iQkav6g6f/931m9fonjuP/model.obj',
'https://poly.googleapis.com/downloads/87iQkav6g6f/931m9fonjuP/materials.mtl'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/hVTi1BASgzrX2zv41gpg3IyOnwrLsli_FMzcZLfrrNgHXxR2oqjKUmFd2aVx3_igXg',
'Chorizo, sweet pepper pearls, roasted peppers, sweetcorn, tortilla chips, ranch dressing.',
4.69,
'starter',
'Salad Bowl',
'https://poly.googleapis.com/downloads/9lnNCNuF5w0/4A5TYe-U8sg/model.obj',
'https://poly.googleapis.com/downloads/9lnNCNuF5w0/4A5TYe-U8sg/materials.mtl'
);


delete from dishes_orders;
delete from dishes where id=1;
delete from dishes where id=2;

  insert into dishes values (
  default,
  'https://lh3.googleusercontent.com/pmGBEfwi1b2jwL6lb29uE_pmGIlBy9Mt8Dsz-_wwZSk_N16JRCLbqRxOlAr1JS-v',
  'Crispy Soft Shell Crab with a delicate burst of Flying Fish Roe, Avocado and a dash of Mayonnaise.',
  15,
  'main',
  'Assorted sushi',
  'https://poly.googleapis.com/downloads/bWRnM-3pmS5/bbJIjF-59Ut/model.obj',
  'https://poly.googleapis.com/downloads/bWRnM-3pmS5/bbJIjF-59Ut/materials.mtl'
  );

  insert into dishes values (
default,
'https://lh3.googleusercontent.com/GewMgUIDU24-ViwS2osK4SF2GUGZkJdyKdXN8fYuAYx0Xu-WPbxfRwcLwH2k9IY',
'Tacos is a traditional Mexican dish in which crunchy or soft corn tortillas are stuffed with meat, fresh veg or seafood with tasty taco seasoning, crisp lettuce, grated cheese and a dash of tangy salsa.',
7.49,
'starter',
'Tacos',
'https://poly.googleapis.com/downloads/33nYH5Sdxqb/1Qr8ITDI3b9/model.obj',
'https://poly.googleapis.com/downloads/33nYH5Sdxqb/1Qr8ITDI3b9/materials.mtl'
);

delete from dishes where id =7;
delete from dishes where id =8;
delete from dishes where id =9;

  insert into dishes values (
  default,
  'https://lh3.googleusercontent.com/1ZEYWeKXgaFLzKcdp24GfqX3flrmvlxqEoIsqg5CGQi_mu3NC4dDD2J59blst1g',
  'It is wonderful eaten in golden shards or crumbled into the best vanilla ice cream.',
  5.49,
  'dessert',
  'Honeycomb',
  'https://poly.googleapis.com/downloads/1eRck4iVlMy/3x0vbmLyc5a/model.obj',
  'https://poly.googleapis.com/downloads/1eRck4iVlMy/3x0vbmLyc5a/materials.mtl'
  );

  insert into dishes values (
default,
'https://lh3.googleusercontent.com/lTy9k6wFtEttR9Je74WRweDBwKfb2cA8MM9BbCgdMxErzHyZxC2U-8Uebp_z6C3p',
'6 donuts with yellow cream on top.',
6.00,
'dessert',
'Donuts',
'https://poly.googleapis.com/downloads/2Pa18cw09ou/b95cr6zBiTT/model.obj',
'https://poly.googleapis.com/downloads/2Pa18cw09ou/b95cr6zBiTT/materials.mtl'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/pXEeGMQxGQEQWEEgXOxK4BBs1txC4P4fYwrfAXkTMZvGHO3kesiXxaAm3vDb1LGNTg',
'Chocolate cake with marshmallows.',
9.99,
'dessert',
'Cake',
'https://poly.googleapis.com/downloads/arJdqW51n24/fzXIgGvvNz7/Cake.obj',
'https://poly.googleapis.com/downloads/arJdqW51n24/fzXIgGvvNz7/Cake.mtl'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/CcIvhqbQCP9rEd1IW0KndqK83vOwSF078v0p2C0YY1w8pmbR1uV8iUWAVLFZ9SXu',
'Dancing hotdog with mustard',
4.99,
'starter',
'Dancing hotdog',
'https://poly.googleapis.com/downloads/24ZH95hPHKK/es9OGQ_BoV5/model.obj',
'https://poly.googleapis.com/downloads/24ZH95hPHKK/es9OGQ_BoV5/materials.mtl'
);

insert into dishes values (
default,
'https://lh3.googleusercontent.com/KbBiylLH5G5OkO4sooKbGyN06tEHiMjyZnSXw8a2uxaDqX3WZv2CgoNeWX-lsmJWwg',
'6 cups of juice - different tastes!',
7.49,
'starter',
'Fresh juice',
'https://poly.googleapis.com/downloads/5-EjPXozm2Q/bhBm_z4awYz/juice.obj',
'https://poly.googleapis.com/downloads/5-EjPXozm2Q/bhBm_z4awYz/juice.mtl'
);

delete from dishes where id =15;
delete from dishes where id =13;

update dishes set dish_name='Burger, chips and drink' where id=9;
update dishes set dish_name='Salad bowl' where id=10;
update dishes set dish_name='Pepperoni pizza' where id=4;

alter table dishes add column quantity int;
update dishes set quantity=0;

alter table users drop column user_password;
alter table users add column phone varchar(50);

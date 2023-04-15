create table db_country(
	country_id serial not null primary key,
	name varchar(20) not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
);

create table db_department(
	department_id serial not null primary key,
	name varchar(30) not null,
	country_id integer not null,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint fk_country_id foreign key (country_id) references db_country (country_id)
);

create table db_city (
	city_id serial not null primary key,
	name varchar(30) not null,
	department_id integer not null,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint fk_department_id foreign key (department_id) references db_department (department_id)
);

create table db_location (
	location_id serial not null primary key,
	name varchar(30) not null,
	city_id integer not null,
	address varchar(50),
	entry_date date not null,
	phone_number varchar(11),
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint fk_city_id foreign key (city_id) references db_city (city_id)
);

create table inv_product_x_location (
	location_id integer not null,
	product_id integer not null,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint fk_location_id foreign key (location_id) references db_location (location_id),
	constraint fk_product_id foreign key (product_id) references inv_product (product_id),
	constraint pk_product_x_location_id primary key (location_id, product_id)
)

create table inv_product(
	product_id serial not null primary key,
	name varchar(50) not null,
	batch varchar(10) not null,
	quantity integer not null,
	date date not null,
	description varchar(50),
	price varchar(50) not null,
	unit_value varchar(50) not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
	
);

create table inv_suplier(
	supplier_id serial not null primary key,
	name varchar(30) not null,
	phone_number integer,
	email varchar(50),
	creation_date date not null,
	creation_user_id varchar (50) not null
);

create table inv_product_X_suplier(
	order_id integer not null primary key,
	supplier_id integer not null,
	product_id integer not null,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint fk_supplier_id foreign key (supplier_id) references inv_suplier (supplier_id),
	constraint fk_product_id foreign key (product_id) references inv_product (product_id)
);

create table db_permission (
	permission_id integer not null primary key,
	name varchar(20) not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
)

create table db_permission_x_role(
	role_id integer not null ,
	permission_id integer not null ,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint pk_permission_x_role_id primary key (role_id, permission_id),
	constraint fk_role_id foreign key (role_id) references db_role (role_id),
	constraint fk_permission_id foreign key (permission_id) references db_permission (permission_id)
)

create table db_role (
	role_id integer not null primary key,
	name varchar(30) not null,
	permission_id varchar(30) not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
)

create table db_user_x_role(
	role_id integer not null ,
	user_id integer not null ,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint pk_user_x_role_id primary key (role_id, user_id),
	constraint fk_role_id foreign key (role_id) references db_role (role_id),
	constraint fk_user_id foreign key (user_id) references db_user (user_id)
)

create table db_user (
	user_id integer not null primary key,
	username varchar(20) not null,
	mail varchar(30) not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
)

create table db_user_x_session(
	session_id integer not null ,
	user_id integer not null ,
	creation_user_id varchar(50) not null,
	creation_date date not null,
	constraint pk_user_x_session_id primary key (session_id, user_id),
	constraint fk_session_id foreign key (session_id) references db_session (session_id),
	constraint fk_user_id foreign key (user_id) references db_user (user_id)
)

create table db_session(
	session_id integer not null primary key,
	date date not null,
	creation_user_id varchar(50) not null,
	creation_date date not null
)



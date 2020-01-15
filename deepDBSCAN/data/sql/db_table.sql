drop table photo_xy;

create table photo_xy(
	photo_hash_value varchar unique,
	owner_id varchar not null,
	photo_id bigint not null,
	gps_time timestamp,
	photo_direction float,
	lonlat point,
	file_path varchar not null,
	exif json not null,
	primary key(owner_id, photo_id)
);

drop table photo_direction;

create table photo_direction(
	photo_hash_value varchar unique,
	user_id varchar not null,
	photo_id bigint not null,
	gps_time timestamp,
	photo_direction float not null,
	distance float,
	lonlat point,
	dest_lonlat point,
	file_path varchar not null,
	intersection_points text[], 
	primary key(user_id, photo_id)
);
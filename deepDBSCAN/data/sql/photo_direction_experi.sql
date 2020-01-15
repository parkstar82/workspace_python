drop table photo_direction_min0_max100;
drop table photo_direction_min0_max200;
drop table photo_direction_min0_max300;
drop table photo_direction_min0_max400;
drop table photo_direction_min0_max500;
drop table photo_direction_min10_max100;
drop table photo_direction_min10_max200;
drop table photo_direction_min10_max300;
drop table photo_direction_min10_max400;
drop table photo_direction_min10_max500;
drop table photo_direction_min20_max100;
drop table photo_direction_min20_max200;
drop table photo_direction_min20_max300;
drop table photo_direction_min20_max400;
drop table photo_direction_min20_max500;
drop table photo_direction_min30_max100;
drop table photo_direction_min30_max200;
drop table photo_direction_min30_max300;
drop table photo_direction_min30_max400;
drop table photo_direction_min30_max500;
drop table photo_direction_min40_max100;
drop table photo_direction_min40_max200;
drop table photo_direction_min40_max300;
drop table photo_direction_min40_max400;
drop table photo_direction_min40_max500;
drop table photo_direction_min50_max100;
drop table photo_direction_min50_max200;
drop table photo_direction_min50_max300;
drop table photo_direction_min50_max400;
drop table photo_direction_min50_max500;

create table photo_direction_min0_max100(
	photo_hash_value varchar unique,
	user_id varchar not null,
	photo_id bigint not null,
	gps_time timestamp,
	photo_direction float not null,
	min_dist float,
	max_dist float,
	lonlat point,
	min_dest_lonlat point,
	max_dest_lonlat point,
	file_path varchar not null,
	intersection_points text[], 
	primary key(user_id, photo_id)
);
create table photo_direction_min0_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min0_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min0_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min0_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min10_max100(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min10_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min10_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min10_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min10_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min20_max100(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min20_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min20_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min20_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min20_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min30_max100(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min30_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min30_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min30_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min30_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min40_max100(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min40_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min40_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min40_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min40_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min50_max100(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min50_max200(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min50_max300(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min50_max400(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));
create table photo_direction_min50_max500(	photo_hash_value varchar unique,	user_id varchar not null,	photo_id bigint not null,	gps_time timestamp,	photo_direction float not null,	min_dist float,	max_dist float,	lonlat point,	min_dest_lonlat point,	max_dest_lonlat point,	file_path varchar not null,	intersection_points text[],	primary key(user_id, photo_id));

-- Noise 제거
select count(*) from photo_direction_min50_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0
select count(*) from photo_direction_min50_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3
select count(*) from photo_direction_min50_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8
select count(*) from photo_direction_min50_max500

delete from photo_direction_min0_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min0_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min0_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min0_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min0_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min0_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min0_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min0_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min0_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min0_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min0_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min0_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min0_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min0_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min0_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min10_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min10_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min10_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min10_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min10_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min10_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min10_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min10_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min10_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min10_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min10_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min10_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min10_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min10_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min10_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min20_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min20_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min20_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min20_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min20_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min20_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min20_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min20_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min20_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min20_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min20_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min20_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min20_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min20_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min20_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min30_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min30_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min30_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min30_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min30_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min30_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min30_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min30_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min30_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min30_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min30_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min30_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min30_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min30_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min30_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min40_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min40_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min40_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min40_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min40_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min40_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min40_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min40_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min40_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min40_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min40_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min40_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min40_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min40_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min40_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min50_max100 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min50_max100 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min50_max100 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min50_max200 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min50_max200 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min50_max200 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min50_max300 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min50_max300 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min50_max300 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min50_max400 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min50_max400 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min50_max400 where lonlat[1] > 42.2 or lonlat[1] < 39.8;
delete from photo_direction_min50_max500 where lonlat[0] = 17056881.853375 or lonlat[0] = 0;
delete from photo_direction_min50_max500 where lonlat[0] < -74.9 or lonlat[0] > -72.3;
delete from photo_direction_min50_max500 where lonlat[1] > 42.2 or lonlat[1] < 39.8;

-- Noise 제거 끝

-- 테이블 좌표 geometry 속성으로 추가 변환
ALTER TABLE photo_direction_min0_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min0_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min0_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

ALTER TABLE photo_direction_min10_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min10_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min10_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

ALTER TABLE photo_direction_min20_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min20_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min20_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

ALTER TABLE photo_direction_min30_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min30_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min30_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

ALTER TABLE photo_direction_min40_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min40_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min40_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

ALTER TABLE photo_direction_min50_max100 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max100 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max100 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max100 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max100 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max100 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max200 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max200 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max200 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max200 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max200 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max200 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max300 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max300 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max300 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max300 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max300 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max300 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max400 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max400 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max400 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max400 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max400 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max400 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max500 add column geom_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max500 set geom_lonlat = ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max500 add column geom_min_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max500 set geom_min_dest_lonlat = ST_SetSRID(st_makePoint(min_dest_lonlat[0], min_dest_lonlat[1]), 4326);
ALTER TABLE photo_direction_min50_max500 add column geom_max_dest_lonlat geometry(Point, 4326);
update 	    photo_direction_min50_max500 set geom_max_dest_lonlat = ST_SetSRID(st_makePoint(max_dest_lonlat[0], max_dest_lonlat[1]), 4326);

select * from photo_direction_min50_max500 limit 1
-- 테이블 좌표 geometry 속성으로 추가 변환 끝

-- 테이블 속성 변환 json으로
-- alter table photo_direction alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min0_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min0_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min0_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min0_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min0_max500 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min10_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min10_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min10_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min10_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min10_max500 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min20_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min20_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min20_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min20_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min20_max500 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min30_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min30_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min30_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min30_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min30_max500 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min40_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min40_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min40_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min40_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min40_max500 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min50_max100 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min50_max200 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min50_max300 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min50_max400 alter column intersection_points type text USING intersection_points::text;
alter table photo_direction_min50_max500 alter column intersection_points type text USING intersection_points::text;

update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min0_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min0_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min0_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min0_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min0_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min0_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min0_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min0_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min0_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min0_max500 alter column intersection_points type json using intersection_points::json;

update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min10_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min10_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min10_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min10_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min10_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min10_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min10_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min10_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min10_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min10_max500 alter column intersection_points type json using intersection_points::json;

update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min20_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min20_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min20_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min20_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min20_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min20_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min20_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min20_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min20_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min20_max500 alter column intersection_points type json using intersection_points::json;

update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min30_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min30_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min30_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min30_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min30_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min30_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min30_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min30_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min30_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min30_max500 alter column intersection_points type json using intersection_points::json;

update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min40_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min40_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min40_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min40_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min40_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min40_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min40_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min40_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min40_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min40_max500 alter column intersection_points type json using intersection_points::json;

update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min50_max100 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min50_max100 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min50_max200 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min50_max200 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min50_max300 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min50_max300 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min50_max400 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min50_max400 alter column intersection_points type json using intersection_points::json;
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, '(''', '"');
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, ''',"''', ' ');
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, '''): (', '":"');
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, '",', ',');
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, '),', '",');
update      photo_direction_min50_max500 set intersection_points = replace(intersection_points, ')', '"');
alter table photo_direction_min50_max500 alter column intersection_points type json using intersection_points::json;

select user_id, photo_id, json_each_text(intersection_points) as point_value
from photo_direction_min50_max500
limit 100;
-- 테이블 속성변환 끝

-- QGIS용 coip table 만들기
select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min0_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min0_max100, json_each_text(photo_direction_min0_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min0_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min0_max200, json_each_text(photo_direction_min0_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min0_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min0_max300, json_each_text(photo_direction_min0_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min0_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min0_max400, json_each_text(photo_direction_min0_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min0_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min0_max500, json_each_text(photo_direction_min0_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min10_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min10_max100, json_each_text(photo_direction_min10_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min10_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min10_max200, json_each_text(photo_direction_min10_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min10_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min10_max300, json_each_text(photo_direction_min10_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min10_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min10_max400, json_each_text(photo_direction_min10_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min10_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min10_max500, json_each_text(photo_direction_min10_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min20_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min20_max100, json_each_text(photo_direction_min20_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min20_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min20_max200, json_each_text(photo_direction_min20_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min20_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min20_max300, json_each_text(photo_direction_min20_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min20_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min20_max400, json_each_text(photo_direction_min20_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min20_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min20_max500, json_each_text(photo_direction_min20_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min30_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min30_max100, json_each_text(photo_direction_min30_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min30_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min30_max200, json_each_text(photo_direction_min30_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min30_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min30_max300, json_each_text(photo_direction_min30_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min30_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min30_max400, json_each_text(photo_direction_min30_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min30_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min30_max500, json_each_text(photo_direction_min30_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min40_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min40_max100, json_each_text(photo_direction_min40_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min40_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min40_max200, json_each_text(photo_direction_min40_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min40_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min40_max300, json_each_text(photo_direction_min40_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min40_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min40_max400, json_each_text(photo_direction_min40_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min40_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min40_max500, json_each_text(photo_direction_min40_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min50_max100
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min50_max100, json_each_text(photo_direction_min50_max100.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min50_max200
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min50_max200, json_each_text(photo_direction_min50_max200.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min50_max300
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min50_max300, json_each_text(photo_direction_min50_max300.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min50_max400
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min50_max400, json_each_text(photo_direction_min50_max400.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select uid1, pid1, uid2, pid2, lon, lat, geom into table photo_coip_min50_max500
from (
	select
		user_id as uid1,
		photo_id as pid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.key, ' ', 2) as pid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction_min50_max500, json_each_text(photo_direction_min50_max500.intersection_points) as point_value
)as aa;
--where aa.uid1 != aa.uid2

select * from photo_coip_min50_max500 limit 1
-- QGIS용 coip table 만들기 끝

-- make line table
drop table photo_direction_min0_max100_line;
drop table photo_direction_min0_max200_line;
drop table photo_direction_min0_max300_line;
drop table photo_direction_min0_max400_line;
drop table photo_direction_min0_max500_line;
drop table photo_direction_min10_max100_line;
drop table photo_direction_min10_max200_line;
drop table photo_direction_min10_max300_line;
drop table photo_direction_min10_max400_line;
drop table photo_direction_min10_max500_line;
drop table photo_direction_min20_max100_line;
drop table photo_direction_min20_max200_line;
drop table photo_direction_min20_max300_line;
drop table photo_direction_min20_max400_line;
drop table photo_direction_min20_max500_line;
drop table photo_direction_min30_max100_line;
drop table photo_direction_min30_max200_line;
drop table photo_direction_min30_max300_line;
drop table photo_direction_min30_max400_line;
drop table photo_direction_min30_max500_line;
drop table photo_direction_min40_max100_line;
drop table photo_direction_min40_max200_line;
drop table photo_direction_min40_max300_line;
drop table photo_direction_min40_max400_line;
drop table photo_direction_min40_max500_line;
drop table photo_direction_min50_max100_line;
drop table photo_direction_min50_max200_line;
drop table photo_direction_min50_max300_line;
drop table photo_direction_min50_max400_line;
drop table photo_direction_min50_max500_line;

-- select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_line from photo_direction;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min0_max100_line from photo_direction_min0_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min0_max200_line from photo_direction_min0_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min0_max300_line from photo_direction_min0_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min0_max400_line from photo_direction_min0_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min0_max500_line from photo_direction_min0_max500;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min10_max100_line from photo_direction_min10_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min10_max200_line from photo_direction_min10_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min10_max300_line from photo_direction_min10_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min10_max400_line from photo_direction_min10_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min10_max500_line from photo_direction_min10_max500;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min20_max100_line from photo_direction_min20_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min20_max200_line from photo_direction_min20_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min20_max300_line from photo_direction_min20_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min20_max400_line from photo_direction_min20_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min20_max500_line from photo_direction_min20_max500;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min30_max100_line from photo_direction_min30_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min30_max200_line from photo_direction_min30_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min30_max300_line from photo_direction_min30_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min30_max400_line from photo_direction_min30_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min30_max500_line from photo_direction_min30_max500;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min40_max100_line from photo_direction_min40_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min40_max200_line from photo_direction_min40_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min40_max300_line from photo_direction_min40_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min40_max400_line from photo_direction_min40_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min40_max500_line from photo_direction_min40_max500;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min50_max100_line from photo_direction_min50_max100;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min50_max200_line from photo_direction_min50_max200;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min50_max300_line from photo_direction_min50_max300;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min50_max400_line from photo_direction_min50_max400;
select user_id, photo_id, min_dist, max_dist, ST_MakeLine(geom_min_dest_lonlat, geom_max_dest_lonlat) into table photo_direction_min50_max500_line from photo_direction_min50_max500;

-- Make Line Table 끝

-----------------------------------------------------------------------
-- photo_coip_geom에 있는 geom 포인트들에 대해 DBSCAN 수행하여 테이블로 저장
-----------------------------------------------------------------------
create table photo_coip_dbscan_300_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom)
) AS cluster_geom, 
array_agg(uid1) AS ids_in_cluster,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom)
	), true
) AS area
FROM (
    SELECT uid1, ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 300, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_geom
) sq
where cid>= 0
GROUP BY cid
order by cid

-----------------------------------------------------------------------
-- CoIP 개수 
-----------------------------------------------------------------------
select count(*) from photo_coip_min0_max100;
select count(*) from photo_coip_min0_max200;
select count(*) from photo_coip_min0_max300;
select count(*) from photo_coip_min0_max400;
select count(*) from photo_coip_min0_max500;
select count(*) from photo_coip_min10_max100;
select count(*) from photo_coip_min10_max200;
select count(*) from photo_coip_min10_max300;
select count(*) from photo_coip_min10_max400;
select count(*) from photo_coip_min10_max500;
select count(*) from photo_coip_min20_max100;
select count(*) from photo_coip_min20_max200;
select count(*) from photo_coip_min20_max300;
select count(*) from photo_coip_min20_max400;
select count(*) from photo_coip_min20_max500;
select count(*) from photo_coip_min30_max100;
select count(*) from photo_coip_min30_max200;
select count(*) from photo_coip_min30_max300;
select count(*) from photo_coip_min30_max400;
select count(*) from photo_coip_min30_max500;
select count(*) from photo_coip_min40_max100;
select count(*) from photo_coip_min40_max200;
select count(*) from photo_coip_min40_max300;
select count(*) from photo_coip_min40_max400;
select count(*) from photo_coip_min40_max500;
select count(*) from photo_coip_min50_max100;
select count(*) from photo_coip_min50_max200;
select count(*) from photo_coip_min50_max300;
select count(*) from photo_coip_min50_max400;
select count(*) from photo_coip_min50_max500;

-----------------------------------------------------------------------
-- 통계를 위한 SQL
-- ROA 개수
-----------------------------------------------------------------------
-- min50 max 100
-- 100m
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_25 where ids_in_cluster_unique_length >=3;
-- 200m
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_200_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_200_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_200_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_200_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_200_25 where ids_in_cluster_unique_length >=3;
-- 300m
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_300_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_300_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_300_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_300_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_300_25 where ids_in_cluster_unique_length >=3;
-- 400m
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_400_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_400_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_400_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_400_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_400_25 where ids_in_cluster_unique_length >=3;
-- 500m
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_500_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_500_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_500_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_500_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_500_25 where ids_in_cluster_unique_length >=3;
-- min0 max 500
-- 100m
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_100_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_100_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_100_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_100_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_100_25 where ids_in_cluster_unique_length >=3;
-- 200m
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_200_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_200_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_200_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_200_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_200_25 where ids_in_cluster_unique_length >=3;
-- 300m
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_300_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_300_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_300_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_300_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_300_25 where ids_in_cluster_unique_length >=3;
-- 400m
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_400_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_400_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_400_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_400_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_400_25 where ids_in_cluster_unique_length >=3;
-- 500m
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_500_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_500_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_500_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_500_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min0_max500_dbscan_500_25 where ids_in_cluster_unique_length >=3;
-- min30 max 200
-- 100m
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_100_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_100_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_100_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_100_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_100_25 where ids_in_cluster_unique_length >=3;
-- 200m
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_200_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_200_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_200_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_200_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_200_25 where ids_in_cluster_unique_length >=3;
-- 300m
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_300_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_300_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_300_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_300_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_300_25 where ids_in_cluster_unique_length >=3;
-- 400m
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_400_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_400_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_400_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_400_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_400_25 where ids_in_cluster_unique_length >=3;
-- 500m
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_500_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_500_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_500_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_500_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min30_max200_dbscan_500_25 where ids_in_cluster_unique_length >=3;
-- min20 max 300
-- 100m
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_100_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_100_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_100_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_100_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_100_25 where ids_in_cluster_unique_length >=3;
-- 200m
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_200_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_200_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_200_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_200_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_200_25 where ids_in_cluster_unique_length >=3;
-- 300m
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_300_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_300_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_300_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_300_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_300_25 where ids_in_cluster_unique_length >=3;
-- 400m
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_400_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_400_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_400_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_400_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_400_25 where ids_in_cluster_unique_length >=3;
-- 500m
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_500_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_500_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_500_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_500_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min20_max300_dbscan_500_25 where ids_in_cluster_unique_length >=3;
-- min10 max 400
-- 100m
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_100_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_100_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_100_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_100_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_100_25 where ids_in_cluster_unique_length >=3;
-- 200m
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_200_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_200_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_200_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_200_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_200_25 where ids_in_cluster_unique_length >=3;
-- 300m
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_300_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_300_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_300_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_300_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_300_25 where ids_in_cluster_unique_length >=3;
-- 400m
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_400_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_400_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_400_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_400_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_400_25 where ids_in_cluster_unique_length >=3;
-- 500m
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_5 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_10 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_15 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_20 where ids_in_cluster_unique_length >=3;
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_25 where ids_in_cluster_unique_length >=3;

-- roa 개수, 평균 면적
select count(*), trunc(avg(area)) from photo_coip_min10_max400_dbscan_500_25 where ids_in_cluster_unique_length >=3;
select * from photo_coip_min10_max400_dbscan_500_25 where ids_in_cluster_unique_length >=3 order by ids_in_cluster_unique_length desc;
select count(*), trunc(avg(area)) from photo_coip_min50_max100_dbscan_100_5 where ids_in_cluster_unique_length >=3;

select avg(array_length(ids_in_cluster, 1)) from photo_lonlat_dbscan2_100_5
select avg(array_length(ids_in_cluster, 1)) from photo_lonlat_dbscan2_100_15
						   
						   
						   
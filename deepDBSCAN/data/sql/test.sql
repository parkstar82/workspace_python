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

INSERT INTO public.photo_direction(
	photo_hash_value, user_id, photo_id, gps_time, photo_direction, distance, lonlat, dest_lonlat, file_path, intersection_points)
	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO public.photo_xy(
	photo_hash_value, user_id, photo_id, gps_time, photo_direction, lonlat, file_path, exif)
	VALUES (?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO photo_xy(user_id, photo_id, file_path, exif)
	VALUES ('32121816@N00', 29992174853, 'filepath', '{"GPSInfo":{"1":"N","2":[[41,1],[11,1],[3234,100]],"3":"W","4":[[73,1],[52,1],[2956,100]],"5":"\u0001","6":[3656,5265],"7":[[0,1],[34,1],[1002,100]],"12":"K","13":[39,100],"16":"T","17":[48329,141],"23":"T","24":[48329,141],"29":"2016:10:28","31":[30,1]},"ResolutionUnit":2,"ExifOffset":204,"Make":"Apple","Model":"iPhone SE","Software":"9.3.2","Orientation":1,"DateTime":"2016:10:27 20:34:11","YCbCrPositioning":1,"XResolution":[72,1],"YResolution":[72,1],"ExifVersion":"0221","ComponentsConfiguration":"\u0001\u0002\u0003\u0000","ShutterSpeedValue":[13229,3386],"DateTimeOriginal":"2016:10:27 20:34:11","DateTimeDigitized":"2016:10:27 20:34:11","ApertureValue":[7983,3509],"BrightnessValue":[-3859,1707],"ExposureBiasValue":[0,1],"MeteringMode":5,"Flash":16,"FocalLength":[83,20],"ColorSpace":1,"ExifImageWidth":4032,"FocalLengthIn35mmFilm":29,"SceneCaptureType":0,"ExifImageHeight":3024,"SubsecTimeOriginal":"261","SubsecTimeDigitized":"261","SubjectLocation":[2015,1511,2217,1330],"SensingMethod":2,"ExposureTime":[1,15],"FNumber":[11,5],"SceneType":"\u0001","ExposureProgram":2,"ISOSpeedRatings":400,"ExposureMode":0,"FlashPixVersion":"0100","WhiteBalance":0,"LensSpecification":[[83,20],[83,20],[11,5],[11,5]],"LensMake":"Apple","LensModel":"iPhone SE back camera 4.15mm f\/2.2","MakerNote":""}');

INSERT INTO photo_direction(user_id,photo_id,lonlat,photo_direction,gps_time,distance,dest_lonlat,file_path,intersection_points) 
VALUES ('100005580@N05', '39947380453', 
		'(-74.00047222222223, 40.708938888888895)', 
		153.11, 
		'2019-01-19 13:16:34', 
		'0.2', 
		'(-73.99940029147726,40.707336512136585)',
		'0.ResearchData\x12.flickr_images\newyork_radius_100km_ori\\images\\100005580@N05_39947380453.jpg', 
		'{}');



INSERT INTO photo_xy(photo_hash_value,user_id,photo_id,lonlat,photo_direction,gps_time,file_path,exif) 
VALUES ('ffffc5903e3c3900', 
		'10000701@N05', 
		'5318188150', 
		'(0.0,0.0)', 
		'0.00', 
		'2011-01-02 13:41:03', 
		'0.ResearchData\\22.flickr_images\\newyork_radius_100km_ori\\no_exif\\10000701@N05_5318188150.jpg', 
		'{"ResolutionUnit":2,"ExifOffset":228,"Make":"NIKON CORPORATION","Model":"NIKON D40","Software":"Adobe Photoshop CS3 Windows","Orientation":1,"DateTime":"2011:01:02 11:56:56","YCbCrPositioning":2,"XResolution":[3000000,10000],"YResolution":[3000000,10000],"ExifVersion":"0221","ComponentsConfiguration":"\\u0001\\u0002\\u0003\\u0000","CompressedBitsPerPixel":[4,1],"DateTimeOriginal":"2011:01:02 13:41:03","DateTimeDigitized":"2011:01:02 13:41:03","ExposureBiasValue":[30,6],"MaxApertureValue":[16,10],"MeteringMode":5,"LightSource":0,"Flash":0,"FocalLength":[350,10],"UserComment":"ASCII\\u0000\\u0000\\u0000                                    ","ColorSpace":1,"ExifImageWidth":3008,"ExifInteroperabilityOffset":852,"SceneCaptureType":0,"SubsecTime":"50","SubsecTimeOriginal":"50","SubsecTimeDigitized":"50","ExifImageHeight":2000,"SubjectDistanceRange":0,"SensingMethod":2,"FileSource":"\\u0003","ExposureTime":[10,800],"FNumber":[18,10],"SceneType":"\\u0001","ExposureProgram":1,"CFAPattern":"\\u0000\\u0002\\u0000\\u0002\\u0002\\u0001\\u0001\\u0000","CustomRendered":0,"ISOSpeedRatings":400,"ExposureMode":1,"FlashPixVersion":"0100","WhiteBalance":0,"DigitalZoomRatio":[1,1],"FocalLengthIn35mmFilm":52,"GainControl":1,"Contrast":0,"Saturation":0,"Sharpness":0}'
	   );



-- empire state building
-- lat 40.748501, lon -73.985789

select *, (Point('-73.985789', '40.748501') <@> lonlat) 
from photo_direction
where (Point('-73.985789', '40.748501') <@> lonlat) < 1000 limit 1;


select concat(user_id ,'_', photo_id), user_id
from photo_direction
where (Point('-73.985789', '40.748501') <@> lonlat) < 0.5 
order by user_id;

-----------  photo_direction DATA 정리 -----------
-- noise 제거
delete from photo_direction where lonlat[0] = 17056881.853375 or lonlat[0] = 0
select * from photo_direction 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

delete from photo_direction 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

select * from photo_direction 
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8

delete from photo_direction
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8
rollback

select * from photo_direction limit 10;
select count(*) from photo_direction;
-- 테이블 속성 변환
--select ST_SetSRID(st_makePoint(lonlat[0], lonlat[1]), 4326) from photo_direction limit 1;
ALTER TABLE photo_direction add column geom_lonlat geometry(Point, 4326);
update photo_direction 
set geom_lonlat = 
	ST_SetSRID(
		st_makePoint(
			lonlat[0], 
			lonlat[1]
		), 
		4326
);

ALTER TABLE photo_direction add column geom_dest_lonlat geometry(Point, 4326);
update photo_direction 
set geom_dest_lonlat = 
ST_SetSRID(
	st_makePoint(
		dest_lonlat[0], 
		dest_lonlat[1]
	), 
	4326
);

select * from photo_direction limit 1000;

--- file path 변경
-- "0.ResearchData\22.flickr_images\newyork_radius_100km_ori\images\35802634@N03_8177490116.jpg"
-- D:\flickr_image\images
select file_path from photo_direction limit 1
update photo_direction set file_path = replace(file_path, '0.ResearchData\22.flickr_images\newyork_radius_100km_ori\images','D:\flickr_image\images');

-----------  photo_direction DATA 정리 끝 -----------

--truncate table photo_xy;
--truncate table photo_direction;

create table uuid_test (photo_hash_value uuid);
insert into uuid_test (photo_hash_value) values ('ffffc5903e3c3900'); 

-- POST GIS 사용
create extension cube;
create extension earthdistance;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_sfcgal;
CREATE EXTENSION fuzzystrmatch; --needed for postgis_tiger_geocoder
--optional used by postgis_tiger_geocoder, or can be used standalone
CREATE EXTENSION address_standardizer;
CREATE EXTENSION address_standardizer_data_us;
CREATE EXTENSION postgis_tiger_geocoder;
CREATE EXTENSION postgis_topology;

-- make line table
drop table photo_direction_line
select user_id, photo_id, ST_MakeLine(geom_lonlat, geom_dest_lonlat)
into table photo_direction_line
from photo_direction;

select * from photo_direction_line limit 10;

-- make intersection point list
--select user_id, photo_id, ST_Make


select cast(intersection_points AS json)
from photo_direction
limit 10;

select lonlat, lonlat[0], lonlat[1]
from photo_direction
limit 1;

-- table 속성 변환 text[] to json
select user_id, photo_id, intersection_points
from photo_direction
--where user_id = '100044644@N05' and photo_id = '15372817465'
order by user_id
limit 10;

update 
	photo_direction
set
	--intersection_points = replace(intersection_points, '(''', '"')
-- 	intersection_points = replace(intersection_points, ''',"''', ' ')
-- 	intersection_points = replace(intersection_points, '''): (', '":"')
-- 	intersection_points = replace(intersection_points, '",', ',')
-- 	intersection_points = replace(intersection_points, '),', '",')
	intersection_points = replace(intersection_points, ')', '"')
where
	user_id = '100044644@N05' and photo_id = '15372817465';

select user_id, photo_id, intersection_points
from photo_direction
where user_id = '100044644@N05' and photo_id = '15372817465';

select
	user_id, photo_id, intersection_points::json
from photo_direction
where user_id = '100044644@N05' and photo_id = '15372817465'

-- "100044644@N05"	"15372817465"	"{('100044644@N05',"'32784873691'): (-74.44809133200299",40.34128700294289)}"
alter table photo_direction
alter column intersection_points type text USING intersection_points::text;

update 
	photo_direction
set
	intersection_points = replace(intersection_points, '(''', '"');

update 
	photo_direction
set
	intersection_points = replace(intersection_points, ''',"''', ' ');

update 
	photo_direction
set
	intersection_points = replace(intersection_points, '''): (', '":"');

update 
	photo_direction
set
	intersection_points = replace(intersection_points, '",', ',');

update 
	photo_direction
set
	intersection_points = replace(intersection_points, '),', '",');

update 
	photo_direction
set
	intersection_points = replace(intersection_points, ')', '"');


alter table photo_direction
alter column intersection_points type json using intersection_points::json;

-- 테이블 속성변환 끝

select user_id, photo_id, json_each_text(intersection_points) as point_value
from photo_direction
limit 100;

-- #################################################
-- test
select 
	ST_SetSRID(
		ST_MakePoint(
			SPLIT_PART(lonlat, ',', 1)::DOUBLE PRECISION, 
			SPLIT_PART(lonlat, ',', 2)::DOUBLE PRECISION
		), 4326
  	)
from (
	SELECT 
		replace(
				SPLIT_PART('"75122471@N02 10337097106","-72.85923856909706,41.42345280551554"', '","',2),
				'"',
				''
			) as lonlat
	) as makepoint

SELECT 
	replace(
			SPLIT_PART(point_value::TEXT, '","',2),
			'")',
			''
		) as lonlat
FROM 
	(
		select user_id, photo_id, json_each_text(intersection_points) as point_value
		from photo_direction
		limit 100
	) as ss



-- #################################################
-- table query
select 
	ST_SetSRID(
		ST_MakePoint(
			SPLIT_PART(lonlat, ',', 1)::DOUBLE PRECISION, 
			SPLIT_PART(lonlat, ',', 2)::DOUBLE PRECISION
		), 4326
  	)
from (
	SELECT 
	replace(
			SPLIT_PART(point_value::TEXT, '","',2),
			'")',
			''
		) as lonlat
FROM 
	(
		select
			concat(user_id, ' ', photo_id) as uid1,
			point_value.key as uid2,
			point_value.value as lonlat,
			ST_SetSRID(
				ST_MakePoint(
					SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
					SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
				), 4326
			)
		from photo_direction, json_each_text(photo_direction.intersection_points) as point_value
		where user_id='129036966@N05' and photo_id='15776963075'
--		limit 100
	) as ss
) as makepoint
-- #################################################	
    
-- 	SELECT json_data.key AS key1,
--                   json_data.value AS value1
--            FROM customers, 
--                 json_each_text(customers.education) AS json_data
--            WHERE value = 'NYSU';
-- select ST_ClusterDBSCAN(st_setsrid, eps := 0.5, minPoints := 5) from photo_direction_intersection_point limit 100;

select 
count(
	distinct (st_setsrid)
) 
from photo_direction_intersection_point;

select * from photo_direction_intersection_point limit 1;
select concat(user_id, ' ', photo_id) as uid from photo_direction limit 10;
					   
-- table 다시 만들기
select uid1, uid2, lon, lat
into table photo_coip
from (
	select
		user_id as uid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat
	-- 	ST_SetSRID(
	-- 		ST_MakePoint(
	-- 			SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
	-- 			SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
	-- 		), 4326
	-- 	) as geom
	from photo_direction, json_each_text(photo_direction.intersection_points) as point_value
-- 	where user_id='129036966@N05' and photo_id='15776963075'
)as aa
where aa.uid1 != aa.uid2
delete from photo_coip where lon=0
delete from photo_coip_geom where lon=0
select count(*) from photo_coip where lon = 0
-- QGIS용 table
select uid1, uid2, lon, lat, geom
into table photo_coip_geom
from (
	select
		user_id as uid1,
		SPLIT_PART(point_value.key, ' ', 1) as uid2,
		SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION as lon, 
		SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION as lat,
		ST_SetSRID(
			ST_MakePoint(
				SPLIT_PART(point_value.value, ',', 1)::DOUBLE PRECISION, 
				SPLIT_PART(point_value.value, ',', 2)::DOUBLE PRECISION
			), 4326
		) as geom
	from photo_direction, json_each_text(photo_direction.intersection_points) as point_value
-- 	where user_id='129036966@N05' and photo_id='15776963075'
)as aa
where aa.uid1 != aa.uid2

select * from photo_direction limit 1
select * from photo_coip_geom limit 1
-- https://www.latlong.net/c/?lat=41.2610782561722&long=-73.7245614763969



select * from pg_stat_activity;

create table new_coip as
select * from photo_coip_geom limit 1000

select * from new_coip limit 1

select *, ST_ClusterDBSCAN(geom, eps := 0.00313922, minpoints := 5) over() as cid
from new_coip
order by cid asc

-----------------------------------------------------------------------
-- photo_coip_geom에 있는 geom 포인트들에 대해 DBSCAN 수행하여 테이블로 저장
-----------------------------------------------------------------------
drop table photo_coip_dbscan_100_5;
drop table photo_coip_dbscan_200_5;
drop table photo_coip_dbscan_300_5;

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
									 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom)
) AS cluster_geom, array_agg(uid1) AS ids_in_cluster 
FROM (
    SELECT uid1, ST_ClusterDBSCAN(geom, eps := 0.003, minpoints := 5) over () AS cid, geom
    FROM new_coip
) sq
GROUP BY cid
order by cid;

select * from photo_coip_dbscan_100_4 where cid > 0 limit 1
					   
drop table new_coip
drop view view_coip_dbscan

-----------------------------------------------------------------------
-- 1. photo_direction user_id, geom_lonlat 으로 DBSCAN 테이블 만들기 - photo_lonlat_dbscan
-- 3. photo_lonlat_dbscan 으로 convexhull 만들기
-----------------------------------------------------------------------
select count(*) from photo_direction where lonlat <> point(0,0)

drop table photo_lonlat_dbscan_100_5;
drop table photo_lonlat_dbscan_200_5;
drop table photo_lonlat_dbscan_300_5;

create table photo_lonlat_dbscan_300_5 as 
SELECT sq.cid, ST_ConvexHull(
	ST_Collect(sq.db_geom)
) AS cluster_geom, 
array_agg(sq.user_id) AS ids_in_cluster,
ST_Area(
	ST_ConvexHull(
		ST_Collect(sq.db_geom)
	), true
) as area
FROM (
	select dbscan.user_id, dbscan.cid, dbscan.db_geom
	from (
		SELECT user_id, ST_ClusterDBSCAN(
			ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 5
		) over () AS cid, geom_lonlat as db_geom
		FROM photo_direction
		where lonlat <> point(0,0)
	) as dbscan
	where cid >= 0
) sq
GROUP BY cid
order by cid

select * from photo_lonlat_dbscan where cid >= 0 order by cid limit 25 offset 925
select * from photo_lonlat_dbscan where cid != 930
delete from photo_lonlat_dbscan where cid = 930

select * from photo_lonlat_dbscan_100_5
select ST_Area(cluster_geom), area from photo_lonlat_dbscan_100_5 where cid = 390

SELECT 
	ST_Transform(geom_lonlat, 2950)
-- 	*
FROM photo_direction where lonlat <> point(0,0) and lonlat[0] > -70 limit 1000 offset 130

delete from photo_direction where lonlat[0] = 17056881.853375
select * from photo_direction where lonlat[0] > 74.9 or lonlat[0] < 72.3
delete from photo_direction where lonlat[0] > 74.9 or lonlat[0] < 72.3
delete from photo_direction where lonlat[1] > 42.2 or lonlat[1] < 39.8

create index index_photo_direction_geom_lonlat on photo_direction using gist (geom_lonlat);

-- 논문용 각 테이블의 속성 값 표
select cid as cluster_id, array_length(ids_in_cluster,1) as sum_ids_in_cluster, area
--from photo_lonlat_dbscan_100_5 
--where cid = 321 or cid = 375 or cid = 428 or cid = 485 or cid = 682 or cid = 811 or cid = 1616 or cid = 2459 or cid = 2469
-- from photo_lonlat_dbscan_200_5 
-- where cid = 338
from photo_lonlat_dbscan_300_5 
where cid = 850

select cid as cluster_id, array_length(ids_in_cluster,1) as sum_ids_in_cluster, area
-- from photo_coip_dbscan_100_5 
-- where cid = 50 or cid = 223 or cid = 464
-- from photo_coip_dbscan_200_5 
-- where cid = 107 or cid = 239 or cid = 395
from photo_coip_dbscan_300_5 
where cid = 26


select * from photo_direction limit 1
order by geom_lonlat
select st_convexhull(
	st_collect(geom_lonlat)
)
from photo_direction
								
select count(*) from photo_direction_intersection_point
select * from photo_direction_intersection_point limit 1


select * from photo_direction_line 
select * from photo_direction
where user_id = '165458808@N08' and photo_id = '44071946952' limit 1


-- Triangle 테이블 만들기
-- Point 만들기 각도 +15/-15
drop table photo_direction_triangle;
select user_id, photo_id, photo_direction, geom_lonlat, ST_Project(geom_lonlat, 200, radians((photo_direction+15)))::geometry as geom_lonlat_p15, ST_Project(geom_lonlat, 200, radians((photo_direction-15)))::geometry as geom_lonlat_m15
into table photo_direction_triangle
from photo_direction

select * from photo_direction_triangle
where user_id = '165458808@N08' and photo_id = '44071946952'
																																				   
select ST_MakeLine(array[geom_lonlat, geom_lonlat_p15, geom_lonlat_m15, geom_lonlat])
from photo_direction_triangle
where user_id = '165458808@N08' and photo_id = '44071946952'
-- Line 만들기
SELECT AddGeometryColumn ('photo_direction_triangle','geom_line',4326,'LINESTRING',2);
update photo_direction_triangle
set geom_line = ST_MakeLine(array[geom_lonlat, geom_lonlat_p15, geom_lonlat_m15, geom_lonlat])
-- Polygon 만들기
SELECT AddGeometryColumn ('photo_direction_triangle','geom_poly',4326,'POLYGON',2);
update photo_direction_triangle
set geom_poly = ST_MakePolygon(geom_line)
----------------------------------------------------------------------------------------
																																				   
																																				   

SELECT ST_asText(ST_Project(geom_lonlat, 200, radians((photo_direction+15))))
from photo_direction																	 
where user_id = '165458808@N08' and photo_id = '44071946952'

select user_id, photo_id, photo_direction, geom_lonlat, ST_Project(geom_lonlat, 200, radians((photo_direction+15))) as geom_lonlat_p15, ST_Project(geom_lonlat, 200, radians((photo_direction-15))) as geom_lonlat_m15
from photo_direction
where user_id = '165458808@N08' and photo_id = '44071946952'
																																				   
--------------------------------------------------------------------------
select * from photo_direction order by intersection_points asc limit 10;
select count(*) from photo_direction where intersection_points = '{}'
																																				   
select * from photo_coip_min0_max100 where uid1='21147867@N07' and uid2='37076810@N03' or uid2='21147867@N07' and uid1='37076810@N03'
select * from photo_coip_min0_max100 where uid1='21147867@N07' or uid2='21147867@N07' and pid1='5586830959' or pid2='5586830959'
select count(*) from photo_direction limit 1;
select * from photo_coip_dbscan_300_5 where cid=0
select array_length(ids_in_cluster, 1) as al, cid from photo_coip_dbscan_300_5 order by al desc
select array_length(ids_in_cluster, 1) as al, cid from photo_coip_dbscan_300_5 order by al desc
select array_length(array(select distinct unnest(ids_in_cluster)),1) as al from photo_coip_dbscan_300_5 where cid=44

drop table photo_coip_min0_max100_dbscan_100_5;
create table photo_coip_min0_max100_dbscan_100_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom)
) AS cluster_geom, 
array_agg(uid1) AS ids_in_cluster,
array_length(array_agg(uid1),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(uid1))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(uid1))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom)
	), true
) AS area
FROM (
    SELECT uid1, ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 300, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;
										  

select * from photo_direction limit 1
select distinct geom from photo_coip_min30_max200
select * from photo_coip_min30_max200 where geom ='0101000020E6100000BF1F740DD58452C03D1A0C7844F54340'

select count(*) from photo_coip_min0_max500 as aa, photo_coip_min30_max200 as bb where aa.geom = bb.geom

create table photo_coip_min0_max500_new as
select
    DISTINCT ON (geom) geom, uid1, pid1, uid2, pid2, lon, lat
FROM photo_coip_min0_max500;
										  
select count(DISTINCT geom) FROM photo_coip_min0_max500; 
										  
SELECT
    geom,
    COUNT( geom )
FROM
    photo_coip_min30_max200
GROUP BY
    geom
HAVING
    COUNT( geom )> 1
ORDER BY
    geom desc;


select * from photo_coip_min30_max200_dbscan_100_5_over3 order by ids_in_cluster_unique_length desc
select * from photo_lonlat_dbscan2_100_5_over3 order by ids_in_cluster_unique_length desc
										  
select distinct on (geom) geom, uid1, pid1, uid2, pid2, lon, lat --into table photo_coip_min0_max100
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
-- GPS 좌표 with cid
select * from photo_direction_min0_max100 limit 1
create table photo_direction_min0_max100_dbscan_point_100_5 as 
SELECT user_id, photo_id, gps_time, photo_direction, file_path, geom_lonlat, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 5
	) over () AS cid
FROM photo_direction_min0_max100;
-- 3 이상인 클러스터만 cid 유지
alter table photo_direction_min0_max100_dbscan_point_100_5 add column over3 boolean;
update photo_direction_min0_max100_dbscan_point_100_5 set over3 = false;
update photo_direction_min0_max100_dbscan_point_100_5 as aa set over3 = true from (select cid from photo_lonlat_dbscan2_100_5_over3) as bb where aa.cid = bb.cid
update photo_direction_min0_max100_dbscan_point_100_5 set cid = null where over3 = false;

-- 10_300 coip point with cid
select * from photo_coip_min10_max300_new limit 1
create table photo_coip_min10_max300_new_dbscan_point_100_5 as 
SELECT uid1, pid1, uid2, pid2, lon, lat, geom, ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid
FROM photo_coip_min10_max300_new;
-- 3 이상인 클러스터만 cid 유지
select * from photo_coip_min10_max300_new_dbscan_point_100_5 where over3 = true
alter table photo_coip_min10_max300_new_dbscan_point_100_5 add column over3 boolean;
update photo_coip_min10_max300_new_dbscan_point_100_5 set over3 = false;
update photo_coip_min10_max300_new_dbscan_point_100_5 as aa set over3 = true from (select cid from photo_coip_min10_max300_dbscan_100_5_new_over3) as bb where aa.cid = bb.cid
update photo_coip_min10_max300_new_dbscan_point_100_5 set cid = null where over3 = false;
select * from photo_coip_min10_max300_new_dbscan_point_100_5 as aa, (select cid from photo_coip_min10_max300_dbscan_100_5_new_over3) as bb where aa.cid = bb.cid order by aa.cid
select cid, count(cid) from photo_coip_min10_max300_new_dbscan_point_100_5 group by cid order by cid
select * from photo_coip_min10_max300_dbscan_100_5_new_over3 where cid=77
select * from photo_coip_min10_max300_new_dbscan_point_100_5 where cid=77
										  
-- jfk airport 밀도 비교
select sum(ids_in_cluster_length), sum(area), sum(ids_in_cluster_length)/sum(area) from photo_coip_min10_max300_dbscan_100_5_new_over3 where cid=76 or cid=78 or cid=79
"1765"	"2398786.20193326"	
-- Ranking 알고리즘, coip
select cid, ids_in_cluster_length, ids_in_cluster_unique_length, area, trunc((ids_in_cluster_unique_length*ids_in_cluster_unique_length) + (ids_in_cluster_length/area)) as ranking_score 
from photo_coip_min10_max300_dbscan_100_5_new_over3 where area > 100*100 order by ranking_score desc
select cid, ids_in_cluster_unique_length from photo_coip_min10_max300_dbscan_100_5_new_over3 order by ids_in_cluster_unique_length desc
"10404.0007241113" "9.00042202623101"
-- Ranking 알고리즘, lonlat
select cid, ids_in_cluster_length, ids_in_cluster_unique_length, area, ((ids_in_cluster_unique_length*ids_in_cluster_unique_length) + (ids_in_cluster_length/area)) as ranking_score 
from photo_lonlat_dbscan2_100_5_over3 where area > 100*100 order by ranking_score desc
select cid, ids_in_cluster_unique_length from photo_lonlat_dbscan2_100_5_over3 order by ids_in_cluster_unique_length desc

										  
										  
select sum(ids_in_cluster_length), sum(area), sum(ids_in_cluster_length)/sum(area) from photo_lonlat_dbscan2_100_5_over3 where cid=141 or cid=266 or cid=267 or cid=364 or cid=587 or cid=890 or cid=1029 or cid=2481
"356"	"1096222.46720338"	"0.000324751599835576"
										  
select count(*) from photo_coip_min10_max300_dbscan_100_5_new group by ids_in_cluster_unique_length order by ids_in_cluster_unique_length desc
select count(*) from photo_coip_min10_max300_dbscan_100_5_new where ids_in_cluster_unique_length > 2
										  
select count(*) from photo_lonlat_dbscan2_100_5_over3 group by ids_in_cluster_unique_length
										  
select cid, ids_in_cluster_length, ids_in_cluster_unique_length, area, (ids_in_cluster_length/area) as ranking_score 
from photo_coip_min10_max300_dbscan_100_5_new_over3 where area > 100*100 order by ranking_score desc


--
create table photo_coip_min10_max300_new_dbscan_point_100_5 as 
SELECT uid1, pid1, uid2, pid2, lon, lat, geom, ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid
FROM photo_coip_min10_max300_new;

select * 
from photo_direction
WHERE  geom_lonlat  
--    && -- intersects,  gets more rows  -- CHOOSE ONLY THE
    @ -- contained by, gets fewer rows -- ONE YOU NEED!
    ST_MakeEnvelope (
		-- JFK Airport
        -73.797712, 40.633051, -- bounding 
        -73.770713, 40.652287, -- box limits
        4326)

																																	   
																																	   
select * from photo_xy limit 1
select count(*) from photo_xy

-------------------- GPS 좌표 있는 사진들만 옮기기 --------------------
create table photo_xy_with_gps as 
select count(*) from photo_xy where lonlat[0] != 0
-- photo_direction table과 합치기
alter table photo_xy_with_gps rename column owner_id to user_id
insert into photo_xy_with_gps(user_id, photo_id, gps_time, lonlat, file_path)
	select user_id, photo_id, gps_time, lonlat, file_path
	from photo_direction

-- noise 제거 
select * from photo_xy_with_gps 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

delete from photo_xy_with_gps 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

select * from photo_xy_with_gps 
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8

delete from photo_xy_with_gps
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8

-- geometry 만들기
ALTER TABLE photo_xy_with_gps add column geom geometry(Point, 4326);
update photo_xy_with_gps 
set geom = 
	ST_SetSRID(
		st_makePoint(
			lonlat[0], 
			lonlat[1]
		), 
		4326
);
																																   
select * from photo_xy_with_gps limit 1
select * from photo_direction limit 1

---------------- -- GPS 좌표 있는 사진들만 옮기기 끝 ------------
select * 
from photo_direction 
WHERE geom_lonlat
--    && -- intersects,  gets more rows  -- CHOOSE ONLY THE
    @ -- contained by, gets fewer rows -- ONE YOU NEED!
    ST_MakeEnvelope (
		-- Liberty island
        -74.049538, 40.684125, -- bounding 
        -74.038289, 40.692140, -- box limits
        4326)



select * from photo_coip_min10_max300_dbscan_100_5_new

-- to csv 
select uid1, pid1, uid2, pid2, lat, lon from photo_coip_min10_max300_new
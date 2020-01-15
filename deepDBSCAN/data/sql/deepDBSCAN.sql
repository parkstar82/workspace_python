-------------------------
-- deepDBSCAN -----------
-------------------------
select count(*) from photo_direction
--866609
select --count_person
* 
from photo_direction limit 10

alter table photo_direction add column count_person int;
update photo_direction set count_person=0

SELECT count(*)
-- user_id, photo_id, file_path, count_person
FROM photo_direction
WHERE ST_Contains(
        ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
        , photo_direction.geom_lonlat);
        
SELECT user_id, photo_id, file_path, count_person
FROM photo_direction
WHERE ST_Contains(
ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
, photo_direction.geom_lonlat)
order by user_id
------------------------------------
------ Spatial First DBSCAN --------
-- 1. Spatial Selection
-- 2. Deeplearning detect
-- 3. DBSCAN
------------------------------------
drop table deepdbscan_1_spatial_first
create table deepdbscan_1_spatial_first as 
SELECT ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 5
	) over () AS cid, 
    user_id, photo_id, lonlat, count_person, geom_lonlat
FROM photo_direction
WHERE ST_Contains(
        ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
        , photo_direction.geom_lonlat) 
        AND count_person > 0;

select * from deepdbscan_1_spatial_first 

select lonlat[0] as lon, lonlat[1] as lat
from photo_direction
limit 1

create table deepdbscan_1_spatial_first_sci_cluster
(
    cid integer,
    user_id varchar,
    photo_id bigint,
    file_path varchar,
    count_person integer,
    lon double PRECISION,
    lat double PRECISION
)
truncate deepdbscan_1_spatial_first_sci_cluster
COPY deepdbscan_1_spatial_first_sci_cluster(cid, user_id, photo_id, file_path, count_person, lon, lat) 
FROM 'C:\workspace_python\logs\result_deepDBSCAN_SF.csv' DELIMITER ',';


select * from deepdbscan_1_spatial_first_sci_cluster
ALTER TABLE deepdbscan_1_spatial_first_sci_cluster add column geom_lonlat geometry(Point, 4326);
update deepdbscan_1_spatial_first_sci_cluster 
set geom_lonlat = 
	ST_SetSRID(
		st_makePoint(
			lon, 
			lat
		), 
		4326
);

-- jfk airport 439
select count(*)
--SELECT user_id, photo_id, file_path, count_person
FROM photo_direction
WHERE ST_Contains(
ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
, photo_direction.geom_lonlat)

-- 911 memorial
SELECT count(*)
FROM photo_direction
WHERE ST_Contains(
ST_MakeEnvelope(-74.0, 40.69, -73.97, 40.73, 4326)
, photo_direction.geom_lonlat)

--select * from photo_xy where lonlat[1] != 0 limit 1

-- create table as copy
create table photo_xy_deepdbscan as table photo_xy
-- noise 제거
select count(*) from photo_xy where lonlat[0] = 17056881.853375 -- 6개
select count(*) from photo_xy where lonlat[0] = 0 -- 390351개
select count(*) from photo_xy_deepdbscan -- 490713
delete from photo_xy_deepdbscan where lonlat[0] = 17056881.853375 or lonlat[0] = 0
select * from photo_xy_deepdbscan 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

delete from photo_xy_deepdbscan 
where 
lonlat[0] < -74.9 
or 
lonlat[0] > -72.3

select * from photo_xy_deepdbscan 
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8

delete from photo_xy_deepdbscan
where 
lonlat[1] > 42.2 
or 
lonlat[1] < 39.8
select count(*) from photo_xy_deepdbscan -- 99282
select * from photo_xy_deepdbscan limit 10
-- noise 제거끝

--- file path 변경
update photo_xy_deepdbscan 
set file_path = replace(file_path, '0.ResearchData\22.flickr_images\newyork_radius_100km_ori\no_exif','D:\flickr_image\no_exif');
update photo_xy_with_gps
set file_path = replace(file_path, '0.ResearchData\22.flickr_images\newyork_radius_100km_ori\no_exif','D:\flickr_image\no_exif');

-- 테이블 속성 변환
ALTER TABLE photo_xy_deepdbscan add column geom_lonlat geometry(Point, 4326);
update photo_xy_deepdbscan 
set geom_lonlat = 
	ST_SetSRID(
		st_makePoint(
			lonlat[0], 
			lonlat[1]
		), 
		4326
);

-- photo direction data 추가
-- ...
-- data 정리 끝
-- index 추가
CREATE INDEX idx_photo_xy_with_gps ON photo_xy_with_gps USING GIST ( geom ); 
-- column 추가
alter table photo_xy_with_gps add column count_person int;
update photo_xy_with_gps set count_person=0
-------------------------------------------------
-------                                ----------
-------------------------------------------------

select * from photo_xy_with_gps limit 10
-- jfk airport 439
select count(*)
--SELECT user_id, photo_id, file_path, count_person
FROM photo_xy_with_gps
WHERE ST_Contains(
ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
, photo_xy_with_gps.geom)

-- central park 1057
SELECT count(*)
FROM photo_xy_with_gps
WHERE ST_Contains(
ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0008 40.7370, 
        -73.9898 40.7322, 
        -73.9697 40.7493, 
        -73.9556 40.7882, 
        -73.9889 40.7940, 
        -74.0008 40.7370)'
    , 4326)
)
, photo_xy_with_gps.geom)

-- world trade center 1468
SELECT count(*)
FROM photo_xy_with_gps
WHERE ST_Contains(
ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0134 40.7455, 
        -74.0232 40.7018, 
        -74.0113 40.6950, 
        -73.9874 40.7015, 
        -73.9739 40.7339,
        -74.0125 40.7543,
        -74.0134 40.7455)'
    , 4326)
)
, photo_xy_with_gps.geom)

-- world trade center + central park 2057
SELECT count(*)
FROM photo_xy_with_gps
WHERE ST_Contains(
ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0134 40.7455, 
        -74.0232 40.7018, 
        -74.0113 40.6950, 
        -73.9874 40.7015, 
        -73.9556 40.7582, 
        -73.9889 40.7590,
        -74.0134 40.7455)'
    , 4326)
), photo_xy_with_gps.geom)

SELECT ST_MakePolygon(
    ST_GeomFromText('LINESTRING(75.15 29.53,77 29,77.6 29.5, 75.15 29.53)', 4326)
);

drop table photo_xy_temp_geom
-- jfk airport 439
create table photo_xy_temp_geom as
select ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326) as geom

-- world trade center + central park 2057
insert into photo_xy_temp_geom(geom)
select ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0134 40.7455, 
        -74.0232 40.7018, 
        -74.0113 40.6950, 
        -73.9874 40.7015, 
        -73.9556 40.7582, 
        -73.9889 40.7590,
        -74.0134 40.7455)'
    , 4326)
)

-- world trade center 1468
insert into photo_xy_temp_geom(geom)
select ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0134 40.7455, 
        -74.0232 40.7018, 
        -74.0113 40.6950, 
        -73.9874 40.7015, 
        -73.9739 40.7339,
        -74.0125 40.7543,
        -74.0134 40.7455)'
    , 4326)
)

-- central park 1057
insert into photo_xy_temp_geom(geom)
select ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(-74.0008 40.7370, 
        -73.9898 40.7322, 
        -73.9697 40.7493, 
        -73.9556 40.7882, 
        -73.9889 40.7940, 
        -74.0008 40.7370)'
    , 4326)
)


ALTER TABLE photo_xy_temp_geom
ADD COLUMN idx SERIAL;
select * from photo_xy_temp_geom;


----------------------------------------------
-- 실험
----------------------------------------------
create table photo_xy_with_gps_random_selected as
SELECT count(*) --, *
FROM photo_xy_with_gps
order by random() limit 600;
                                      
select * from photo_xy_with_gps_random_selected;

select * 
from photo_xy_with_gps_random_selected
where ST_Dwithin(geom, )

-----------------------------------------------
SELECT *
from photo_xy_with_gps_random_selected
order by user_id, photo_id
offset 599
limit 1
-- 100506822@N02, 100477722@N08
-- 11468328614, "11969074246"
select *
from photo_xy_with_gps_random_selected_5km
WHERE 
    rnd_user_id=(
        SELECT user_id
        from photo_xy_with_gps_random_selected
        order by user_id, photo_id
        offset 0 limit 1
    )
AND 
    rnd_photo_id=(
        SELECT photo_id
        from photo_xy_with_gps_random_selected
        order by user_id, photo_id
        offset 0 limit 1
    )

-----------------------------------------------

select 0.5 / 6378.14

-- 랜덤 셀렉트 테이블에서 가져온 좌표로 사진 테이블에서 반경 500m 안에 있는 좌표를 찾는다.
SELECT s.*, h.*, 
    st_distance(
        ST_Transform(s.geom, 2950), 
        ST_Transform(h.geom, 2950)
    )
	FROM photo_xy_with_gps s
		LEFT JOIN photo_xy_with_gps_random_selected h ON ST_DWithin(ST_Transform(s.geom, 2950), ST_Transform(h.geom, 2950), 5000)
--WHERE h.user_id='63299533@N00' and h.photo_id='43921622945'
order by h.user_id, h.photo_id


select ST_ClusterDBSCAN(
		ST_Transform(s.geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, 
    s.user_id, s.photo_id, s.geom
    FROM photo_xy_with_gps s
		LEFT JOIN photo_xy_with_gps_random_selected h ON ST_DWithin(ST_Transform(s.geom, 2950), ST_Transform(h.geom, 2950), 5000)
WHERE h.user_id='63299533@N00' and h.photo_id='43921622945'

-- create temp table
drop table photo_xy_with_gps_random_selected_5km;
create table photo_xy_with_gps_random_selected_5km as
SELECT s.*, 
        h.user_id as rnd_user_id, 
        h.photo_id as rnd_photo_id, 
        h.gps_time as rnd_gps_time,
        h.lonlat as rnd_lonlat,
        h.file_path as rnd_file_path,
        h.exif as rnd_exif,
        h.geom as rnd_geom,
        h.count_person as rnd_count_person,
        st_distance(
            ST_Transform(s.geom, 2950), 
            ST_Transform(h.geom, 2950)
        )

	FROM photo_xy_with_gps s
		LEFT JOIN photo_xy_with_gps_random_selected h ON ST_DWithin(ST_Transform(s.geom, 2950), ST_Transform(h.geom, 2950), 5000)
order by h.user_id, h.photo_id

----------------------
-- update count person -1
select *
from photo_xy_with_gps_random_selected_5km
limit 1
where count_person > 0

-- count person -1로 세팅해서 디텍트 할 수 있도록 한다.
update photo_xy_with_gps
set count_person=-1
where count_person < 1
---------------------------
select * from photo_xy_with_gps limit 1

select 
    extract(
        epoch from now()
    );

               
select 
    user_id, photo_id, extract(epoch from gps_time) as gps_time, lonlat[1] as lat, lonlat[0] as long, 
    CONCAT(user_id, '_', photo_id, '.jpg') as file_path,
    FORMAT('person=%s', count_person) as objects
from photo_xy_with_gps
limit 10

--SELECT user_id, photo_id, file_path, count_person
select user_id, photo_id, exif, lonlat, geom 
FROM photo_xy_with_gps
--WHERE count_person = -1
--order by user_id, photo_id
limit 1000

-- SELECT user_id, photo_id, file_path, count_person
-- FROM photo_xy_with_gps_random_selected_5km
-- WHERE count_person=-1
SELECT 
    USER_ID, PHOTO_ID, FILE_PATH, COUNT_PERSON, 
    LONLAT[0] AS LON, LONLAT[1] AS LAT,
    RND_USER_ID, RND_PHOTO_ID
FROM 
    PHOTO_XY_WITH_GPS_RANDOM_SELECTED_5KM
WHERE 
    RND_USER_ID=(
        SELECT USER_ID
        FROM PHOTO_XY_WITH_GPS_RANDOM_SELECTED
        ORDER BY USER_ID, PHOTO_ID
        OFFSET 0 LIMIT 1
    )
AND
    RND_PHOTO_ID=(
        SELECT PHOTO_ID
        FROM PHOTO_XY_WITH_GPS_RANDOM_SELECTED
        ORDER BY USER_ID, PHOTO_ID
        OFFSET 0 LIMIT 1
    )

----------- newyork central park 좌표를 중심으로 데이터 세트 가져오기 ----------
-- newyork 센트럴파크 좌표 40.783294, -73.966453
-- 1. 중심좌표와의 거리를 기준으로 데이터 정렬
-- 2. 정렬된 데이터에서 1만 ~ 10만개. 만개 단위별로 테이블로 저장
create index idx_photo_xy_with_gps_geom on photo_xy_with_gps using gist(geom);

-- 중심좌표와의 거리를 기준으로 정렬된 테이블 생성
drop table photo_xy_with_gps_distance_order_from_centralpark;
create table photo_xy_with_gps_distance_order_from_centralpark as
select *, 
    st_distance(
        ST_Transform(
            ST_SetSRID(
                ST_MakePoint(-73.966453,40.783294), 4326
            ), 2950), 
        ST_Transform(geom, 2950)
    ) as distance
from photo_xy_with_gps
order by distance

-- to file
select 
    user_id, photo_id, extract(epoch from gps_time) as gps_time, 
    lonlat[1] as lat, lonlat[0] as long, 
    CONCAT(user_id, '_', photo_id, '.jpg') as file_path,
    FORMAT('person=%s', count_person) as objects
    --,distance
from photo_xy_with_gps_distance_order_from_centralpark
--where distance <= 7000
order by distance
limit 1000

-- DBSCAN을 위해 10000개짜리 테이블 만들기
drop table photo_xy_with_gps_distance_order_from_centralpark_10k;
create table photo_xy_with_gps_distance_order_from_centralpark_10k as 
select * 
from photo_xy_with_gps_distance_order_from_centralpark 
order by distance
limit 10000

select * from photo_xy_with_gps_distance_order_from_centralpark_10k

drop table photo_xy_with_gps_dist_central_10k_dbscan_normal_100_15;
create table photo_xy_with_gps_dist_central_10k_dbscan_normal_100_15 as 
SELECT ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, 
    user_id, photo_id, lonlat, count_person, file_path, geom, distance
FROM photo_xy_with_gps_distance_order_from_centralpark_10k

select * from photo_xy_with_gps_dist_central_10k_dbscan_normal_100_15

drop table photo_xy_with_gps_dist_central_10k_dbscan_deep_100_15;
create table photo_xy_with_gps_dist_central_10k_dbscan_deep_100_15 as 
SELECT ST_ClusterDBSCAN(
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, 
    user_id, photo_id, lonlat, count_person, file_path, geom, distance
FROM photo_xy_with_gps_distance_order_from_centralpark_10k
WHERE count_person > 0

select * from photo_xy_with_gps_dist_central_10k_dbscan_deep_100_15



SELECT 
--     USER_ID, 
--     PHOTO_ID, 
--     FILE_PATH, 
--     COUNT_PERSON,
--     LONLAT[0] AS LON, 
--     LONLAT[1] AS LAT
      *
FROM PHOTO_XY_WITH_GPS_DISTANCE_ORDER_FROM_CENTRALPARK
ORDER BY DISTANCE
LIMIT 10000

select count(*) from photo_xy_with_gps





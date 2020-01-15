create table photo_lonlat_dbscan2_100_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_100_10 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_100_15 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_100_20 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_100_25 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_200_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_200_10 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_200_15 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_200_20 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_200_25 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_300_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 5
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_300_10 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_300_15 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_300_20 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_300_25 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_400_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_400_10 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_400_15 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_400_20 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_400_25 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_500_5 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_500_10 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_500_15 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_500_20 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_lonlat_dbscan2_500_25 as 
SELECT cid, ST_ConvexHull(
	ST_Collect(geom_lonlat)
) AS cluster_geom, 
array_agg(user_id) AS ids_in_cluster,
array_length(array_agg(user_id),1) AS ids_in_cluster_length,
array(select distinct unnest(array_agg(user_id))) AS ids_in_cluster_unique,
array_length(array(select distinct unnest(array_agg(user_id))),1) AS ids_in_cluster_unique_length,
ST_Area(
	ST_ConvexHull(
		ST_Collect(geom_lonlat)
	), true
) AS area
FROM (
    SELECT user_id, ST_ClusterDBSCAN(
		ST_Transform(geom_lonlat, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom_lonlat
    FROM photo_direction_min0_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

select * from photo_lonlat_dbscan2_100_5 limit 1
select count(*), trunc(avg(area)) from photo_lonlat_dbscan2_500_5 where ids_in_cluster_unique_length >= 3
-- 2872 : select count(*) from photo_lonlat_dbscan2_100_5
-- 445 : select count(*) from photo_lonlat_dbscan2_100_5 where photo_lonlat_dbscan2_100_5.ids_in_cluster_unique_length >= 3
-- 2427 : select count(*) from photo_lonlat_dbscan2_100_5 where photo_lonlat_dbscan2_100_5.ids_in_cluster_unique_length < 3
-- 1990 : select count(*) from photo_lonlat_dbscan2_100_5 where photo_lonlat_dbscan2_100_5.ids_in_cluster_unique_length = 1
-- 437 : select count(*) from photo_lonlat_dbscan2_100_5 where photo_lonlat_dbscan2_100_5.ids_in_cluster_unique_length = 2
-- 168 : select count(*) from photo_lonlat_dbscan2_100_5 where photo_lonlat_dbscan2_100_5.ids_in_cluster_unique_length = 3

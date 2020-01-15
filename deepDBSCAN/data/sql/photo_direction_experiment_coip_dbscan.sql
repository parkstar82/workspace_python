-----------------------------------------------------------------------
-- photo_coip_geom에 있는 geom 포인트들에 대해 DBSCAN 수행하여 테이블로 저장
-- min50, max100 가장 적은 coip
-- min0, max500 가장 많은 coip
-----------------------------------------------------------------------
-- 100m
create table photo_coip_min50_max100_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min50_max100_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min50_max100_dbscan_300_5 as 
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
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min50_max100_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min50_max100_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max100
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min0 max500
-- 100m
create table photo_coip_min0_max500_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min0_max500_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min0_max500_dbscan_300_5 as 
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
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min0_max500_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min0_max500_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min0_max500
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min30 max200 GPS 대비 1.0배
-- 100m
create table photo_coip_min30_max200_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min30_max200_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min30_max200_dbscan_300_5 as 
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
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min30_max200_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min30_max200_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min30_max200_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min30_max200
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min20 max300 GPS 대비 2.0배
-- 100m
create table photo_coip_min20_max300_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min20_max300_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min20_max300_dbscan_300_5 as 
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
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min20_max300_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min20_max300_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min20_max300_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min20_max300
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min10 max400 GPS 대비 3.0배
-- 100m
create table photo_coip_min10_max400_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min10_max400_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min10_max400_dbscan_300_5 as 
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
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min10_max400_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min10_max400_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max400_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min10_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min50 max400 
-- 100m
create table photo_coip_min50_max400_dbscan_100_5 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_100_10 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_100_15 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_100_20 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_100_25 as 
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
		ST_Transform(geom, 2950), eps := 100, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min50_max400_dbscan_200_5 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_200_10 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_200_15 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_200_20 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_200_25 as 
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
		ST_Transform(geom, 2950), eps := 200, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min50_max400_dbscan_300_5 as 
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
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_300_10 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_300_15 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_300_20 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_300_25 as 
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
		ST_Transform(geom, 2950), eps := 300, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min50_max400_dbscan_400_5 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_400_10 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_400_15 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_400_20 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_400_25 as 
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
		ST_Transform(geom, 2950), eps := 400, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min50_max400_dbscan_500_5 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 5
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_500_10 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 10
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_500_15 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 15
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_500_20 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 20
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max400_dbscan_500_25 as 
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
		ST_Transform(geom, 2950), eps := 500, minpoints := 25
	) over () AS cid, geom
    FROM photo_coip_min50_max400
) sq
where cid>= 0
GROUP BY cid
order by cid;
-- SELECT 372
-- Query returned successfully in 9 hr 34 min.
-- 끝
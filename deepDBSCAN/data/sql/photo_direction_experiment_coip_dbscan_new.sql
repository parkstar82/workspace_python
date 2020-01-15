-----------------------------------------------------------------------
-- photo_coip_geom에 있는 geom 포인트들에 대해 DBSCAN 수행하여 테이블로 저장
-- min50, max100 가장 적은 coip
-- min0, max500 가장 많은 coip
-----------------------------------------------------------------------
-- 100m
create table photo_coip_min50_max100_dbscan_100_5_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_10_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_15_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_20_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_100_25_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min50_max100_dbscan_200_5_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_10_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_15_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_20_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_200_25_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min50_max100_dbscan_300_5_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_10_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_15_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_20_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_300_25_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min50_max100_dbscan_400_5_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_10_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_15_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_20_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_400_25_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min50_max100_dbscan_500_5_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_10_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_15_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_20_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min50_max100_dbscan_500_25_new as 
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
    from photo_coip_min50_max100_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min0 max500
-- 100m
create table photo_coip_min0_max500_dbscan_100_5_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_10_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_15_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_20_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_100_25_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min0_max500_dbscan_200_5_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_10_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_15_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_20_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_200_25_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min0_max500_dbscan_300_5_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_10_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_15_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_20_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_300_25_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min0_max500_dbscan_400_5_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_10_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_15_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_20_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_400_25_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min0_max500_dbscan_500_5_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_10_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_15_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_20_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min0_max500_dbscan_500_25_new as 
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
    FROM photo_coip_min0_max500_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- min10 max300 GPS 대비 1.0배
-- 100m
drop table photo_coip_min10_max300_dbscan_100_5_new;
drop table photo_coip_min10_max300_dbscan_100_10_new;
drop table photo_coip_min10_max300_dbscan_100_15_new;
drop table photo_coip_min10_max300_dbscan_100_20_new;
drop table photo_coip_min10_max300_dbscan_100_25_new;
drop table photo_coip_min10_max300_dbscan_200_5_new;
drop table photo_coip_min10_max300_dbscan_200_10_new;
drop table photo_coip_min10_max300_dbscan_200_15_new;
drop table photo_coip_min10_max300_dbscan_200_20_new;
drop table photo_coip_min10_max300_dbscan_200_25_new;
drop table photo_coip_min10_max300_dbscan_300_5_new;
drop table photo_coip_min10_max300_dbscan_300_10_new;
drop table photo_coip_min10_max300_dbscan_300_15_new;
drop table photo_coip_min10_max300_dbscan_300_20_new;
drop table photo_coip_min10_max300_dbscan_300_25_new;
drop table photo_coip_min10_max300_dbscan_400_5_new;
drop table photo_coip_min10_max300_dbscan_400_10_new;
drop table photo_coip_min10_max300_dbscan_400_15_new;
drop table photo_coip_min10_max300_dbscan_400_20_new;
drop table photo_coip_min10_max300_dbscan_400_25_new;
drop table photo_coip_min10_max300_dbscan_500_5_new;
drop table photo_coip_min10_max300_dbscan_500_10_new;
drop table photo_coip_min10_max300_dbscan_500_15_new;
drop table photo_coip_min10_max300_dbscan_500_20_new;
drop table photo_coip_min10_max300_dbscan_500_25_new;
										  
create table photo_coip_min10_max300_dbscan_100_5_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_100_10_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_100_15_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_100_20_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_100_25_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 200m
create table photo_coip_min10_max300_dbscan_200_5_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_200_10_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_200_15_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_200_20_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_200_25_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 300m
create table photo_coip_min10_max300_dbscan_300_5_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_300_10_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_300_15_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_300_20_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_300_25_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 400m
create table photo_coip_min10_max300_dbscan_400_5_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_400_10_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_400_15_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_400_20_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_400_25_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

-- 500m
create table photo_coip_min10_max300_dbscan_500_5_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_500_10_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_500_15_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_500_20_new as 
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
    FROM photo_coip_min10_max300_new
) sq
where cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_500_25_new as 
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
    FROM photo_coip_min10_max300_new
) sq
w here cid>= 0
GROUP BY cid
order by cid;

create table photo_coip_min10_max300_dbscan_100_5_new_over3  as select * from photo_coip_min10_max300_dbscan_100_5_new   where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_100_10_new_over3 as select * from photo_coip_min10_max300_dbscan_100_10_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_100_15_new_over3 as select * from photo_coip_min10_max300_dbscan_100_15_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_100_20_new_over3 as select * from photo_coip_min10_max300_dbscan_100_20_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_100_25_new_over3 as select * from photo_coip_min10_max300_dbscan_100_25_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_200_5_new_over3  as select * from photo_coip_min10_max300_dbscan_200_5_new   where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_200_10_new_over3 as select * from photo_coip_min10_max300_dbscan_200_10_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_200_15_new_over3 as select * from photo_coip_min10_max300_dbscan_200_15_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_200_20_new_over3 as select * from photo_coip_min10_max300_dbscan_200_20_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_200_25_new_over3 as select * from photo_coip_min10_max300_dbscan_200_25_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_300_5_new_over3  as select * from photo_coip_min10_max300_dbscan_300_5_new   where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_300_10_new_over3 as select * from photo_coip_min10_max300_dbscan_300_10_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_300_15_new_over3 as select * from photo_coip_min10_max300_dbscan_300_15_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_300_20_new_over3 as select * from photo_coip_min10_max300_dbscan_300_20_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_300_25_new_over3 as select * from photo_coip_min10_max300_dbscan_300_25_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_400_5_new_over3  as select * from photo_coip_min10_max300_dbscan_400_5_new   where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_400_10_new_over3 as select * from photo_coip_min10_max300_dbscan_400_10_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_400_15_new_over3 as select * from photo_coip_min10_max300_dbscan_400_15_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_400_20_new_over3 as select * from photo_coip_min10_max300_dbscan_400_20_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_400_25_new_over3 as select * from photo_coip_min10_max300_dbscan_400_25_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_500_5_new_over3  as select * from photo_coip_min10_max300_dbscan_500_5_new   where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_500_10_new_over3 as select * from photo_coip_min10_max300_dbscan_500_10_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_500_15_new_over3 as select * from photo_coip_min10_max300_dbscan_500_15_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_500_20_new_over3 as select * from photo_coip_min10_max300_dbscan_500_20_new  where ids_in_cluster_unique_length >= 3;
create table photo_coip_min10_max300_dbscan_500_25_new_over3 as select * from photo_coip_min10_max300_dbscan_500_25_new  where ids_in_cluster_unique_length >= 3;
-- 끝
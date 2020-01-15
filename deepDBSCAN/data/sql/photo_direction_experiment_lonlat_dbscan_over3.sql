create table photo_lonlat_dbscan2_100_5_over3 as 
select * from photo_lonlat_dbscan2_100_5 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_100_10_over3 as 
select * from photo_lonlat_dbscan2_100_10 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_100_15_over3 as 
select * from photo_lonlat_dbscan2_100_15 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_100_20_over3 as 
select * from photo_lonlat_dbscan2_100_20 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_100_25_over3 as 
select * from photo_lonlat_dbscan2_100_25 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_200_5_over3 as 
select * from photo_lonlat_dbscan2_200_5 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_200_10_over3 as 
select * from photo_lonlat_dbscan2_200_10 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_200_15_over3 as 
select * from photo_lonlat_dbscan2_200_15 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_200_20_over3 as 
select * from photo_lonlat_dbscan2_200_20 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_200_25_over3 as 
select * from photo_lonlat_dbscan2_200_25 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_300_5_over3 as 
select * from photo_lonlat_dbscan2_300_5 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_300_10_over3 as 
select * from photo_lonlat_dbscan2_300_10 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_300_15_over3 as 
select * from photo_lonlat_dbscan2_300_15 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_300_20_over3 as 
select * from photo_lonlat_dbscan2_300_20 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_300_25_over3 as 
select * from photo_lonlat_dbscan2_300_25 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_400_5_over3 as 
select * from photo_lonlat_dbscan2_400_5 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_400_10_over3 as 
select * from photo_lonlat_dbscan2_400_10 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_400_15_over3 as 
select * from photo_lonlat_dbscan2_400_15 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_400_20_over3 as 
select * from photo_lonlat_dbscan2_400_20 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_400_25_over3 as 
select * from photo_lonlat_dbscan2_400_25 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_500_5_over3 as 
select * from photo_lonlat_dbscan2_500_5 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_500_10_over3 as 
select * from photo_lonlat_dbscan2_500_10 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_500_15_over3 as 
select * from photo_lonlat_dbscan2_500_15 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_500_20_over3 as 
select * from photo_lonlat_dbscan2_500_20 where ids_in_cluster_unique_length >= 3;

create table photo_lonlat_dbscan2_500_25_over3 as 
select * from photo_lonlat_dbscan2_500_25 where ids_in_cluster_unique_length >= 3;

select * from photo_lonlat_dbscan2_100_5 limit 1
select count(*), trunc(avg(area)) from photo_lonlat_dbscan2_500_5 where ids_in_cluster_unique_length >= 3


# !/usr/bin/python
import json
import time
from configparser import ConfigParser

import numpy as np
import pandas as pd
import psycopg2
from _deepdbscan import DeepDBSCAN
from deepgeo import Engine

from _utils import logging_time
from sklearn.cluster import DBSCAN

DEBUG = False
F_EPSILON = 0.3     # meter
MIN_PTS = 15

IS_TO_FILE = False

def config(filename='..\data\database.ini', section='postgresql'):
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return db

def count_cluster_items(clusters):
    n_clusters_items = 0
    n_clusters = 0
    for i in range(0, len(clusters)):
        # print(i, len(clusters[i]))
        if 0 < len(clusters[i]):
            n_clusters += 1
            n_clusters_items += len(clusters[i])

    return n_clusters, n_clusters_items


def printClusterInfo(clusters):
    print('cluster id : number of items')
    for i in range(len(clusters)):
        print('{} : {}'.format(i, len(clusters[i])))


def get_photoInfo():
    """ get photoInfos in JKF Airport from database  """
    # JFK 439
    # sql = """   SELECT user_id, photo_id, file_path, count_person
    #             FROM photo_direction
    #             WHERE ST_Contains(
    #                     ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
    #                     , photo_direction.geom_lonlat)
    #                     order by user_id
    #                     """
    # Central Park 1057
    # sql = """   SELECT user_id, photo_id, file_path, count_person
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0008 40.7370,
    #                     -73.9898 40.7322,
    #                     -73.9697 40.7493,
    #                     -73.9556 40.7882,
    #                     -73.9889 40.7940,
    #                     -74.0008 40.7370)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center 1468
    # sql = """   SELECT user_id, photo_id, file_path, count_person
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0134 40.7455,
    #                     -74.0232 40.7018,
    #                     -74.0113 40.6950,
    #                     -73.9874 40.7015,
    #                     -73.9739 40.7339,
    #                     -74.0125 40.7543,
    #                     -74.0134 40.7455)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center + central park 2057
    # sql = """   SELECT user_id, photo_id, file_path, count_person
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0134 40.7455,
    #                     -74.0232 40.7018,
    #                     -74.0113 40.6950,
    #                     -73.9874 40.7015,
    #                     -73.9556 40.7582,
    #                     -73.9889 40.7590,
    #                     -74.0134 40.7455)'
    #                 , 4326)
    #             ), photo_xy_with_gps.geom)
    #                 """
    ####### All Detection
    sql = """   SELECT user_id, photo_id, file_path, count_person
                FROM photo_xy_with_gps
                WHERE count_person = -1
                LIMIT 1000
          """
    #######

    conn = None
    photoInfos = []
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            photoInfos.append(list(row))

        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    return photoInfos

@logging_time
def spatialSelection(sql=None, columns=6):
    """ get photoInfos in JKF Airport from database  """
    # jfk air port
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_direction
    #             WHERE ST_Contains(
    #                     ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
    #                     , photo_direction.geom_lonlat)
    #                     order by user_id, photo_id
    #             """
    # Central Park
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0008 40.7370,
    #                     -73.9898 40.7322,
    #                     -73.9697 40.7493,
    #                     -73.9556 40.7882,
    #                     -73.9889 40.7940,
    #                     -74.0008 40.7370)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center 1468
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0134 40.7455,
    #                     -74.0232 40.7018,
    #                     -74.0113 40.6950,
    #                     -73.9874 40.7015,
    #                     -73.9739 40.7339,
    #                     -74.0125 40.7543,
    #                     -74.0134 40.7455)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center + central park 2057
    if None is sql:
        sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
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
                    """
    conn = None
    photoInfos = []
    rnd_user_id = None
    rnd_photo_id = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            photoInfos.append([
                row[0]
                , row[1]
                , row[2]
                , int(row[3])
                , float(row[4])
                , float(row[5])
            ])
            if columns > 6:
                rnd_user_id = row[6]
                rnd_photo_id = row[7]

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    print('Spatial selection length : {}'.format(len(photoInfos)))
    return photoInfos,rnd_user_id, rnd_photo_id

def update_person_count(photoInfos, table_name):
    """ update count_person from photoInfo """
    sql = """   UPDATE {}
                SET count_person = %s
                WHERE user_id = %s and photo_id = %s""".format(table_name)
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        for photoInfo in photoInfos:
            cur.execute(sql, (photoInfo[3], photoInfo[0], photoInfo[1]))

        conn.commit()
        cur.close()
        print('Update complete')
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()


def deepCount(image, categories=[]):
    """
    :param image: deepgeo Image
    :param categories: perseon, car ... in config
    :return: {'person': 1}
    """
    data = {}
    if isinstance(categories, str):
        categories = categories.replace("[","").replace("]","").split(",")
    annotations = image.get_annotation()
    for annotation in annotations:
        text = annotation['annotationText']
        if text in categories or categories==[]:
            try:
                data[text] +=1
            except Exception:
                data[text] = 1
    return data

def toJSON(image, categories=None):
    data = deepCount(image, categories=categories)
    return json.dumps(data)

''' 
@logging_time
def detectAllDc(dc):
    engine = Engine()
    # add model
    engine.add_model('mscoco', 'maskrcnn', 'C:/00.Research/10.paper/2019_04_2019_04.Deep-DBSCAN/deepgeo/config.json')

    # get photoInfo
    photoInfos = get_photoInfo()
    for photoInfo in photoInfos:
        # Image to Image
        path, filename = os.path.split(photoInfo[2])
        image_annotations = []
        count_person = {}
        try:
            image = Image(uri=filename, image_path=path, annotations=image_annotations)
            engine.detect('mscoco', image)
            count_person = deepCount(image, dc)
        except Exception as error:
            print(error)

        if 0 < len(count_person):
            photoInfo[3] = count_person.get(dc)
        else:
            photoInfo[3] = 0

        print('{} {}'.format(datetime.datetime.now(), photoInfo))

    print('detected count {}'.format(len(photoInfos)))
    # update photoInfo
    update_person_count(photoInfos, 'photo_xy_with_gps')

'''

@logging_time
def dbscan_fov():
    """
    FOV DBSCAN
    코어 포인트의 조건에 유저수의 절대값이 m 이상인 조건 추가
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6371.0088

    # load the data set
    # df = pd.read_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook/coip_10_300.csv', encoding='utf-8')
    df = pd.read_csv(r'D:\flickr_image\x_sweep\image_exif_dump_coip_0.0_100.0.txt', encoding='utf-8')
    print(df.head())

    # represent points consistently as (lat, lon)
    coords = df.as_matrix(columns=['lat', 'lon'])
    index = [0, 1, 2, 3]
    # print(np.shape(coords))

    np.delete(coords, index)
    # print(np.shape(coords))

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = 0.1 / kms_per_radian

    start_time = time.time()

    # #############################################################################
    # Compute DBSCAN
    db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords), ori_X=df)
    labels = db.labels_
    # temp_df = pd.DataFrame(labels)
    # temp_df.to_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook\dbscan_100_5_coip_10_300.csv')
    ############
    # cid = dbscan.to_numpy()[:,[1]]
    # coip = coip.to_numpy()
    result = np.append(pd.DataFrame(labels).to_numpy(), df.to_numpy(), axis=1)
    temp_df = pd.DataFrame(result)
    temp_df.to_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook\result_dbscan_100_5_coip_10_300.csv',
                   index=False, header=False)
    ################

# @logging_time
def deepDetection(photoInfos, dc):
    """
    Get the photoInfos that match the detection conditions.
    :param photoInfos: list ori photoInfos[user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat]
    :param dc: int Detection condition
    :return: list Detected photoInfos
    """
    return [ p for p in photoInfos if p[3]>=dc ]

@logging_time
def deepDBSCAN_SF(photoInfos=None, filePath=None, dc=1, epsilon=0.1, minpts=9 ):
    """
    Spatial First DBSCAN
    1. Spatial Selection
    2. Deeplearning detect
    3. plain DBSCAN
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6378.14

    # load the data set
    # user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    if None is photoInfos:
        photoInfos = spatialSelection()[0]

    if None is filePath:
        filePath = r'C:\workspace_python\logs\result_deepDBSCAN_SF.csv'

    checkDcCount = len(photoInfos)
    detectedPhotoInfos = np.array(deepDetection(photoInfos, dc))
    # print('조건을 검사하는 개수 : {}'.format(checkDcCount))
    # print('조건을 만족하는 개수 : {}'.format(len(detectedPhotoInfos)))

    if 0 < len(detectedPhotoInfos):
        coords = (detectedPhotoInfos[:,4:]).astype(dtype='float32')
        coords = np.reshape(coords , (-1,2))

        # define epsilon as 1.5 kilometers, converted to radians for use by haversine
        # epsilon = F_EPSILON / kms_per_radian

        #############################################################################
        # Compute DBSCAN
        # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
        db = DBSCAN(eps=epsilon, min_samples=minpts, algorithm='ball_tree').fit(np.radians(coords))
        if IS_TO_FILE:
            labels = db.labels_
            num_clusters = len(set(labels))
            clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])

            n_clusters, n_clusters_items = count_cluster_items(clusters)
            print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))

            printClusterInfo(clusters)

            result = np.append(pd.DataFrame(labels).to_numpy(), detectedPhotoInfos, axis=1)
            temp_df = pd.DataFrame(result)
            temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')

    return checkDcCount
    ################

@logging_time
def deepDBSCAN_DP_old(photoInfos=None, filePath=None, dc=1):
    """
    Spatial First DBSCAN
    1. Spatial Selection
    2. Plain DBSCAN
    3. Cluster detect
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6378.14

    # load the data set
    # user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    if None is photoInfos:
        photoInfos = spatialSelection()[0]

    if None is filePath:
        filePath = r'C:\workspace_python\logs\result_deepDBSCAN_DP.csv'

    if DEBUG:
        dc = 1  # person_count > 0
        photoInfos = deepDetection(photoInfos, dc)

    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:,4:]).astype(dtype='float32')
    coords = np.reshape(coords , (-1,2))
    # print(np.reshape(coords , (-1,2))[:10])
    # print(np.radians(coords)[:10])

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = F_EPSILON / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=MIN_PTS, algorithm='ball_tree').fit(np.radians(coords))
    labels = db.labels_
    num_clusters = len(set(labels))
    clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])
    n_clusters, n_clusters_items = count_cluster_items(clusters)
    printClusterInfo(clusters)
    print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))
    result = np.append(pd.DataFrame(labels).to_numpy(), photoInfos, axis=1)

    dic_result = {}
    for i in range(len(result)):
        key = result[i][0]
        if key in dic_result:
            dic_result[key].append(photoInfos[i])
        else:
            dic_result[key] = [photoInfos[i]]

    # cluster detection
    # detect
    detectedCount = 0
    detected_num_clusters = 0
    detectedPhotoInfos = None
    last_cluster_id = 0
    for key in dic_result.keys():
        # print('key:{}, length:{}'.format(key, len(dic_result[key])))
        if key != '-1':
            detectedResult = deepDetection(dic_result[key], dc)
            detectedCount += len(dic_result[key])
            # print('cluster dc item count : {}'.format(len(detectedResult)))
            if 0 == len(detectedResult):
                continue

            numpy_detectedResult = np.array(detectedResult)
            # plain dbscan some cluster
            coords = (numpy_detectedResult[:, 4:]).astype(dtype='float32')
            coords = np.reshape(coords, (-1, 2))
            db = DBSCAN(eps=epsilon, min_samples=MIN_PTS, algorithm='ball_tree').fit(np.radians(coords))
            labels = db.labels_
            num_clusters = len(set(labels))
            clusters = pd.Series([coords[labels == n] for n in range(0, num_clusters)])
            n_clusters, n_clusters_items = count_cluster_items(clusters)
            # print('Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))

            detected_num_clusters += n_clusters
            # print('Number of clusters: {}'.format(num_clusters))
            new_labels = []
            for i in labels:
                if i >= 0:
                    new_labels.append(i+last_cluster_id)
                else:
                    new_labels.append(i)

            if max(labels) >= 0:
                last_cluster_id = last_cluster_id + (max(labels)+1)

            resultPhotoInfos = np.append(pd.DataFrame(np.array(new_labels)).to_numpy(), detectedResult, axis=1)
            if detectedPhotoInfos is None:
                detectedPhotoInfos = resultPhotoInfos
            else:
                detectedPhotoInfos = np.append(detectedPhotoInfos, resultPhotoInfos, axis=0)


    # Noise 숫자 세기
    if not None is detectedPhotoInfos:
        noise = np.count_nonzero(detectedPhotoInfos[:,0] == '-1')
        print('noise : {}'.format(noise))
        print('조건을 검사하는 개수 : {}'.format(detectedCount))
        print('detected_num_clusters : {}'.format(detected_num_clusters))
        print('detectedPhotoInfos length : {}'.format(len(detectedPhotoInfos) - noise))
        print('last_cluster_id : {}'.format(last_cluster_id))

        temp_df = pd.DataFrame(detectedPhotoInfos)
        temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')
    return detectedCount
    ################


@logging_time
def deepDBSCAN_DP(photoInfos=None, filePath=None, dc=1, epsilon=0.1, minpts=9):
    """
    Spatial First DBSCAN
    1. Spatial Selection
    2. Plain DBSCAN
    3. Cluster detect
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6378.14

    # load the data set
    # user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    if None is photoInfos:
        photoInfos = spatialSelection()[0]

    if None is filePath:
        filePath = r'C:\workspace_python\logs\result_deepDBSCAN_DP.csv'

    if DEBUG:
        dc = 1  # person_count > 0
        photoInfos = deepDetection(photoInfos, dc)

    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:,4:]).astype(dtype='float32')
    coords = np.reshape(coords , (-1,2))

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    # epsilon = F_EPSILON / kms_per_radian
    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=minpts, algorithm='ball_tree').fit(np.radians(coords))
    labels = db.labels_
    num_clusters = len(set(labels))
    clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])
    n_clusters, n_clusters_items = count_cluster_items(clusters)
    # printClusterInfo(clusters)
    # print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))
    # result = np.append(pd.DataFrame(labels).to_numpy(), photoInfos, axis=1)

    # 기존 photoInfos 에서 cluster에 속해 있는 것만 가져 오기.
    cluster_photoInfos = []
    for i in range(len(labels)):
        if labels[i] >= 0:
            cluster_photoInfos.append(photoInfos[i])

    # 클러스터 아이템들 디텍트
    detectedCount = len(cluster_photoInfos)
    detectedPhotoInfos = np.array(deepDetection(cluster_photoInfos, dc))

    if 0 < len(detectedPhotoInfos):
        cluster_coords = (detectedPhotoInfos[:,4:]).astype(dtype='float32')
        cluster_coords = np.reshape(cluster_coords , (-1,2))

        #############################################################################
        # Compute DBSCAN
        cluster_db = DBSCAN(eps=epsilon, min_samples=minpts, algorithm='ball_tree').fit(np.radians(cluster_coords))
        if IS_TO_FILE:
            cluster_labels = cluster_db.labels_
            cluster_num_clusters = len(set(cluster_labels))
            cluster_clusters = pd.Series([cluster_coords[cluster_labels == n] for n in range(cluster_num_clusters)])
            printClusterInfo(cluster_clusters)

            cluster_result = np.append(pd.DataFrame(cluster_labels).to_numpy(), detectedPhotoInfos, axis=1)
            temp_df = pd.DataFrame(cluster_result)
            temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')

    return detectedCount
    ################



@logging_time
def deepDBSCAN(photoInfos=None, filePath=None, dc=1, epsilon=0.1, minpts=9):
    """
    Spatial First DBSCAN
    1. Spatial Selection
    2. Plain DBSCAN
    3. Cluster detect
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6378.14

    # load the data set
    # user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    if None is photoInfos:
        photoInfos = spatialSelection()[0]

    if None is filePath:
        filePath = r'C:\workspace_python\logs\result_deepDBSCAN.csv'

    if DEBUG:
        dc = 1  # person_count > 0
        photoInfos = deepDetection(photoInfos, dc)

    # detect engine and condition
    engine = Engine()
    dc = 1  # person_count > 0
    # detectedPhotoInfos = np.array(deepDetection(photoInfos, dc))
    # print('Number of detect : {}'.format(len(detectedPhotoInfos)))
    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:, 4:]).astype(dtype='float32')
    coords = np.reshape(coords, (-1, 2))

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    # epsilon = F_EPSILON / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db, detectedCount = DeepDBSCAN(eps=epsilon, min_samples=minpts, algorithm='ball_tree').fit(
        np.radians(coords), ori_X=photoInfos, deepEngine=engine, dc=dc)
    if IS_TO_FILE:
        labels = db.labels_
        labels_set = set(labels)
        num_clusters = len(labels_set)
        clusters = pd.Series([coords[labels == n] for n in range(0, num_clusters)])

        n_clusters, n_clusters_items = count_cluster_items(clusters)
        print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))

        printClusterInfo(clusters)
        result = np.append(pd.DataFrame(labels).to_numpy(), photoInfos, axis=1)
        temp_df = pd.DataFrame(result)
        temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')

        print('조건을 검사하는 개수 : {}'.format(detectedCount))
    return detectedCount


@logging_time
def deepDBSCAN_DF_and_FD(photoInfos=None, filePath=None):
    """
    TODO : 구현 중
    DBSCAN First and Fully DBSCAN
    1. Spatial Selection
    2. Plain DBSCAN
    3. Cluster detect
    4. Fully DBSCAN by Plain DBSCAN result
    """
    # #############################################################################
    # Get Data
    # define the number of kilometers in one radian
    kms_per_radian = 6378.14

    # load the data set
    # user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    if None is photoInfos:
        photoInfos = spatialSelection()

    if None is filePath:
        filePath = r'C:\workspace_python\logs\result_deepDBSCAN_DP.csv'

    if DEBUG:
        dc = 1  # person_count > 0
        photoInfos = deepDetection(photoInfos, dc)

    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:,4:]).astype(dtype='float32')
    coords = np.reshape(coords , (-1,2))
    # print(np.reshape(coords , (-1,2))[:10])
    # print(np.radians(coords)[:10])

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = F_EPSILON / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=MIN_PTS, algorithm='ball_tree').fit(np.radians(coords))
    labels = db.labels_
    num_clusters = len(set(labels))
    clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])
    n_clusters, n_clusters_items = count_cluster_items(clusters)
    print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))
    result = np.append(pd.DataFrame(labels).to_numpy(), photoInfos, axis=1)

    dic_result = {}
    for i in range(len(result)):
        key = result[i][0]
        if key in dic_result:
            dic_result[key].append(photoInfos[i])
        else:
            dic_result[key] = [photoInfos[i]]

    # cluster detection
    # detect
    dc = 1  # person_count > 0
    detectedCount = 0
    detected_num_clusters = 0
    detectedPhotoInfos = None
    last_cluster_id = 0
    for key in dic_result.keys():
        # print('key:{}, length:{}'.format(key, len(dic_result[key])))
        if key != '-1':
            detectedResult = deepDetection(dic_result[key], dc)
            detectedCount += len(dic_result[key])
            # print('cluster dc item count : {}'.format(len(detectedResult)))
            if 0 == len(detectedResult):
                continue

            numpy_detectedResult = np.array(detectedResult)
            # plain dbscan some cluster
            coords = (numpy_detectedResult[:, 4:]).astype(dtype='float32')
            coords = np.reshape(coords, (-1, 2))
            db = DBSCAN(eps=epsilon, min_samples=MIN_PTS, algorithm='ball_tree').fit(np.radians(coords))
            labels = db.labels_
            num_clusters = len(set(labels))
            clusters = pd.Series([coords[labels == n] for n in range(0, num_clusters)])
            n_clusters, n_clusters_items = count_cluster_items(clusters)
            # print('Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))

            detected_num_clusters += n_clusters
            # print('Number of clusters: {}'.format(num_clusters))
            new_labels = []
            for i in labels:
                if i >= 0:
                    new_labels.append(i+last_cluster_id)
                else:
                    new_labels.append(i)

            if max(labels) >= 0:
                last_cluster_id = last_cluster_id + (max(labels)+1)

            resultPhotoInfos = np.append(pd.DataFrame(np.array(new_labels)).to_numpy(), detectedResult, axis=1)
            if detectedPhotoInfos is None:
                detectedPhotoInfos = resultPhotoInfos
            else:
                detectedPhotoInfos = np.append(detectedPhotoInfos, resultPhotoInfos, axis=0)


    # Noise 숫자 세기
    # if not None is detectedPhotoInfos:
    #     noise = np.count_nonzero(detectedPhotoInfos[:,0] == '-1')
    #     print('noise : {}'.format(noise))
    #     print('조건을 검사하는 개수 : {}'.format(detectedCount))
    #     print('detected_num_clusters : {}'.format(detected_num_clusters))
    #     print('detectedPhotoInfos length : {}'.format(len(detectedPhotoInfos) - noise))
    #     print('last_cluster_id : {}'.format(last_cluster_id))

        # temp_df = pd.DataFrame(detectedPhotoInfos)
        # temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')
    return detectedCount
    ################

##########################################
@logging_time
def save(filepath, rows):
    with open(filepath,'w+') as csv:
        for row in rows:
            csv.write(row)


@logging_time
def randomSelectedExp():
    """
    1. Random 좌표 600개 선정
    2. 1에서 선정된 좌표 1개를 중심으로 5km 반경의 사진들을 얻어옴
    3. 2에서 가져온 사진들로 SF, DP, DeepDBSCAN 수행.
    4. 3의 각 알고리즘 결과를 File로 저장. [owner_id, photo_id, lon, lat, SF_count, DP_count, Deep_count]
    """
    result = []
    result.append('USER_ID,PHOTO_ID,SF,DP,DEEP\n')
    for i in range(600):
        SQL = """   SELECT 
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
                            OFFSET {} LIMIT 1
                        )
                    AND 
                        RND_PHOTO_ID=(
                            SELECT PHOTO_ID
                            FROM PHOTO_XY_WITH_GPS_RANDOM_SELECTED
                            ORDER BY USER_ID, PHOTO_ID
                            OFFSET {} LIMIT 1
                        )
                """.format(i, i)
        photoInfosAndUserinfo = spatialSelection(SQL, 8)
        photoInfos = photoInfosAndUserinfo[0]
        rnd_user_id = photoInfosAndUserinfo[1]
        rnd_photo_id = photoInfosAndUserinfo[2]

        preFilepath = r'C:\workspace_python\logs\{}_{}_{}_{}_{}_'.format(i, rnd_user_id, rnd_photo_id, F_EPSILON*1000, MIN_PTS)
        filePath_SF = preFilepath + 'result_SF_DBSCAN.csv'
        filePath_DP = preFilepath + 'result_DP_DBSCAN.csv'
        filePath_DEEP = preFilepath + 'result_DEEP_DBSCAN.csv'

        # print('=========================SF=========================')
        count_sf = deepDBSCAN_SF(photoInfos, filePath_SF)
        # print('=========================DP=========================')
        count_dp = deepDBSCAN_DP(photoInfos, filePath_DP)
        # print('=========================DEEP=======================')
        count_deep = deepDBSCAN(photoInfos, filePath_DEEP)
        row = '{},{},{},{},{}\n'.format(rnd_user_id, rnd_photo_id, count_sf, count_dp, count_deep)
        # print('=========================ROW========================')
        print(row)
        # print('=========================END========================')
        result.append(row)

    filepath = r'C:\workspace_python\logs\RandomSelectedPerformance_{}_{}.csv'.format(F_EPSILON*1000, MIN_PTS)
    save(filepath, result)

##########################################
# LIST_F_EPSILON = [0.1, 0.2, 0.3, 0.4, 0.5]
# LIST_MIN_PTS = [5, 10, 15, 20, 25, 30]
# for i in range(5):
#     F_EPSILON = LIST_F_EPSILON[i]
#     for j in range(7):
#         MIN_PTS = LIST_MIN_PTS[j]
#         randomSelectedExp()
#########################################

# print('조건을 검사하는 개수 : {}'.format(deepDBSCAN_SF()))
# print('조건을 검사하는 개수 : {}'.format(deepDBSCAN_DP()))
# print('조건을 검사하는 개수 : {}'.format(deepDBSCAN()))


# deepDBSCAN_SF()     ## detected count 439
# deepDBSCAN_DP()     ## detected count 376
# deepDBSCAN()      ## detected count 354
# detectAllDc('person')
    # jfk air port detected count 439 | WorkingTime[detectAllDc]: 758.120667219162 sec |
    # DP : 376
    # deep : 354

    # Central Park detected count 1057 | WorkingTime[detectAllDc]: 2418.82422542572 sec |
    # SF : Number of clusters: 16 | plain Number of clusters items : 343
    # DP : original Number of clusters items : 924, last Number of clusters items : 391
    # deep : 863, Number of clusters: 17, Number of clusters items : 405

    # world trade center detected count 1468 | WorkingTime[detectAllDc]: 3781.8988497257233 sec
    # SF : Number of clusters: 17 | plain Number of clusters items : 553
    # DP : original Number of clusters items : 1302, last Number of clusters items : 590, last clusters : 17
    # deep : 1239, Number of clusters: 16, Number of clusters items : 601

    # world trade center + central park detected count 2057 | WorkingTime[detectAllDc]: 5083.199026584625 sec
    # SF : Number of clusters: 26 | plain Number of clusters items : 771
    # DP : original Number of clusters items : 1846, last Number of clusters items : 771, last clusters : 26
    # deep : 1763, Number of clusters: 26, Number of clusters items : 844
#############################################
###### All Detection
#detectAllDc('person')
#############################################
# def restart():
#     for i in range(5):
#         detectAllDc('person')
#
#     python = sys.executable
#     os.execl(python, python, *sys.argv)
#
# if __name__ == "__main__":
#     restart()
#############################################



@logging_time
def centralparkExpAll(aptime=1.5):
    """
    1. central 중심 좌표 좌표(40.783294, -73.966453) 선정
    2. 중심 좌표를 기준으로 가까운 거리순으로 정렬
    3. 2에서 가져온 사진들로 SF, DF, DeepDBSCAN 수행.
    4. 3의 각 알고리즘 결과를 File로 저장.
    ============================
        SF ~ DDB,10k ~ 50k
            9   12  15  18  21
    100m     x   x   x   x   x
    200m     x   x   x   x   x
    300m     x   x   x   x   x
    400m     x   x   x   x   x
    500m     x   x   x   x   x
    ============================
            100m, 9
            SF  DF  DDB
    10k     x   x   x
    20k     x   x   x
    30k     x   x   x
    40k     x   x   x
    50k     x   x   x
    ============================
    """
    k = 1000
    kms_per_radian = 6378.14
    # list_data_limit = [10*k, 20*k, 30*k, 40*k, 50*k]
    # list_epsilon  = [0.1, 0.2, 0.3, 0.4, 0.5]
    # list_minpts = [9, 12, 15, 18, 21]

    list_data_limit = [10*k, 20*k]
    list_epsilon = [0.1, 0.2]
    list_minpts = [9,12]

    result_limit_sf = []
    result_limit_df = []
    result_limit_ddb = []
    list_result_time = []
    str_time_row = 'limit,epsilon,minpts,sf_time,df_time,ddb_time,result_time\n'
    list_result_time.append(str_time_row)

    for data_limit in list_data_limit:
        SQL = """   SELECT 
                        USER_ID, 
                        PHOTO_ID, 
                        FILE_PATH, 
                        COUNT_PERSON,
                        LONLAT[0] AS LON, 
                        LONLAT[1] AS LAT
                    FROM PHOTO_XY_WITH_GPS_DISTANCE_ORDER_FROM_CENTRALPARK
                    ORDER BY DISTANCE
                    LIMIT {}
                """.format(data_limit)

        photoInfos = spatialSelection(SQL)[0]
        # print(photoInfos)
        result_sf = []
        result_df = []
        result_ddb = []
        for epsilon in list_epsilon:
            _epsilon = epsilon / kms_per_radian
            result_epsilon_sf = []
            result_epsilon_df = []
            result_epsilon_ddb = []
            for minpts in list_minpts:
                preFilepath = r'C:\workspace_python\logs\newalgo\{}_{:<3.0f}_{}_'.format(
                    data_limit, epsilon*1000, minpts)
                filePath_SF = preFilepath + 'result_SF_DBSCAN.csv'
                filePath_DP = preFilepath + 'result_DP_DBSCAN.csv'
                filePath_DEEP = preFilepath + 'result_DEEP_DBSCAN.csv'

                print('========================= SF {}_{:<3.0f}_{} ========================='.format(
                    data_limit, epsilon*1000, minpts))
                start_time = time.time()
                count_sf = deepDBSCAN_SF(photoInfos, filePath_SF, 1, _epsilon, minpts)
                end_time = time.time()
                sf_time = end_time - start_time
                print('SF DETECTED COUNT : {} '.format(count_sf))
                print('========================= DF {}_{:<3.0f}_{} ========================='.format(
                    data_limit, epsilon * 1000, minpts))
                start_time = time.time()
                count_df = deepDBSCAN_DP(photoInfos, filePath_DP, 1, _epsilon, minpts)
                end_time = time.time()
                df_time = end_time - start_time
                print('DF DETECTED COUNT : {} '.format(count_df))
                print('========================= DDB {}_{:<3.0f}_{} ========================='.format(
                    data_limit, epsilon * 1000, minpts))
                start_time = time.time()
                count_ddb = deepDBSCAN(photoInfos, filePath_DEEP, 1, _epsilon, minpts)
                end_time = time.time()
                ddb_time = end_time - start_time
                print('DDB DETECTED COUNT : {} '.format(count_ddb))
                result_time = 'RESULT_TIME(AVERAGE PREDICT TIME IS {}s) [SF : {:<5.3f}s\tDF : {:<5.3f}s\tDDF : {:<5.3f}s]'.format(
                    aptime,
                    (sf_time + (count_sf * aptime)),
                    (df_time + (count_df * aptime)),
                    (ddb_time + (count_ddb * aptime)))
                print('========== {} =========='.format(result_time))

                str_time_row = '{:<2.0f}k,{:<3.0f}m,{},SF:{:<5.3f}s,DF:{:<5.3f}s,DDB:{:<5.3f}s,{}\n'.format(
                    data_limit/1000, epsilon*1000, minpts, sf_time, df_time, ddb_time, result_time)
                list_result_time.append(str_time_row)

                result_epsilon_sf.append(count_sf)
                result_epsilon_df.append(count_df)
                result_epsilon_ddb.append(count_ddb)

            result_sf.append(result_epsilon_sf)
            result_df.append(result_epsilon_df)
            result_ddb.append(result_epsilon_ddb)

        result_limit_sf.append(result_sf)
        result_limit_df.append(result_df)
        result_limit_ddb.append(result_ddb)

        # to csv file, algorithm, limit 고정
        a_l_result_to_file(result_sf, result_df, result_ddb,
                           data_limit, list_epsilon, list_minpts)

    # time save
    save(r'C:\workspace_python\logs\newalgo\time.csv', list_result_time)

    # to csv file, epsilon, minpts 고정
    e_k_result_to_file(result_limit_sf, result_limit_df, result_limit_ddb,
                       list_data_limit, list_epsilon, list_minpts)


@logging_time
def e_k_result_to_file(r_limit_sf, r_limit_df, r_limit_ddb,
                       list_data_limit, list_epsilon, list_minpts):
    """
                100m, 9 (고정)
                SF  DF  DDB
        10k     x   x   x
        20k     x   x   x
        30k     x   x   x
        40k     x   x   x
        50k     x   x   x
    """
    #  list_epsilon  = [0.1, 0.2, 0.3, 0.4, 0.5]
    #  list_minpts = [9,12,15,18,21]
    # e=100, k=9
    result_row_name = []
    for limit in list_data_limit:
        result_row_name.append('{:<2.0f}k'.format(limit/1000))
    result_row_name = np.reshape(np.asarray(result_row_name), (len(result_row_name), -1))

    result_column_name = ['limit', 'SF', 'DF', 'DDB']


    for e in range(len(list_epsilon)):
        for k in range(len(list_minpts)):

            result_sf = []
            for i in range(len(list_data_limit)):
                result_sf.append(r_limit_sf[i][e][k])

            result_df = []
            for i in range(len(r_limit_df)):
                result_df.append(r_limit_df[i][e][k])

            result_ddb = []
            for i in range(len(r_limit_ddb)):
                result_ddb.append(r_limit_ddb[i][e][k])

            e_k_filepath = r'C:\workspace_python\logs\newalgo\e_k_result_{:<3.0f}_{}.csv'.format(
                list_epsilon[e]*1000, list_minpts[k])

            result_sf = np.reshape(np.asarray(result_sf), (len(result_sf), -1))
            result_df = np.reshape(np.asarray(result_df), (len(result_df), -1))
            result_ddb = np.reshape(np.asarray(result_ddb), (len(result_ddb), -1))
            result = np.hstack((result_row_name, result_sf, result_df, result_ddb))
            result = np.vstack((result_column_name, result))
            temp_df = pd.DataFrame(result)
            temp_df.to_csv(e_k_filepath, index=False, header=False, encoding='utf-8')


@logging_time
def a_l_result_to_file(result_sf, result_df, result_ddb,
                       data_limit, list_epsilon, list_minpts):
    result_row_name = []
    for row_name in list_epsilon:
        result_row_name.append('{:<3.0f}m'.format(row_name * 1000))
    result_row_name = np.reshape(np.asarray(result_row_name), (len(result_row_name), -1))
    result_column_name = np.append(['epsilon'], list_minpts)

    sf_filepath = r'C:\workspace_python\logs\newalgo\{}_SF.csv'.format(data_limit)
    df_filepath = r'C:\workspace_python\logs\newalgo\{}_DF.csv'.format(data_limit)
    ddb_filepath = r'C:\workspace_python\logs\newalgo\{}_DDB.csv'.format(data_limit)

    result_sf = np.reshape(np.asarray(result_sf), (len(result_sf), -1))
    result_sf = np.hstack((result_row_name, result_sf))
    result_sf = np.vstack((result_column_name, result_sf))
    temp_sf = pd.DataFrame(result_sf)
    temp_sf.to_csv(sf_filepath, index=False, header=False, encoding='utf-8')

    result_df = np.reshape(np.asarray(result_df), (len(result_df), -1))
    result_df = np.hstack((result_row_name, result_df))
    result_df = np.vstack((result_column_name, result_df))
    temp_df = pd.DataFrame(result_df)
    temp_df.to_csv(df_filepath, index=False, header=False, encoding='utf-8')

    result_ddb = np.reshape(np.asarray(result_ddb), (len(result_ddb), -1))
    result_ddb = np.hstack((result_row_name, result_ddb))
    result_ddb = np.vstack((result_column_name, result_ddb))
    temp_ddb = pd.DataFrame(result_ddb)
    temp_ddb.to_csv(ddb_filepath, index=False, header=False, encoding='utf-8')

#########################
centralparkExpAll()
#########################
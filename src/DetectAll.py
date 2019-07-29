# !/usr/bin/python
from configparser import ConfigParser
import psycopg2
import os
import time
import numpy as np
from sklearn.cluster import DBSCAN
import pandas as pd
import deepgeo

def logging_time(original_fn):
    def wrapper_fn(*args, **kwargs):
        start_time = time.time()
        result = original_fn(*args, **kwargs)
        end_time = time.time()
        print("WorkingTime[{}]: {} sec".format(original_fn.__name__, end_time-start_time))
        return result
    return wrapper_fn

def config(filename='database.ini', section='postgresql'):
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

def get_photoInfo():
    """ get photoInfos in JKF Airport from database  """
    sql = """   SELECT user_id, photo_id, file_path, count_person
                FROM photo_direction
                WHERE ST_Contains(
                        ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
                        , photo_direction.geom_lonlat)
                        order by user_id
                        """
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
def spatialSelection():
    """ get photoInfos in JKF Airport from database  """
    sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
                FROM photo_direction
                WHERE ST_Contains(
                        ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
                        , photo_direction.geom_lonlat)
                        order by user_id, photo_id
                        """
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
            photoInfos.append([
                row[0]
                , row[1]
                , row[2]
                , int(row[3])
                , float(row[4])
                , float(row[5])
            ])

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    print('Spatial selection length : {}'.format(len(photoInfos)))
    return photoInfos

def update_person_count(photoInfos):
    """ update count_person from photoInfo """
    sql = """   UPDATE photo_direction
                SET count_person = %s
                WHERE user_id = %s and photo_id = %s"""
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

@logging_time
def detectAll():
    engine = deepgeo.Engine()
    # add model
    engine.add_model('mscoco', 'maskrcnn', 'C:/00.Research/10.paper/2019_04_2019_04.Deep-DBSCAN/deepgeo/config.json')

    # get photoInfo
    photoInfos = get_photoInfo()
    for photoInfo in photoInfos:
        # Image to Image
        path, filename = os.path.split(photoInfo[2])
        image_annotations = []
        image = deepgeo.Image(uri=filename, image_path=path, annotations=image_annotations)
        engine.detect('mscoco', image)
        count_person = deepCount(image, 'person')
        if 0 < len(count_person):
            photoInfo[3] = count_person.get('person')

        print(photoInfo)

    # update photoInfo
    update_person_count(photoInfos)

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
    # result = []
    # for photoInfo in photoInfos:
    #     if photoInfo[3] > dc:
    #         result.append(photoInfo)
    print('Detected count : {}'.format(len(photoInfos)))
    return [ p for p in photoInfos if p[3]>=dc ]

@logging_time
def deepDBSCAN_SF():
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
    photoInfos = spatialSelection()

    dc = 1 # person_count > 0
    detectedPhotoInfos = np.array(deepDetection(photoInfos, dc))
    print('Number of detect : {}'.format(len(detectedPhotoInfos)))

    coords = (detectedPhotoInfos[:,4:]).astype(dtype='float32')
    coords = np.reshape(coords , (-1,2))

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = 0.1 / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree').fit(np.radians(coords))
    labels = db.labels_
    num_clusters = len(set(labels))
    clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])
    print(clusters)
    print('Number of clusters: {}'.format(num_clusters))
    result = np.append(pd.DataFrame(labels).to_numpy(), detectedPhotoInfos, axis=1)
    temp_df = pd.DataFrame(result)
    temp_df.to_csv(r'C:\workspace_python\logs\result_deepDBSCAN_SF.csv',
                   index=False, header=False, encoding='utf-8')
    ################

@logging_time
def deepDBSCAN_DP():
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
    photoInfos = spatialSelection()
    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:,4:]).astype(dtype='float32')
    coords = np.reshape(coords , (-1,2))
    # print(np.reshape(coords , (-1,2))[:10])
    # print(np.radians(coords)[:10])

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = 0.1 / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree').fit(np.radians(coords))
    labels = db.labels_
    num_clusters = len(set(labels))
    clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])
    n_clusters_items = 0
    for i in range(0, len(clusters)):
        print(i, len(clusters[i]))
        n_clusters_items += len(clusters[i])

    print('plain Number of clusters: {}'.format(num_clusters))
    print('plain Number of clusters items : {}'.format(n_clusters_items))
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
        print('key:{}, length:{}'.format(key, len(dic_result[key])))
        if key != '-1':
            detectedResult = deepDetection(dic_result[key], dc)
            numpy_detectedResult = np.array(detectedResult)
            detectedCount += len(dic_result[key])
            # plain dbscan some cluster
            coords = (numpy_detectedResult[:, 4:]).astype(dtype='float32')
            coords = np.reshape(coords, (-1, 2))
            db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree').fit(np.radians(coords))
            labels = db.labels_
            num_clusters = len(set(labels))
            detected_num_clusters += num_clusters
            print('Number of clusters: {}'.format(num_clusters))
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

    print('Detected count : {}'.format(detectedCount))
    print('detected_num_clusters : {}'.format(detected_num_clusters))
    print('detectedPhotoInfos length : {}'.format(len(detectedPhotoInfos)))
    print('last_cluster_id : {}'.format(last_cluster_id))

    temp_df = pd.DataFrame(detectedPhotoInfos)
    temp_df.to_csv(r'C:\workspace_python\logs\result_deepDBSCAN_DP.csv',
                   index=False, header=False, encoding='utf-8')
    ################

def deepDBSCAN():
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
    photoInfos = spatialSelection()

    # detect engine and condition
    engine = deepgeo.Engine()
    dc = 1  # person_count > 0
    # detectedPhotoInfos = np.array(deepDetection(photoInfos, dc))
    # print('Number of detect : {}'.format(len(detectedPhotoInfos)))
    numpy_photoInfos = np.array(photoInfos)
    coords = (numpy_photoInfos[:, 4:]).astype(dtype='float32')
    coords = np.reshape(coords, (-1, 2))

    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = 0.1 / kms_per_radian

    #############################################################################
    # Compute DBSCAN
    # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
    db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree').deep_fit(
        np.radians(coords), ori_X=photoInfos, deepEngine=engine, dc=dc)
    labels = db.labels_
    labels_set = set(labels)
    labels_list = list(labels_set)
    num_clusters = len(labels_set)
    print(labels_set)
    clusters = pd.Series([coords[labels == n] for n in range(0, num_clusters-2)])
    n_clusters_items = 0
    for i in range(0, len(clusters)):
        print(i, len(clusters[i]))
        n_clusters_items += len(clusters[i])

    print('Number of clusters: {}'.format(num_clusters))
    print('Number of clusters items : {}'.format(n_clusters_items))
    result = np.append(pd.DataFrame(labels).to_numpy(), photoInfos, axis=1)
    temp_df = pd.DataFrame(result)
    temp_df.to_csv(r'C:\workspace_python\logs\result_deepDBSCAN.csv',
                   index=False, header=False, encoding='utf-8')

##########################################



# deepDBSCAN_SF()     ## detected count 439
deepDBSCAN_DP()     ## detected count 376
# deepDBSCAN()      ## detected count 354
# detectAll()
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

def runQuery( datapath=None, data_limit=10*1000, detection_time=0.5,
              epsilon=100, minPts=9):
    """
    입력받은 변수로 SF(Spatial First), DF(DBSCAN First), DDB(DeepDBSCAN)의
    알고리즘을 수행한다.
    :param datapath: data file path
    :param data_limit: spatial selection count limit.
    :param detection_time: temporal image detection time.
    :param epsilon: DBSCAN radius
    :param minPts: DBSCAN minimum points
    :return:
    """
    imgList = readdata( datapath, data_limit )
    clusters = queryOp( imgList, spatialSelection, deepCondition, dbscanAlgo, minPts)
    return clusters


def runQuery_DeepDBSCAN_SF(imgList, spatialSelection, deepCondition, dbscanAlgo=deepDBSCAN, epsilon, minPts)
    imgList = spatialSelection(imgList)
    clusters = dbscanAlgo(imgList, epsilon, minPts, deepCondition)
    print(clusters)
    return clusters


def runQuery_TwoStep(imgList, spatialSelection, deepCondition, dbscanAlgo=dbscan, epsilon, minPts)
    imgList = spatialSelection(imgList)
    clusters = dbscanAlgo( imgList, epsilon, minPts)
    imgList = clusters.makeimgList()
    imgList = deepCondition(imgList)
    clusters = dbscanAlgo(imgList, epsilon, minPts)
    print(clusters)
    return clusters



def runQuery_DeepDBSCAN_SF(imgList, spatialSelection, deepCondition, dbscanAlgo=deepDBSCAN, epsilon, minPts)
    imgList = spatialSelection(imgList)
    clusters = dbscanAlgo( imgList, epsilon, minPts)
    imgList = clusters.makeimgList()
    clusters = dbscanAlgo(imgList, epsilon, minPts, deepCondition)
    print(clusters)
    return clusters


def readdata( datapath=None, data_limit=10*1000 ):
    """
    Read data from file or database
    :param datapath: file path
    :param data_limit:  data count limit
    :return: imgList: [user_id, photo_id, gps_time, lat, lon, file_path, objects]
    """

    if None is datapath:
        # from database

    else:
        # from file



def spatialSelectionFromDB(data_limit=10*1000):
    """ get photoInfos in JKF Airport from database  """
    sql = """   SELECT 
                    USER_ID, 
                    PHOTO_ID, 
                    EXTRACT(EPOCH FROM GPS_TIME) AS GPS_TIME, 
                    LONLAT[1] AS LAT, 
                    LONLAT[0] AS LONG, 
                    CONCAT(USER_ID, '_', PHOTO_ID, '.JPG') AS FILE_PATH,
                    FORMAT('PERSON=%S', COUNT_PERSON) AS OBJECTS
                FROM PHOTO_XY_WITH_GPS_DISTANCE_ORDER_FROM_CENTRALPARK
                ORDER BY DISTANCE
                LIMIT {}
                """.format(data_limit)
    conn = None
    photoInfos = []
    try:
        params = config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            photoInfos.append([
                row[0]          # user_id
                , row[1]        # photo_id
                , int(row[2])   # gps_time
                , float(row[3]) # lat
                , float(row[4]) # long
                , int(row[5])
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
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

def runQuery( data, queryOp=runQuery_SpatialFirst, spatialSelection, deepCondition, dbscanAlgo=dbscan, epsilon, minPts )
    imgList = readData( data )
    clusters = queryOp( imgList, spatialSelection, deepCondition, dbscanAlgo, minPts)
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
    clusters = dbscanAlgo(imgList, epsilon, minPts, deepCondition)
    print(clusters)
    return clusters

def runQuery_DeepDBSCAN_SF(imgList, spatialSelection, deepCondition, dbscanAlgo=deepDBSCAN, epsilon, minPts)
    imgList = spatialSelection(imgList)
    clusters = dbscanAlgo( imgList, epsilon, minPts)
    imgList = clusters.makeimgList()
    clusters = dbscanAlgo(imgList, epsilon, minPts, deepCondition)
    print(clusters)
    return clusters





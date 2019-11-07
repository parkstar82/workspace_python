"""
Demo of DBSCAN clustering algorithm
https://scikit-learn.org/stable/auto_examples/cluster/plot_dbscan.html#sphx-glr-download-auto-examples-cluster-plot-dbscan-py
"""
import numpy as np
import pandas as pd

from _utils import logging_time
from sklearn.cluster import DBSCAN


@logging_time
def fovDBSCAN():
    # define the number of kilometers in one radian
    kms_per_radian = 6371.0088
    # define epsilon as 1.5 kilometers, converted to radians for use by haversine
    epsilon = 0.1 / kms_per_radian

    # load the data set
    df = pd.read_csv(r'D:\flickr_image\x_sweep\image_exif_dump_coip_0.0_100.0.txt', encoding='utf-8')
    print(df.head())

    # represent points consistently as (lat, lon)
    coords = df.as_matrix(columns=['lat', 'lon'])
    index = [0, 1, 2, 3, 4, 5]
    np.delete(coords, index)

    # Compute DBSCAN
    db = DBSCAN(eps=epsilon, min_samples=5, min_users=3, algorithm='ball_tree', metric='haversine').fit(np.radians(coords), ori_X=df)
    labels = db.labels_
    result = np.append(pd.DataFrame(labels).to_numpy(), df.to_numpy(), axis=1)
    temp_df = pd.DataFrame(result)
    temp_df.to_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook\result_dbscan_100_5_coip_10_300.csv',
                   index=False, header=False)

fovDBSCAN()

# print(time.time())
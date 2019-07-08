"""
Demo of DBSCAN clustering algorithm
https://scikit-learn.org/stable/auto_examples/cluster/plot_dbscan.html#sphx-glr-download-auto-examples-cluster-plot-dbscan-py
"""
import numpy as np
import os

from sklearn.cluster import DBSCAN
from sklearn import metrics
from sklearn.datasets.samples_generator import make_blobs
from sklearn.preprocessing import StandardScaler
import pandas as pd
import matplotlib.pyplot as plt, time


# 그림을 저장할 폴드
PROJECT_ROOT_DIR = "."
CHAPTER_ID = "fundamentals"

def save_fig(fig_id, tight_layout=True):
    path = os.path.join(PROJECT_ROOT_DIR, fig_id + ".png")
    if tight_layout:
        plt.tight_layout()
    plt.savefig(path, format='png', dpi=300)

# SciPy 이슈 #5998에 해당하는 경고를 무시합니다(https://github.com/scipy/scipy/issues/5998).
import warnings
warnings.filterwarnings(action="ignore", module="scipy", message="^internal gelsd")


# #############################################################################
# Generate sample data
# centers = [[1, 1], [-1, -1], [1, -1]]
# X, labels_true = make_blobs(n_samples=750, centers=centers, cluster_std=0.4,
#                             random_state=0)

# X = StandardScaler().fit_transform(X)

# #############################################################################

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

#
# core_samples_mask = np.zeros_like(db.labels_, dtype=bool)
# core_samples_mask[db.core_sample_indices_] = True
#
# # Number of clusters
# n_clusters_ = len(set(labels)) - (1 if -1 in labels else 0)
# n_noise_ = list(labels).count(-1)
#
# print('Estimated number of clusters: %d' % n_clusters_)
# # #############################################################################
# # Plot result
# import matplotlib.pyplot as plt
#
# # Black removed and is used for noise instead.
# unique_labels = set(labels)
# colors = [plt.cm.Spectral(each)
#           for each in np.linspace(0, 1, len(unique_labels))]
# # for k, col in zip(unique_labels, colors):
# #     if k == -1:
# #         # Black used for noise.
# #         col = [0, 0, 0, 1]
#
# #     class_member_mask = (labels == k)
#
# #     xy = coords[class_member_mask & core_samples_mask]
# #     plt.plot(xy[:, 0], xy[:, 1], 'o', markerfacecolor=tuple(col),
# #              markeredgecolor='k', markersize=14)
#
# #     xy = coords[class_member_mask & ~core_samples_mask]
# #     plt.plot(xy[:, 0], xy[:, 1], 'o', markerfacecolor=tuple(col),
# #              markeredgecolor='k', markersize=6)
#
# for k, col in zip(unique_labels, colors):
#     if k != -1:
#         class_member_mask = (labels == k)
#
#         xy = coords[class_member_mask & core_samples_mask]
#         plt.plot(xy[:, 0], xy[:, 1], 'o', markerfacecolor=tuple(col),
#                  markeredgecolor='k', markersize=14)
#
#         xy = coords[class_member_mask & ~core_samples_mask]
#         plt.plot(xy[:, 0], xy[:, 1], 'o', markerfacecolor=tuple(col),
#                  markeredgecolor='k', markersize=6)
#
# plt.title('Estimated number of clusters: %d' % n_clusters_)
# save_fig(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook\dbscan_100_5_coip_10_300')
# plt.show()

print('complete : {}'.format(time.time() - start_time))

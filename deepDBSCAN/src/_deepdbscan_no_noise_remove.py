# -*- coding: utf-8 -*-
"""
DBSCAN: Density-Based Spatial Clustering of Applications with Noise
"""

# Author: Robert Layton <robertlayton@gmail.com>
#         Joel Nothman <joel.nothman@gmail.com>
#         Lars Buitinck
#
# License: BSD 3 clause

import time
import warnings

import numpy as np
from scipy import sparse
from _utils import logging_time
from object_detector import ObjectDetector

from sklearn.base import BaseEstimator, ClusterMixin
from sklearn.neighbors import NearestNeighbors
from sklearn.utils import check_array, check_consistent_length


class DeepDBSCAN_NRN(BaseEstimator, ClusterMixin):
    def __init__(self, eps=0.5, min_samples=5, metric='euclidean',
                 metric_params=None, algorithm='auto', leaf_size=30, p=None,
                 n_jobs=None):
        self.eps = eps
        self.min_samples = min_samples
        self.metric = metric
        self.metric_params = metric_params
        self.algorithm = algorithm
        self.leaf_size = leaf_size
        self.p = p
        self.n_jobs = n_jobs

    def fit(self, X, y=None, ori_X=None, sample_weight=None,
            deepEngine=None, dc=0):
        """Perform DBSCAN clustering from features or distance matrix.

        Parameters
        ----------
        X : array or sparse (CSR) matrix of shape (n_samples, n_features), or \
                array of shape (n_samples, n_samples)
            A feature array, or array of distances between samples if
            ``metric='precomputed'``.
        sample_weight : array, shape (n_samples,), optional
            Weight of each sample, such that a sample with a weight of at least
            ``min_samples`` is by itself a core sample; a sample with negative
            weight may inhibit its eps-neighbor from being core.
            Note that weights are absolute, and default to 1.

        y : Ignored

        """
        X = check_array(X, accept_sparse='csr')
        detectedCount = -1
        if deepEngine is not None:
            clust = deep_dbscan(X, ori_X, sample_weight=sample_weight,
                                detectFunc=deepEngine, dc=dc, **self.get_params())
            detectedCount = clust[2]
            clust = (clust[0], clust[1])
            self.core_sample_indices_, self.labels_ = clust
        # modified
        # else:
        #     clust = dbscan(X, ori_X,  sample_weight=sample_weight,
        #                    **self.get_params())
        #     self.core_sample_indices_, self.labels_ = clust

        if len(self.core_sample_indices_):
            # fix for scipy sparse indexing issue
            self.components_ = X[self.core_sample_indices_].copy()
        else:
            # no core samples
            self.components_ = np.empty((0, X.shape[1]))
        return self, detectedCount

    def fit_predict(self, X, y=None, sample_weight=None):
        """Performs clustering on X and returns cluster labels.

        Parameters
        ----------
        X : array or sparse (CSR) matrix of shape (n_samples, n_features), or \
                array of shape (n_samples, n_samples)
            A feature array, or array of distances between samples if
            ``metric='precomputed'``.
        sample_weight : array, shape (n_samples,), optional
            Weight of each sample, such that a sample with a weight of at least
            ``min_samples`` is by itself a core sample; a sample with negative
            weight may inhibit its eps-neighbor from being core.
            Note that weights are absolute, and default to 1.

        y : Ignored

        Returns
        -------
        y : ndarray, shape (n_samples,)
            cluster labels
        """
        self.fit(X, sample_weight=sample_weight)
        return self.labels_


def deep_dbscan(X, ori_X=None, eps=0.5, min_samples=5, metric='minkowski', metric_params=None,
                algorithm='auto', leaf_size=30, p=2, sample_weight=None,
                n_jobs=None, detectFunc=None, dc=0):
    if not eps > 0.0:
        raise ValueError("eps must be positive.")

    X = check_array(X, accept_sparse='csr')
    if sample_weight is not None:
        sample_weight = np.asarray(sample_weight)
        check_consistent_length(X, sample_weight)

    # Calculate neighborhood for all samples. This leaves the original point
    # in, which needs to be considered later (i.e. point i is in the
    # neighborhood of point i. While True, its useless information)
    if metric == 'precomputed' and sparse.issparse(X):
        neighborhoods = np.empty(X.shape[0], dtype=object)
        X.sum_duplicates()  # XXX: modifies X's internals in-place

        # set the diagonal to explicit values, as a point is its own neighbor
        with warnings.catch_warnings():
            warnings.simplefilter('ignore', sparse.SparseEfficiencyWarning)
            X.setdiag(X.diagonal())  # XXX: modifies X's internals in-place

        X_mask = X.data <= eps
        masked_indices = X.indices.astype(np.intp, copy=False)[X_mask]
        masked_indptr = np.concatenate(([0], np.cumsum(X_mask)))
        masked_indptr = masked_indptr[X.indptr[1:-1]]

        # split into rows
        neighborhoods[:] = np.split(masked_indices, masked_indptr)
    else:
        neighbors_model = NearestNeighbors(radius=eps, algorithm=algorithm,
                                           leaf_size=leaf_size,
                                           metric=metric,
                                           metric_params=metric_params, p=p,
                                           n_jobs=n_jobs)
        neighbors_model.fit(X)
        # This has worst case O(n^2) memory complexity
        neighborhoods = neighbors_model.radius_neighbors(X, eps,
                                                         return_distance=False)

    if sample_weight is None:
        n_neighbors = np.array([len(neighbors)
                                for neighbors in neighborhoods])
    else:
        n_neighbors = np.array([np.sum(sample_weight[neighbors])
                                for neighbors in neighborhoods])

    # Initially, all samples are noise.
    labels = np.full(X.shape[0], -1, dtype=np.intp)

    # A list of all core samples found.
    core_samples = np.asarray(n_neighbors >= min_samples, dtype=np.uint8)

    # detect core samples
    if detectFunc is not None:
        starttime = time.time()
        numpy_ori_X = np.asarray(ori_X)
        ## core_samples > min_samples and dc
        # print('number of coresamples {}'.format(np.count_nonzero(core_samples == 1)))
        # for i in range(len(core_samples)):
        #     if core_samples[i] == 1:
        #         if not int(numpy_ori_X[i][3]) >= dc:
        #             # print('numpy_ori_X[i] : {}'.format(numpy_ori_X[i]))
        #             core_samples[i] = 0
        #
        # print('number of coresamples result {}'.format(np.count_nonzero(core_samples == 1)))
        # print('detect core time is {}'.format(time.time() - starttime))

    detectedArray = numpy_ori_X[:, 3:4]
    detectedArray = detectedArray.astype(np.intp)
    detectedArray = np.reshape(detectedArray, (-1,))
    objectDetector = ObjectDetector(detectedArray.shape[0], dc, detectedArray)

    # Deep Filtering of Neighborhoods Graph pr
    detectedCount = deepGraphFiltering(core_samples, neighborhoods, labels, n_neighbors, min_samples, objectDetector)

    # detect core_samples
    temp_detectedCount = detectedCount
    recalc_core(core_samples, neighborhoods, min_samples)

    deep_dbscan_inner(core_samples, neighborhoods, labels, detectedArray, dc, min_samples)
    # print('deep_dbscan_inner_ori detectedCount : {}'.format(temp_detectedCount - detectedCount))

    return np.where(core_samples)[0], labels, detectedCount


def recalc_core(core_samples, neighborhoods, min_samples):
    for i in range(len(core_samples)):
        # if i == 78:
        #     print('core_samples[i] : {}, core_samples[i] : {}'.format(core_samples[i], ) )
        if core_samples[i] and len(neighborhoods[i]) < min_samples:
            core_samples[i] = False


def removeNoise(id, is_core, labels, neighborhoods, minPts, detectFunc):
    labels[id] = -2
    is_core[id] = False
    neighborhoods[id] = np.setdiff1d(neighborhoods[id], [id])

    stack = set([])
    while True:
        # 내 이웃들에서 나를 빼기
        for neighbor_id in neighborhoods[id]:
            neighborhoods[neighbor_id] = np.setdiff1d(neighborhoods[neighbor_id], [id])

        # 내 이웃들을 검사해서 스택에 넣기
        if minPts < len(neighborhoods[id]):
            for neighbor_id in neighborhoods[id]:
                if not detectFunc.hasObjects_with_detectedArray(neighbor_id):
                    neighborhoods[neighbor_id] = np.setdiff1d(neighborhoods[neighbor_id], [neighbor_id])
                    neighborhoods[id] = np.setdiff1d(neighborhoods[id], [neighbor_id])
                    labels[neighbor_id] = -2
                    is_core[neighbor_id] = False
                    stack.add(neighbor_id)

        if 0 == len(stack):
            break

        id = list(stack)[0]
        stack.remove(id)


def deepGraphFiltering(is_core, neighborhoods, labels, n_neighbors, minPts, detectFunc):
    ### ID 부여
    # Create id array
    sorted_n_neighbors = np.array(range(len(neighborhoods))).reshape(len(neighborhoods), -1)

    # A list of false detected nodes
    false_detected_nodes = np.array([])

    # Merge id array and neighbor array
    n_neighbors = np.reshape(n_neighbors, (len(n_neighbors), -1))
    sorted_n_neighbors = np.hstack((sorted_n_neighbors, n_neighbors))

    ### Sort by neighbors length
    sorted_n_neighbors = np.array(sorted(sorted_n_neighbors, key=lambda neighbor: neighbor[1], reverse=True))

    ### Delete point without neighbors.
    noise_index = []
    # print ( sorted_n_neighbors, len(sorted_n_neighbors))
    for i in range(len(sorted_n_neighbors) - 1, 0, -1):
        if sorted_n_neighbors[i][1] <= 1:
            noise_index.append(i)

    # print( noise_index )
    sorted_n_neighbors = np.delete(sorted_n_neighbors, noise_index, 0)

    for i in range(len(sorted_n_neighbors)):
        id = sorted_n_neighbors[i][0]
        is_core[id] = check_is_core(neighborhoods[id], false_detected_nodes, minPts)
        if (isis_core[id] == False):
            continue

        if detectFunc.hasObjects_with_detectedArray(id):
            for neighbor_id in neighborhoods[id]:
                if not detectFunc.hasObjects_with_detectedArray(neighbor_id):
                    fals_detected_nodes.append(neighbor_id)
                    is_core[neighbor_id] = False
            is_core[id] = check_is_core(neighborhoods[id], false_detected_nodes, minPts)

        else:
            false_detected_nodes.append(id)
            is_core[id] = False

    return detectFunc.detectedCount


def check_is_core(neighborArray, falseArray, minPts):
    filtered_neiborhoods = np.setdiff1d(neighborArray, falseArray)
    if len(filtered_neiborhoods) >= minPts:
        return True

    return False


def is_timeoverlap(starttime1, endtime1, starttime2, endtime2, period_second):
    """
    Use UTC time.
    :param starttime1:
    :param endtime1:
    :param starttime2:
    :param endtime2:
    :param period_second:
    :return:
    """
    is_overlap = False
    time1_start = min(starttime1, endtime1)
    time1_end = max(starttime1, endtime1)
    time2_start = min(starttime1, endtime1)
    time2_end = max(starttime1, endtime1)
    time1_start_period = time1_start - period_second
    time1_end_period = time1_end + period_second
    time2_start_period = time2_start - period_second
    time2_end_period = time2_end + period_second

    if time2_start >= time1_start_period and time2_start <= time1_end_period:
        is_overlap = True
    elif time2_end >= time1_start_period and time2_end <= time1_end_period:
        is_overlap = True

    if time1_start >= time2_start_period and time1_start <= time2_end_period:
        is_overlap = True
    elif time1_end >= time2_start_period and time1_end <= time2_end_period:
        is_overlap = True

    return is_overlap


def deepDetection(photoInfos, dc):
    """
    Get the photoInfos that match the detection conditions.
    :param photoInfos: list ori photoInfos[user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat]
    :param dc: int Detection condition
    :return: list Detected photoInfos
    """
    print('Detected count : {}'.format(len(photoInfos)))
    return [p for p in photoInfos if p[3] >= dc]


@logging_time
def deep_dbscan_inner(is_core, neighborhoods, labels,
                      detectedArray, dc=0, minPts=1):
    label_num = 0
    stack = []

    for i in range(labels.shape[0]):
        if labels[i] != -1 or not is_core[i]:
            continue

        # Depth-first search starting from i, ending at the non-core points.
        # This is very similar to the classic algorithm for computing connected
        # components, the difference being that we label non-core points as
        # part of a cluster (component), but don't expand their neighborhoods.
        while True:
            if labels[i] == -1:
                labels[i] = label_num
                if is_core[i]:
                    neighb = neighborhoods[i]
                    for i in range(neighb.shape[0]):
                        v = neighb[i]
                        if labels[v] == -1:
                            stack.append(v)

            if 0 == len(stack):
                break
            i = stack.pop()

        label_num += 1
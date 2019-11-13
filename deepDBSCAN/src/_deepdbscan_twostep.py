
@logging_time
def deepDBSCAN_DP(photoInfos=None, filePath=None):
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

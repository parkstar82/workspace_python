



def runQuery_SpatialFirst( tableName, spatialSelection, deepCondition, dbscanAlgo=dbscan, epsilon, minPts )
    imgList = spatialSelection( tableName,  spatialSelection )
    imgList = deepCondition( imgList )
    clusters = dbscanAlgo( imgList, epsilon, minPts )
    print( clusters )
    return clusters


@logging_time
def deepDBSCAN_SF(photoInfos=None, filePath=None):
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

    dc = 1 # person_count > 0
    checkDcCount = len(photoInfos)
    detectedPhotoInfos = np.array(deepDetection(photoInfos, dc))
    # print('조건을 검사하는 개수 : {}'.format(checkDcCount))
    # print('조건을 만족하는 개수 : {}'.format(len(detectedPhotoInfos)))

    if 0 < len(detectedPhotoInfos):
        coords = (detectedPhotoInfos[:,4:]).astype(dtype='float32')
        coords = np.reshape(coords , (-1,2))

        # define epsilon as 1.5 kilometers, converted to radians for use by haversine
        epsilon = F_EPSILON / kms_per_radian

        #############################################################################
        # Compute DBSCAN
        # db = DBSCAN(eps=epsilon, min_samples=5, algorithm='ball_tree', metric='haversine').fit(np.radians(coords))#, ori_X=df)
        db = DBSCAN(eps=epsilon, min_samples=MIN_PTS, algorithm='ball_tree').fit(np.radians(coords))
        labels = db.labels_
        num_clusters = len(set(labels))
        clusters = pd.Series([coords[labels == n] for n in range(num_clusters)])

        # print(clusters)
        n_clusters, n_clusters_items = count_cluster_items(clusters)
        print('plain Number of clusters : {}, clusters items : {}'.format(n_clusters, n_clusters_items))

        result = np.append(pd.DataFrame(labels).to_numpy(), detectedPhotoInfos, axis=1)
        temp_df = pd.DataFrame(result)
        temp_df.to_csv(filePath, index=False, header=False, encoding='utf-8')

    return checkDcCount
    ################
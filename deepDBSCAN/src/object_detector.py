import numpy as np

class ObjectDetector:
    """
    deepDBSCAN에서 객체검출 엔진을 사용하여 DBSCAN 중에 객체를 검출한다.
    1. 성능측정을 위해 객체검출 시도 회수를 저장한다.
    """
    def __init__(self, list_size=0, dc=0, detectedArray=None):
        self.detectedCount = 0
        ## 1 : person, 0 : not person, -1 : not detected
        self.is_detected = np.full(list_size, -1, dtype=np.intp)
        self.dc = dc
        self.detectedCache = np.full(list_size, -1, dtype=np.intp)
        self.detectedArray = detectedArray



    def hasObjects_with_detectedArray(self, object_index):
        # print('hasObjects : {}'.format(object))
        # print('object >= dc : {}'.format(object >= dc))
        if self.detectedArray is not None:
            if self.is_detected[object_index] == -1:
                self.detectedCount += 1
                if self.detectedArray[object_index] >= self.dc:
                    self.is_detected[object_index] = 1
                else:
                    self.is_detected[object_index] = 0

        return self.detectedArray[object_index] >= self.dc


    def hasObjects(self, object, cache_index):
        # print('hasObjects : {}'.format(object))
        # print('object >= dc : {}'.format(object >= dc))
        if self.is_detected[cache_index] == -1:
            self.detectedCount += 1
            if object >= self.dc:
                self.is_detected[cache_index] = 1
            else:
                self.is_detected[cache_index] = 0

        return object >= self.dc

    def addCacheItem(self, neigh_id):
        self.detectedCache[neigh_id] = True
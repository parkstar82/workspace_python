# Fast inner loop for DBSCAN.
# Author: Lars Buitinck
# License: 3-clause BSD
#
# cython: boundscheck=False, wraparound=False


from numpy import array

# Work around Cython bug: C++ exceptions are not caught unless thrown within
# a cdef function with an "except +" declaration.

detectedCount = 0


# detectFunc는 detection 처리를 위한 함수
def deep_dbscan_inner( is_core, neighborhoods, labels,
                       ori_X, dc=0, minPts=1, detectFunc=None):
    i = 0
    label_num = 0
    v = 0
    neighb : array
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
                            stack.append( v)

            if stack.size() == 0:
                break
            i = stack.pop()

        label_num += 1

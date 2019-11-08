# import deepgeo
#
# engine = deepgeo.Engine()
#
# # add model
# engine.add_model('mscoco','maskrcnn','C:/00.Research/10.paper/2019_04_2019_04.Deep-DBSCAN/deepgeo/config.json')
#
# # create image
# image = deepgeo.Image('https://file.mk.co.kr/meet/neds/2018/08/image_readtop_2018_487988_15332644043411089.jpg','C:/00.Research/10.paper/2019_04_2019_04.Deep-DBSCAN/deepgeo/')
# engine.detect('mscoco',image)
# # image.draw_annotations()
# image.save("C:/00.Research/10.paper/2019_04_2019_04.Deep-DBSCAN/deepgeo/")
# print(image)
#
#

#
# import numpy as np
# from pyqtree import Index
# from scipy.constants import point
#
# x = np.array([1, 2, 3, 4])
# # print(x.shape)
# # print(x)
# #
# # for i in range(len(x)):
# #     print(i)
#
# spindex = Index(bbox=(0, 0, 100, 100))
#
# class Item:
#     def __init__(self, id, bbox):
#         self.id = id
#         self.bbox = bbox
#
# # this example assumes you have a list of items with bbox attribute
# items = [Item(0,(0,0,10,10)),
#         Item(1,(15,15,25,35)),
#         Item(11,(15,15,25,35)),
#         Item(2,(10,20,25,20)),
#         Item(3,(12,32,25,15)),
#         Item(4,(35,35,45,45)),
#         Item(5,(70,70,90,90))]
#
# point_list = []
# for item in items:
#     spindex.insert(item, item.bbox)
#     for point in item.bbox:
#         point_list.append(point)
#
# print(max(point_list))
# print(min(point_list))
# #
# # overlapbbox = (51, 51, 86, 86)
# # overlapbbox = (15, 15, 15, 35)
# # matches = spindex.intersect(overlapbbox)
# # for rbbox in matches:
# #     print(rbbox.id)
#
# # y = np.concatenate(np.array(item.id) for item in items)
#
#
# keytest = {(1,2,(3,4)), (3,2,1,4)}
#
# for key in list(keytest):
#     print(key)
#
# direction1 = 179
# direction2 = 181
# direction3 = 90
# direction4 = 270
#
# a = 100
# b = True
# # print (a if b else 0)
# # print( direction1-180 if (direction1 > 180) else direction1+180)
# # print( direction2-180 if (direction2 > 180) else direction2+180)
# # print( direction3-180 if (direction3 > 180) else direction3+180)
# # print( direction4-180 if (direction4 > 180) else direction4+180)
#
# xx = (3,2,1,4)
# # print( max((3,2,1,4)))
# # print( min((3,2,1,4)))
# # print(xx.index(min(xx[0], xx[2])))
# # print(xx.index(max(xx)))
# line = (3,2,1,4)
# x_min = line.index(min(line[0],line[2]))
# y_min = line.index(min(line[1],line[3]))
# bbox_line = []
# for i in range(len(line)):
#     if i == x_min or i == y_min:
#         bbox_line.append(line[i] + 0.001)
#     else:
#         bbox_line.append(line[i])
#
# print(bbox_line)
#
# # -74.8865	40.029333333333334
# print(round(-74.8865,6))
# print(round(40.029333333333334,6))
# print(int(40.029333333333334*1000000))
# n = -74.8865
#
# print( n * 1000000)
# print( (n * 1000000)/1000000)
#
# print(round()(-74886500/1000000),6)
#
#
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# split input and output
# import numpy as np
# # define array
# data = np.array([[11, 22, 33],
# 		[44, 55, 66],
# 		[77, 88, 99]])
# # separate data
# X = data[:, 1:2]
# X = np.reshape(X, (-1, ))
# print(X)
# print(X[1])
#
# for i in range(5):
# 	print(i)
#
# count = 0
#
# def selfCount(count):
#     count += 1
#     return True, count
#
# # has, count = selfCount(count)
# # print(has)
# # print(count)
# # has, count = selfCount(count)
# # print(count)
# # has, count = selfCount(count)
# # print(count)
#
# for j in range(7):
#     print(j)
#


import numpy as np

def removeNoise(nb_array, item):
    # print('Remove item {}'.format(item))
    for i in range(len(nb_array)):
        print('i : {}'.format(nb_array[i]))
        nb_array[i] = np.setdiff1d(nb_array[i], [item])
        print('i result : {}'.format(nb_array[i]))

# data = [[2,1,3,6,5,4],[6,5,4],[7,1,9,8,2,3]]
# ab = np.array(data)

# print(ab)
# removeNoise(ab,1)
# print(ab)

# arr = np.array([4,5,6,7,8,9,10,11,4,5,6,33,6,7])
# arr = arr[arr != 6]
#
# print('Modified Numpy Array by deleting all occurrences of 6')
# print(arr)

data = [[1, [2,1,3,6,5,4]],[2,[6,5,4]],[3,[7,1,9,8,2,3]]]
# print((data[0])[1])
# print(len((data[0])[1]))
# print(data)
sorted_data = sorted(data, key=lambda length:len(length[1]), reverse=True)
# print(sorted_data)
print(np.shape(sorted_data))

##########
neighborhoods = [[2,1,3,6,5,4],[6,5,4],[7,1,9,8,2,3]]
print(neighborhoods)
neighborhoods = np.reshape(neighborhoods,(len(neighborhoods), -1))
print(neighborhoods)

sorted_neighborhoods = np.array(range(len(neighborhoods))).reshape(len(neighborhoods),-1)
# sorted_neighborhoods = np.array(range(len(neighborhoods)))

print(sorted_neighborhoods)
sorted_neighborhoods = np.hstack((sorted_neighborhoods, neighborhoods))
print(sorted_neighborhoods)
# print(sorted_neighborhoods[0][0])
# print(np.shape(sorted_neighborhoods))
sorted_neighborhoods = np.array(sorted(sorted_neighborhoods, key=lambda neighbor: len(neighbor[1]), reverse=True))
print(sorted_neighborhoods)


def ma(coresample):
    coresample[0] = 1

coresample = [0,0,0,0,0]
print(coresample)
ma(coresample)
print(coresample)

stack = [1,2,3,4,5]
print(stack)
stack.append(6)
print(stack)
print(stack.pop())
print(stack)
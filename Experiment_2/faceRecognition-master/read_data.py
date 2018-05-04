#-*-coding:utf8-*-
__author__ = '万壑'

import os
import cv2
import numpy as np

from read_img import endwith

#输入一个文件路径，对其下的每个文件夹下的图片读取，并对每个文件夹给一个不同的Label
#返回一个img的list,返回一个对应label的list,返回一下有几个文件夹（有几种label)


# .DS_Store (英文全称 Desktop Services Store)是一种由苹果公司的Mac OS X操作系统所创造的隐藏文件
# 目的在于存贮文件夹的自定义属性，例如文件们的图标位置或者是背景色的选择
# lisdirInMac可以删掉.DS_Store
def listdirInMac(path):
    os_list = os.listdir(path)
    for item in os_list:
        if item.startswith('.') and os.path.isfile(os.path.join(path, item)):
            os_list.remove(item)
    return os_list

def read_file(path):
    img_list = []
    label_list = []
    dir_counter = 0
    IMG_SIZE = 128

    #对路径下的所有子文件夹中的所有jpg文件进行读取并存入到一个list中
    for child_dir in listdirInMac(path):
         child_path = os.path.join(path, child_dir)

         for dir_image in listdirInMac(child_path):
             if endwith(dir_image,'jpg'):
                img = cv2.imread(os.path.join(child_path, dir_image))
                resized_img = cv2.resize(img, (IMG_SIZE, IMG_SIZE))
                recolored_img = cv2.cvtColor(resized_img,cv2.COLOR_BGR2GRAY)
                img_list.append(recolored_img)
                label_list.append(dir_counter)

         dir_counter += 1

    # 返回的img_list转成了 np.array的格式
    img_list = np.array(img_list)

    return img_list,label_list,dir_counter

#读取训练数据集的文件夹，把他们的名字返回给一个list
def read_name_list(path):
    name_list = []
    for child_dir in listdirInMac(path):
        name_list.append(child_dir)
    return name_list



if __name__ == '__main__':
    img_list,label_list,counter = read_file('/Users/apple/Downloads/faceRecognition-master/pictures/dataset')
    print(counter)



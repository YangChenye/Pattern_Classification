import cv2
import sys
import logging as log
import datetime as dt
from time import sleep

# 注意这里的路径一定要写明确了
cascPath = "/usr/local/Cellar/opencv/3.4.1_4/share/OpenCV/haarcascades/haarcascade_frontalface_default.xml"
faceCascade = cv2.CascadeClassifier(cascPath)

# 打开视频捕获设备
video_capture = cv2.VideoCapture(0)


while True:
    if not video_capture.isOpened():
        print('Unable to load camera.')
        sleep(5)
        pass

    # 读视频帧
    # read()函数返回视频源中的一帧，在这里视频源是电脑的摄像头。在每一次循环中，它返回一帧的数据frame和一个返回代码ret。
    # 返回代码用来指示在读取视频文件的时候是不是读取完了。使用电脑摄像头不会存在读取完了的问题，返回代码可以忽略。
    ret, frame = video_capture.read()

    # 转为灰度图像
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # 调用分类器进行检测
    # detectMultiScale 函数是一个检测物体的通用函数。我们在人脸 cascade 上调用它，它检测的就是人脸。
    faces = faceCascade.detectMultiScale(
        gray,                                       # 灰度图片
        scaleFactor=1.1,                            # 有的人脸离镜头近，会比其他人脸更大。ScaleFactor 对此进行补偿。
        minNeighbors=5,                             # 检测算法使用移动窗口来检测物体。
                                                    # 在系统宣布检测到人脸之前，minNeighbors 会对当前其周围有多少物体进行定义
        minSize=(30, 30),                           # MinSize 给出每个窗口的大小
        # flags=cv2.cv.CV_HAAR_SCALE_IMAGE
    )
    # 当该函数认为它找到一张人脸时，会返回一个矩形列表。
    # 下一步，我们会进行循环，直到它认为检测出了什么。


    # 画矩形框
    # 该函数返回四个值：矩形的x和y坐标，以及它的高和宽
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)


    # 显示视频
    cv2.imshow('Video', frame)

    # 按下q键终止程序
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


# 关闭摄像头设备
video_capture.release()

# 关闭所有窗口
cv2.destroyAllWindows()

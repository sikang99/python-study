## NVIDIA Jetson Boards





### Articles
- 2020/03/17 [MixPose: AI on the Edge streaming platform for yoga instructors and fitness coaches.](https://www.hackster.io/mixpose/mixpose-722df5#toc-step-4--setup-webrtc-6)
- 2020/02/07 [Get to know the Jetson Nano in this face detection project using the Raspberry Pi camera and OpenCV!](https://maker.pro/nvidia-jetson/tutorial/real-time-face-detection-on-jetson-nano-using-opencv)


### Open Source
- []




### Tips
```
$ gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=3820, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw,width=480, height=320' ! nvvidconv ! nvegltransform ! nveglglessink -e
```




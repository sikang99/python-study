## NVIDIA Jetson Boards : [Docker](DOCKER.md), [Camera](CAMERA.md)


### Articles
- 2020/03/17 [MixPose: AI on the Edge streaming platform for yoga instructors and fitness coaches.](https://www.hackster.io/mixpose/mixpose-722df5#toc-step-4--setup-webrtc-6)
- 2020/02/21 [Camera - CSI Camera (Raspberry Pi camera V2)](https://spyjetson.blogspot.com/2020/02/camera-csi-camera-raspberry-pi-camera-v2.html)
- 2020/02/07 [Get to know the Jetson Nano in this face detection project using the Raspberry Pi camera and OpenCV!](https://maker.pro/nvidia-jetson/tutorial/real-time-face-detection-on-jetson-nano-using-opencv)
- 2020/01/17 [NVIDIA Jetson Nano Developer Kit-B01 Gets an Extra Camera Connector](https://www.cnx-software.com/2020/01/17/nvidia-jetson-nano-developer-kit-b01-gets-an-extra-camera-connector/)
- 2019/04/22 [How to run TensorFlow Object Detection model on Jetson Nano](https://medium.com/swlh/how-to-run-tensorflow-object-detection-model-on-jetson-nano-8f8c6d4352e8)


### Information
- [Jetson Nano](https://elinux.org/Jetson_Nano)
- [Jetson Download Center](https://developer.nvidia.com/embedded/downloads)
- [Vision Programming Interface (VPI)](https://developer.nvidia.com/embedded/vpi)
    - [VPI](https://docs.nvidia.com/vpi/index.html) - VPI - Vision Programming Interface Documentation
    - [NVIDIA Vision Programming Interface (VPI) Demo](https://developer.ridgerun.com/wiki/index.php?title=NVIDIA_Vision_Programming_Interface_(VPI)_Demo)
- desertbot.io: [Jetson](https://desertbot.io/jetson/)
- [OpenDataCam](https://opendata.cam/)

### Open Source
- [elloza/awesome-jetson-nano](https://github.com/elloza/awesome-jetson-nano)
- [rbonghi/jetson_stats](https://github.com/rbonghi/jetson_stats) - jtop
- [rbonghi/ros_jetson_stats](https://github.com/rbonghi/ros_jetson_stats)
- [bobboteck/jetbot_ros_webconsole](https://github.com/bobboteck/jetbot_ros_webconsole) - Jetbot ROS Web Console
- [AastaNV/00-video_stabilization](https://github.com/AastaNV/00-video_stabilization)
- [JetsonHacksNano/CSI-Camera](https://github.com/JetsonHacksNano/CSI-Camera)
- [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers) - Machine Learning Containers for NVIDIA Jetson and JetPack-L4T
- [jetsonhacks/installROS](https://github.com/jetsonhacks/installROS)
- [JetsonHacksNano/buildOpenCV](https://github.com/JetsonHacksNano/buildOpenCV)
- [theerawatramchuen/Jetson-Nano-Installation](https://github.com/theerawatramchuen/Jetson-Nano-Installation) 
- [**gsurma/jetson**](https://github.com/gsurma/jetson) - Self-driving AI toy car
- [Tony607/tf_jetson_nano](https://github.com/Tony607/tf_jetson_nano)
- [jocover/jetson-ffmpeg](https://github.com/jocover/jetson-ffmpeg) - ffmpeg support on jetson nano
- [opendatacam/opendatacam](https://github.com/opendatacam/opendatacam) - An open source tool to quantify the world
- [NVIDIA/jetson-gpio](https://github.com/NVIDIA/jetson-gpio)
- [NVIDIA/NvPipe](https://github.com/NVIDIA/NvPipe) - NVIDIA-accelerated zero latency video compression library for interactive remoting applications
    - [NVIDIA Video Codec SDK](https://developer.nvidia.com/nvidia-video-codec-sdk)



### Tips
```
$ gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=3820, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw,width=480, height=320' ! nvvidconv ! nvegltransform ! nveglglessink -e
```

```
not use v4l2src
v4l2-ctl -d /dev/video0 --set-fmt-video=width=1920,height=1080,pixelformat=RG10 --set-ctrl bypass_mode=0 --stream-mmap --stream-count=50
```

```
sudo apt install guvcview
```


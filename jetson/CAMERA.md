## Jetson Nano Camera


### Articles
- 2020/05/10 [Raspberry Pi Foundation Announces Libcamera-Based Open Source Camera Stack](https://www.hackster.io/news/raspberry-pi-foundation-announces-libcamera-based-open-source-camera-stack-eb41f911c9f7)
- 2020/02/21 [Camera - CSI Camera (Raspberry Pi camera V2)](https://spyjetson.blogspot.com/2020/02/camera-csi-camera-raspberry-pi-camera-v2.html)
- 2019/08/27 [Jetson Nano - Developing a Pi v1.3 camera driver Part 2](https://jas-hacks.blogspot.com/2019/08/jetson-nano-developing-pi-v13-camera.html)
- 2019/06/23 [Jetson Nano – Developing a Pi v1.3 camera driver Part 1](https://jas-hacks.blogspot.com/2019/06/jetson-nano-developing-pi-v13-camera.html)
- 2019/07/25 [Access to complex video devices with libcamera](https://lwn.net/Articles/794555/)


### Articles (Korean)
- [opencv를 사용하여 Jetson 내장 Camera 영상 받아오기](https://kyubot.tistory.com/95)


### Information
- [NVIDIA Jetson Linux Developer Guide](https://docs.nvidia.com/jetson/l4t/index.html))
    - [Camera Development](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/camera_dev.html#)
- [RidgeRun](https://developer.ridgerun.com/wiki/index.php)
    - [V4L2 driver for camera sensor or capture chip](https://developer.ridgerun.com/wiki/index.php?title=V4L2_driver_for_camera_sensor_or_capture_chip)
- [Allied Vision](https://www.alliedvision.com/en/digital-industrial-camera-solutions.html)
- [ArduCam](https://www.arducam.com)
    - [Jetson Cameras](https://www.arducam.com/docs/camera-for-jetson-nano/)
- [e-con Systems](https://www.e-consystems.com)
    - [Jetson Cameras](https://www.e-consystems.com/nvidia-jetson-camera.asp)
- [ximea](https://www.ximea.com/)
    - [Carrier board for NVIDIA Jetson and cameras](https://www.ximea.com/en/products/xilab-application-specific-custom-oem/embedded-vision-and-multi-camera-setup-xix/carrier-board-for-nvidia-jetson-and-cameras)
- [Fastvideo](https://www.fastcompression.com/) - GPU Image Processing
    - [Jetson image processing for camera applications](https://www.fastcompression.com/blog/jetson-image-processing.htm)
- [VEYE Imaging](http://veye.cc/en) : China
    - [Nvidia Jetson Camera](http://www.veye.cc/en/product/nivdia-jetson-camera/)
    - [CS-MIPI-IMX307 for Jetson Nano](http://wiki.veye.cc/index.php/CS-MIPI-IMX307_for_Jetson_Nano)
- [Soho Enterprise](https://soho-enterprise.com/) : Japan
- [libcamera](https://libcamera.org/) - An open source camera stack and framework for Linux, Android, and ChromeOS
    - [libcamera and libcamera-apps installation for Raspberry Pi](https://github.com/raspberrypi/documentation/tree/master/linux/software/libcamera)
- [libuvc](https://ken.tossell.net/libuvc/doc/index.html)


### Open Source
- [alliedvision/linux_nvidia_jetson](https://github.com/alliedvision/linux_nvidia_jetson) - Allied Vision CSI-2 camera driver for NVIDIA Jetson Nano, TX2, and Xavier
- [fastvideo/gpu-camera-sample](https://github.com/fastvideo/gpu-camera-sample)
- [kbingham/libcamera](https://github.com/kbingham/libcamera) - backup of git://linuxtv.org/libcamera.git
- [ktossell/libuvc]( https://github.com/ktossell/libuvc)
    - [ricohapi/libuvc-theta](https://github.com/ricohapi/libuvc-theta) - a cross-platform library for USB video devices
    - [ricohapi/libuvc-theta-sample](https://github.com/ricohapi/libuvc-theta-sample) 
- [ArduCAM/MIPI_Camera](https://github.com/ArduCAM/MIPI_Camera) 
- [IMX219-83 Stereo Camera](https://www.waveshare.com/wiki/IMX219-83_Stereo_Camera)



### Tips
```
sudo apt install v4l-utils
v4l2-ctl --info --list-devices
v4l2-ctl --list-formats-ext -d 0
```
```
gst-launch-1.0 nvarguscamerasrc ! nvoverlaysink
```

```
gst-launch-1.0 nvarguscamerasrc gainrange="16 16" ! \
    'video/x-raw(memory:NVMM),width=1280, height=720, framerate=60/1' ! \
    nvvidconv flip-method=0 ! 'video/x-raw,width=1280, height=720' ! \
    nvvidconv ! nvegltransform ! nveglglessink -e
```

```
gst-launch-1.0 nvarguscamerasrc ! \
    'video/x-raw(memory:NVMM),width=1280, height=720, framerate=30/1, format=NV12' ! \
    nvvidconv flip-method=0 ! nvvidconv ! nvegltransform ! nveglglessink -e
```


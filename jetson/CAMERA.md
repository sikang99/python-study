## Jetson Nano Camera


### Articles
- 2019/08/27 [Jetson Nano - Developing a Pi v1.3 camera driver Part 2](https://jas-hacks.blogspot.com/2019/08/jetson-nano-developing-pi-v13-camera.html)
- 2019/06/23 [Jetson Nano – Developing a Pi v1.3 camera driver Part 1](https://jas-hacks.blogspot.com/2019/06/jetson-nano-developing-pi-v13-camera.html)



### Information
- [V4L2 driver for camera sensor or capture chip](https://developer.ridgerun.com/wiki/index.php?title=V4L2_driver_for_camera_sensor_or_capture_chip)
- [NVIDIA Jetson Linux Developer Guide](https://docs.nvidia.com/jetson/l4t/index.html))
    - [Camera Development](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/camera_dev.html#)



### Open Source
- [alliedvision/linux_nvidia_jetson](https://github.com/alliedvision/linux_nvidia_jetson) - Allied Vision CSI-2 camera driver for NVIDIA Jetson Nano, TX2, and Xavier


### Tips
```
gst-launch-1.0 nvarguscamerasrc gainrange="16 16" !\
    'video/x-raw(memory:NVMM),width=1280, height=720, framerate=60/1' !\
    nvvidconv flip-method=0 ! 'video/x-raw,width=1280, height=720' !\
    nvvidconv ! nvegltransform ! nveglglessink -e
```


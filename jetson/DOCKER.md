## Docker for NVIDIA Jetson Boards


### Articles
- 2021/02/07 [LiDAR integration with ROS 2 Foxy on the Nvidia Jetson Board](https://www.hackster.io/shahizat005/lidar-integration-with-ros-2-foxy-on-the-nvidia-jetson-board-34fa62)
- 2020/01/24 [How to get your CUDA application running in a Docker container](https://www.celantur.com/blog/run-cuda-in-docker-on-linux/) 



### Information
- [NVIDIA NGC](https://ngc.nvidia.com/catalog)
    - [Containers](https://ngc.nvidia.com/catalog/containers)
- [Containers For Deep Learning Frameworks User Guide](https://docs.nvidia.com/deeplearning/frameworks/user-guide/index.html)
- [Container Toolkit User Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/user-guide.html)


### Open Source
- [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker) - Build and run Docker containers leveraging NVIDIA GPUs
- [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers)
- [osrf/docker_images](https://github.com/osrf/docker_images)
- [micro-ROS/docker](https://github.com/micro-ROS/docker)
- [BouweCeunen/computer-vision-jetson-nano](https://github.com/BouweCeunen/computer-vision-jetson-nano) - Object detection with SSD MobileNet v2 COCO model optimized with TensorRT on NVIDIA Jetson Nano



### Tips
- Account
	```
	$ docker login nvcr.io
	Username: $oauthtoken
	Password: cGVyMGE5a2poNjc0Y2hlMDY5bjduYzZjZ286MWIxZGVlMzktNzgzYi00MDM0LTk5NmMtYTFhOGJlM2VjNGFj
	```

```
docker run --privileged -it bouwe/computer-vision-jetson-nano:latest
docker run --privileged --entrypoint /bin/systemd -it bouwe/jetson-nano-vision:latest
```


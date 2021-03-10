## Docker for NVIDIA Jetson Boards


### Articles
- 2021/02/07 [LiDAR integration with ROS 2 Foxy on the Nvidia Jetson Board](https://www.hackster.io/shahizat005/lidar-integration-with-ros-2-foxy-on-the-nvidia-jetson-board-34fa62)
- 2020/11/18 [Docker for Nvidia GPU](http://www.legendu.net/misc/blog/docker-for-nvidia-gpu/)
- 2020/09/22 [Nvidia drivers docker](https://www.xspdf.com/resolution/54156497.html)
- 2020/08/28 [Tutorial: Deploying TensorFlow Models at the Edge with NVIDIA Jetson Nano and K3s](https://thenewstack.io/tutorial-deploying-tensorflow-models-at-the-edge-with-nvidia-jetson-nano-and-k3s/)
- 2020/06/04 [Jetson Xavier NX vs. Jetson Nano - Detailed comparison](https://www.hackster.io/dmitrywat/jetson-xavier-nx-vs-jetson-nano-detailed-comparison-aa9cd7)
- 2020/06/03 [Running Docker Containers for the NVIDIA Jetson Nano](https://dev.to/caelinsutch/running-docker-containers-for-the-nvidia-jetson-nano-5a06)
- 2020/01/24 [How to get your CUDA application running in a Docker container](https://www.celantur.com/blog/run-cuda-in-docker-on-linux/) 
- 2018/01/26 [Docker for Gazebo-ROS Simulations](http://moore-mike.com/docker-ros.html)


### Articles (Korean)
- 2021/01/29 [Jetson nano AI course Headless mode 요약](https://endland.medium.com/jetson-nano-ai-course-headless-mode-%EC%9A%94%EC%95%BD-7b19548e9b2a)
- StereoLabs: [Creating a Docker Image for your Application](https://www.stereolabs.com/docs/docker/creating-your-image/)


### Information
- [NVIDIA Cloud Native Technologies](https://docs.nvidia.com/datacenter/cloud-native/index.html)
- [DeepStream Docker Container for Jetson](https://docs.nvidia.com/metropolis/deepstream/dev-guide/text/DS_docker_containers.html#a-docker-container-for-jetson)
- [NVIDIA NGC](https://ngc.nvidia.com/catalog)
    - [Containers](https://ngc.nvidia.com/catalog/containers)
- [Containers For Deep Learning Frameworks User Guide](https://docs.nvidia.com/deeplearning/frameworks/user-guide/index.html)
- [Container Toolkit User Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/user-guide.html)
- [Nvidia rendering on Docker](https://askubuntu.com/questions/1294995/nvidia-rendering-on-docker)
- [How to Install ZED SDK with Docker on Linux](https://www.stereolabs.com/docs/docker/install-guide-linux/)
- [PX4 Docker Containers](https://docs.px4.io/master/en/test_and_ci/docker.html)
- [Using Hardware Acceleration with Docker](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration)


### Open Source
- [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker) - Build and run Docker containers leveraging NVIDIA GPUs
- [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers)
- [osrf/docker_images](https://github.com/osrf/docker_images)
- [osrf/rocker](https://github.com/osrf/rocker)
- [micro-ROS/docker](https://github.com/micro-ROS/docker)
- [BouweCeunen/computer-vision-jetson-nano](https://github.com/BouweCeunen/computer-vision-jetson-nano) - Object detection with SSD MobileNet v2 COCO model optimized with TensorRT on NVIDIA Jetson Nano
- [stereolabs/zed-docker](https://github.com/stereolabs/zed-docker)
- [atinfinity/jetson_ros_docker](https://github.com/atinfinity/jetson_ros_docker) - Dockerfile to launch ROS on NVIDIA Jetson devices
- [atinfinity/isaac_sdk_docker](https://github.com/atinfinity/isaac_sdk_docker) - Dockerfile to use NVIDIA Isaac SDK on Docker container



### Papers
- 2017 [ROS and Docker](https://www.researchgate.net/publication/317751755_ROS_and_Docker)



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


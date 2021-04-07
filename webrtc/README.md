## WebRTC


### Articles
- 2021/08/21 [時雨堂の WebRTC に関する取り組み](https://medium.com/shiguredo/%E6%99%82%E9%9B%A8%E5%A0%82%E3%81%AE-webrtc-%E3%81%AB%E9%96%A2%E3%81%99%E3%82%8B%E5%8F%96%E3%82%8A%E7%B5%84%E3%81%BF-49c9ccd71638)
- 2021/02/12 [Python WebRTC basics with aiortc](https://dev.to/whitphx/python-webrtc-basics-with-aiortc-48id)
- 2021/01/30 [Streaming video over WebRTC using FFmpeg](https://blog.maxwellgale.com/2021/01/30/streaming-video-over-webrtc-using-ffmpeg/)
- 2020/09/24 [The CoScreen Manifesto: Deep Collaboration for Engineering Teams](https://medium.com/coscreen/the-coscreen-manifesto-deep-collaboration-for-engineering-teams-5a5305ec8445)
- 2020/05/08 [Building a Multi-Camera Media Server for AI Processing on the NVIDIA Jetson Platform](https://developer.nvidia.com/blog/building-multi-camera-media-server-ai-processing-jetson/)
- [pion-http-proxy (p2p REST/JSON/GRPC over WebRTC)](https://www.gitmemory.com/issue/pion/awesome-pion/14/753387891)


### Information
- [NVIDIA Hardware Acceleration in the WebRTC Framework](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/hardware_acceleration_in_webrtc.html)
- [GstWebRTC - OpenWebRTC Web Page - TX1/TX2](https://developer.ridgerun.com/wiki/index.php?title=GstWebRTC_-_OpenWebRTC_Web_Page_-_TX1/TX2)
- [WebRTC](https://wiki.nikitavoloboev.xyz/web/webrtc)
- ROS Wiki: [webrtc](http://wiki.ros.org/webrtc)
    - [webrtc_ros](http://wiki.ros.org/webrtc_ros)
- [RTCBot’s documentation](https://rtcbot.readthedocs.io/en/latest/)


### Slides
- 2019 [Beyond the WebRTC.org monoculture](https://archive.fosdem.org/2019/schedule/event/beyond_webrtc_monoculture/attachments/slides/3219/export/events/attachments/beyond_webrtc_monoculture/slides/3219/Beyond_the_WebRTC_org_monoculture.pdf)


### Review and Discussion
- [Javascript / Go plug-and-play server-side WebRTC support for webcam streaming](https://codereview.stackexchange.com/questions/248425/javascript-go-plug-and-play-server-side-webrtc-support-for-webcam-streaming)



### Open Source
- [aiortc/aiortc](https://github.com/aiortc/aiortc) - WebRTC and ORTC implementation for Python using asyncio
- [shiguredo/momo](https://github.com/shiguredo/momo) - WebRTC Native Client Momo
- [CoSMoSoftware/OBS-studio-webrtc](https://github.com/CoSMoSoftware/OBS-studio-webrtc)
- [jsmouret/grpc-over-webrtc](https://github.com/jsmouret/grpc-over-webrtc) - gRPC over WebRTC
- [pion/awesome-pion](https://github.com/pion/awesome-pion) - A curated list of awesome things related to Pion
- [eufat/nodeflux-aiortc](https://github.com/eufat/nodeflux-aiortc) - WebRTC streamer using aiortc in python
- [RobotWebTools/webrtc_ros](https://github.com/RobotWebTools/webrtc_ros) - Streaming of ROS Image Topics using WebRTC
- [ros-melodic-webrtc](http://ftp.osuosl.org/pub/ros-shadow-fixed/pool/main/r/ros-melodic-webrtc/)

```
v4l2src device=/dev/video1 ! video/x-raw,width=640,height=480 ! videoconvert ! video/x-raw,format=I420,width=640,height=480 ! queue ! tee name=camera0 \
nvarguscamerasrc ! nvvidconv ! video/x-raw,format=I420,width=640,height=480 ! queue ! tee name=camera1 \
camera0. ! video/x-raw,format=I420,width=640,height=480 ! nvvideoconvert ! video/x-raw(memory:NVMM),format=NV12,width=640,height=480 ! nvstreammux0.sink_0 \
camera0. ! video/x-raw,format=I420,width=640,height=480 ! nvvideoconvert ! video/x-raw(memory:NVMM),format=NV12,width=640,height=480 ! nvstreammux0.sink_1 \
camera1. ! video/x-raw,format=I420,width=640,height=480 ! nvvideoconvert ! video/x-raw(memory:NVMM),format=NV12,width=640,height=480 ! nvstreammux0.sink_2 \
camera1. ! video/x-raw,format=I420,width=640,height=480 ! nvvideoconvert ! video/x-raw(memory:NVMM),format=NV12,width=640,height=480 ! nvstreammux0.sink_3 \
nvstreammux name=nvstreammux0 batch-size=4 batched-push-timeout=40000 width=640 height=480 ! queue ! \
nvinfer batch-size=4 config-file-path=deepstream-models/config_infer_primary_4_cameras.txt ! queue ! \
nvtracker ll-lib-file=deepstream-models/libnvds_mot_klt.so enable-batch-process=true ! queue ! \
nvmultistreamtiler width=640 height=480 rows=2 columns=2 ! nvvideoconvert ! nvdsosd ! queue ! tee name=deep \
deep. ! nvvideoconvert ! nvv4l2h264enc insert-sps-pps=true iframeinterval=10 ! tee name=h264 \
deep. ! nvvideoconvert ! nvv4l2h265enc insert-sps-pps=true iframeinterval=10 ! tee name=h265 \
deep. ! nvvideoconvert ! nvv4l2vp9enc ! tee name=vp9 \
deep. ! nvvideoconvert ! video/x-raw,width=640,height=480 ! nvjpegenc ! tee name=jpeg \
h264. ! h264parse ! matroskamux ! filesink name=file location=test-h264-0.mkv \
h265. ! h265parse ! matroskamux ! filesink name=file location=test-h265-0.mkv \
vp9. ! matroskamux ! filesink name=file location=test-vp9-0.mkv \
jpeg. ! filesink name=file location=test-snapshot0.jpg
```


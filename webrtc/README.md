## WebRTC


### Articles
- 2021/01/30 [Streaming video over WebRTC using FFmpeg](https://blog.maxwellgale.com/2021/01/30/streaming-video-over-webrtc-using-ffmpeg/)
- 2020/09/24 [The CoScreen Manifesto: Deep Collaboration for Engineering Teams](https://medium.com/coscreen/the-coscreen-manifesto-deep-collaboration-for-engineering-teams-5a5305ec8445)
- 2020/05/08 [Building a Multi-Camera Media Server for AI Processing on the NVIDIA Jetson Platform](https://developer.nvidia.com/blog/building-multi-camera-media-server-ai-processing-jetson/)


### Information
- [NVIDIA Hardware Acceleration in the WebRTC Framework](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/hardware_acceleration_in_webrtc.html)
- [GstWebRTC - OpenWebRTC Web Page - TX1/TX2](https://developer.ridgerun.com/wiki/index.php?title=GstWebRTC_-_OpenWebRTC_Web_Page_-_TX1/TX2)


### Open Source
- [aiortc/aiortc](https://github.com/aiortc/aiortc) - WebRTC and ORTC implementation for Python using asyncio
- [shiguredo/momo](https://github.com/shiguredo/momo) - WebRTC Native Client Momo
- [CoSMoSoftware/OBS-studio-webrtc](https://github.com/CoSMoSoftware/OBS-studio-webrtc)
- [jsmouret/grpc-over-webrtc](https://github.com/jsmouret/grpc-over-webrtc) - gRPC over WebRTC



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


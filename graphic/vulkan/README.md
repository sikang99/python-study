## Vulkan



### Articles
- 2021/07/10 [**GStreamer Making Progress On Vulkan Video Support**](https://www.phoronix.com/scan.php?page=news_item&px=Vulkan-Video-GStreamer-Igalia)
- 2021/07/09 [Video decoding in GStreamer with Vulkan](https://blogs.igalia.com/vjaquez/2021/07/09/video-decoding-in-gstreamer-with-vulkan/)
- 2021/04/13 [Vulkan Video Arrives For New Industry-Standard Video Encode/Decode](https://www.phoronix.com/scan.php?page=news_item&px=Vulkan-Video-Provisional-Spec)
- 2021/04/10 [Graphics acceleration on the Raspberry Pi Zero](https://symbolibre.org/graphics-acceleration-on-the-raspberry-pi-zero.html)
- 2020/07/01 [Eben Upton Announces Official Raspberry Pi 4 VideoCore VI Open Source Vulkan Graphics Driver Effort](https://www.hackster.io/news/eben-upton-announces-official-raspberry-pi-4-videocore-vi-open-source-vulkan-graphics-driver-effort-9af11a00adfd)
- 2020/06/23 [Raspberry Pi VideoCore IV Boards Get an Unofficial Vulkan Driver Good Enough to Play Quake 3](https://www.cnx-software.com/2020/06/23/raspberry-pi-videocore-iv-boards-get-an-unofficial-vulkan-driver-good-enough-to-play-quake-3/)
- 2016/02/16 [Vulkan in GStreamer](https://ystreet00.blogspot.com/2016/02/vulkan-in-gstreamer.html)
    - `gst-launch-1.0 videotestsrc ! vulkanupload ! vulkansink`
    - `gst-launch-1.0 filesrc location=big_buck_bunny_1080p_h264.mov ! parsebin ! vulkanh264dec ! fakesink`


### Information
- [Vulkan](https://www.vulkan.org/) - Cross-Platform 3D Graphics
- [An Introduction to Vulkan Video](https://www.khronos.org/blog/an-introduction-to-vulkan-video)
- [Vulkan® 1.2.184 - A Specification (with all registered Vulkan extensions)](https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/index.html)
- [Vulkan Driver Support](https://developer.nvidia.com/vulkan-driver)
- [Install Vulkan on a Raspberry Pi 4](https://qengineering.eu/install-vulkan-on-raspberry-pi.html) - PiKISS
- [Mesa 3D](https://mesa3d.org/) - The Mesa 3D Graphics Library
    - Open source implementations of OpenGL, OpenGL ES, Vulkan, OpenCL, and more!


### Videos 
- 2018 [Zink: OpenGL on Vulkan (Lightning Talk)](https://www.youtube.com/watch?v=ukrB-Lbl_Jg)


### Open Source
- [nvpro-samples/vk_video_samples](https://github.com/nvpro-samples/vk_video_samples) - Vulkan video samples
- [KhronosGroup/Vulkan-Docs](https://github.com/KhronosGroup/Vulkan-Docs) - The Vulkan API Specification and related tools
- [Yours3lf/rpi-vk-driver](https://github.com/Yours3lf/rpi-vk-driver) - VK driver for the Raspberry Pi (Broadcom Videocore IV)
- [Yours3lf/vkQuake3](https://github.com/Yours3lf/vkQuake3) - ts based on ioq3，I add a vulkan based modular render back end
- [kennyalive/Quake-III-Arena-Kenny-Edition](https://github.com/kennyalive/Quake-III-Arena-Kenny-Edition) - The cradle of Quake III Arena


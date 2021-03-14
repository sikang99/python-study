# Build ffmpeg on Jetson Nano(2)

Echo "execute following steps of from 1 to 7"

# 1. Clone ffnvcodec
#git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git

# 2. Install ffnvcodec
#cd nv-codec-headers && sudo make install && cd ..

# 3. Clone FFmpeg's public GIT repository
#git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/

# 4. Install necessary packages
#sudo apt-get install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

# 5. Configure
#cd ffmpeg && ./configure --enable-nonfree --enable-cuda-sdk --enable-libnpp \
#	--extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64

# 6. Compile
#make -j4

# 7. Install the libraries
#sudo make install


# Usage examples

# 3.1 1:1 hwaccel transcode without scaling
#ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4

# 3.2 1:1 hwaccel transcode with scaling
#ffmpeg -y -vsync 0 -hwaccel cuvid –resize 1280x720 -c:v h264_cuvid -i input.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4
#ffmpeg -y -vsync 0 -hwaccel cuvid –crop 16x16x32x32 -c:v h264_cuvid -i input.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4
#ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 -vf scale_cuda=1280:720 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4
#ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 -vf scale_npp=1280:720 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4

# 3.3 1:N hwaccel transcode without scaling
#ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 \
#	-vf scale_npp=1920:1080 -c:a copy -c:v h264_nvenc -b:v 5M output1.mp4 \
#	-vf scale_npp=1280:720 -c:a copy -c:v h264_nvenc -b:v 8M output2.mp4

# 3.4 1:N hwaccel transcode from yub or raw data
ffmpeg -y -vsync 0 -pix_fmt yuv420p -s 1920x1080 -i input.yuv \
	-filter_complex "[0:v]hwupload_cuda,split=4[o1][o2][o3][o4]" \
	-map "[o1]" -c:v h264_nvenc -b:v 8M output1.mp4 \
	-map "[o2]" -c:v h264_nvenc -b:v 10M output2.mp4 \
	-map "[o3]" -c:v h264_nvenc -b:v 12M output3.mp4 \
	-map "[o4]" -c:v h264_nvenc -b:v 14M output4.mp4

# 3.5 Multiple 1:N hwaccel transcode with scaling
ffmpeg -y -hwaccel cuvid -c:v h264_cuvid -i input1.mp4 \
	-hwaccel cuvid -c:v h264_cuvid -i input2.mp4 \
	-map 0:0 -vf scale_npp=640:480 -c:v h264_nvenc -b:v 1M output11.mp4 \
	-map 0:0 -vf scale_npp=320:240 -c:v h264_nvenc -b:v 500k output12.mp4 \
	-map 1:0 -vf scale_npp=1280:720 -c:v h264_nvenc -b:v 3M output21.mp4 \
	-map 1:0 -vf scale_npp=640:480 -c:v h264_nvenc -b:v 2M output22.mp4


# 3.6 Multiple 1:N hwaccel transcode with scaling
ffmpeg -y -init_hw_device cuda=foo:bar -filter_hw_device foo -i input1.mp4 -i input2.mp4 \
	-map 0:0 -vf hwupload,scale_npp=640:480 -c:v h264_nvenc -b:v 1M output11.mp4 \
	-map 0:0 -vf hwupload,scale_npp=320:240 -c:v h264_nvenc -b:v 500k output12.mp4 \
	-map 1:0 -vf hwupload,scale_npp=1280:720 -c:v h264_nvenc -b:v 2M output21.mp4 \
	-map 1:0 -vf hwupload,scale_npp=640:480 -c:v h264_nvenc -b:v 1M output22.mp4

# 4 Quality testing
# 4.1 Video encoding
ffmpeg -y -vsync 0 –s 1280x720 –i input.yuv -c:v h264_nvenc output.mp4

# 4.2 Video Decoding
ffmpeg -y -vsync 0 -c:v h264_cuvid -i input.mp4 output.yuv

# Command-line for latency-tolerant high-quality video transcoding
ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 \
	-c:a copy -c:v h264_nvenc -preset slow -profile high \
	-b:v 5M -bufsize 5M -maxrate 10M -qmin 0 -g 250 -bf 2 -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 \
	output.mp4

# Command-line for latency-tolerant low-latency video transcoding
ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -i input.mp4 \
	-c:a copy -c:v h264_nvenc -preset llhq -profile high \
	-b:v 5M -bufsize 167K -maxrate 5M -g 999999 -bf 0 output.mp4

# LLHQ (Low Latency High Quality) Preset, use -preset llhq
# LLHP (Low Latency High performance) Preset, use -preset llhp



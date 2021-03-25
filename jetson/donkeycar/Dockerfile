ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.4.4
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install \
	apt-utils build-essential libtool pkg-config wget git curl make cmake 

ENV TZ=Asia/Seoul
RUN apt-get -y install tzdata

# Install common media libs
RUN apt-get -y install \
	libavformat-dev libavcodec-dev libavfilter-dev libavdevice-dev libavutil-dev \
	libswscale-dev libswresample-dev libpostproc-dev

# Install codecs and protocols
RUN apt-get -y install \
	libopus-dev libvpx-dev libx264-dev \
        libsrtp2-dev 

# Install ffmpeg and libs after building 
RUN apt-get -y install \
        pulseaudio libpulse-dev yasm

ENV FFMPEG=4.2.3
RUN wget http://www.ffmpeg.org/releases/ffmpeg-${FFMPEG}.tar.xz && \
    tar xf ffmpeg-${FFMPEG}.tar.xz

RUN cd ffmpeg-${FFMPEG} && \
    ./configure --enable-shared --enable-nonfree \
	--enable-cuda-nvcc --extra-cflags=-I/usr/local/include --extra-ldflags=-L/usr/local/cuda/lib6 && \
    make -j4 && \
    make install

RUN echo '/usr/local/lib' >> /etc/ld.so.conf && \
    ldconfig

# Install python3 base tools
RUN apt-get -y install \
	python3-dev python3-pip \
	python3-numpy python3-cffi python3-opencv

RUN pip3 install -U pip 
RUN pip3 install setuptools aioice aiortc rtcbot


WORKDIR /
#ADD ./examples /home/examples

CMD ["bash"]
WORKDIR /

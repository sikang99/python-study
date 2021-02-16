## Normal ffmpeg
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
cd ffmpeg
./configure --disable-static --enable-shared --disable-doc
make
sudo make install
sudo ldconfig


## Hardware accelerated ffmpeg
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers && sudo make install && cd ..

sudo apt-get install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
cd ffmpeg
./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64
make -j4
sudo make install
sudo ldconfig

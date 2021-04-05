#
# Makefile for building opencv
#
PKG=protobuf
VERSION=3.15.7
usage:
	@echo "usage: make [1,preinstall|2,download|3,checkout|4,configure|5,build|6,install] for $(PKG)"

1 preinstall:
	sudo apt install -y autoconf libtool

2 download:
	#git clone https://github.com/protocolbuffers/protobuf protobuf-github
	wget https://github.com/protocolbuffers/protobuf/releases/download/v3.15.7/protobuf-all-$(VERSION).zip
	wget https://github.com/protocolbuffers/protobuf/releases/download/v3.15.7/protoc-$(VERSION)-linux-aarch_64.zip

3 checkout:
	#cd protobuf; git checkout -b v$(VERSION)
	unzip protobuf-all-$(VERSION).zip

4 configure:
	cd protobuf-$(VERSION); \
	./autogen.sh; \
	./configure --prefix=/usr/local

5 build:
	cd protobuf-$(VERSION); \
	make -j$(nproc); \
	make check

6 install:
	cd protobuf-$(VERSION); \
	sudo make install; \
	sudo ldconfig


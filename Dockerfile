FROM ubuntu:22.04

RUN apt update && \
              apt install -y qemu-user-binfmt gcc-aarch64-linux-gnu \
              mmdebstrap git binfmt-support make build-essential bison \
              flex make gcc libncurses-dev debian-archive-keyring swig \
              libssl-dev bc python3-setuptools python3-dev libconfuse-dev \
              debhelper fuse2fs rsync kmod cpio debian-keyring fuse ccache pkg-config \
              && apt install -y qemu-user-static

WORKDIR "/src"

RUN git clone --depth 1 --branch v17 https://github.com/pengutronix/genimage.git  && cd genimage && ./autogen.sh && ./configure && make -j4 && make install

COPY entrypoint.sh "entrypoint.sh"

ENTRYPOINT ["./entrypoint.sh"]
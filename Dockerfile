FROM archlinux:latest

RUN mkdir -p /myos/tcbuild
WORKDIR /myos
ENV PATH=/opt/kendryte/bin:${PATH}

# Install Pre-Reqs
RUN pacman -Syu --noconfirm git base make python llvm pkg-config babeltrace diffutils autoconf automake gawk bison flex texinfo patchutils gcc gcc-libs zlib

# Clone and Configure the Toolchain
RUN cd /myos && git clone --recursive https://github.com/kendryte/kendryte-gnu-toolchain
WORKDIR /myos/kendryte-gnu-toolchain
# Make the toolchain
RUN cd /myos/kendryte-gnu-toolchain && ./configure --prefix=/opt/kendryte --with-arch=rv64g --with-abi=lp64d --with-cmodel=medany
RUN cd /myos/kendryte-gnu-toolchain && make -j8
ENV KDRYT=/opt/kendryte

# Install QEMU
RUN cd /myos && git clone https://github.com/qemu/qemu
WORKDIR /myos/qemu
RUN cd /myos/qemu && git checkout v4.1.0
RUN pacman -Syu --noconfirm pixman jemalloc devel
RUN ./configure --prefix=/opt/kendryte --interp-prefix=/opt/kendryte/sysroot --target-list=riscv64-softmmu --enable-jemalloc --disable-werror && make -j8 && make install

# Install Zig and Make
RUN pacman -Syu --noconfirm zig make
RUN mkdir -p /app
RUN cd /app
WORKDIR /app
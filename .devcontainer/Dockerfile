# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
#ARG VARIANT="focal"
FROM ubuntu:focal

LABEL dev.containers.features="common"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
RUN apt-get update \
    && apt-get -y install cmake make gdb-multiarch git sshpass curl \
    && apt-get -y install ubuntu-dev-tools build-essential \
    && apt-get -y install python3 python3-pip autoconf automake autotools-dev libmpc-dev libmpfr-dev libgmp-dev gawk patchutils zlib1g-dev libexpat-dev libtinfo5 libncurses-dev libncurses5 libncurses5-dev libncursesw5-dev device-tree-compiler pkg-config file autogen autoconf-archive bison cvs flex gperf texinfo libtool libssl-dev bc \
    && apt-get -y install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu binutils-aarch64-linux-gnu \
    && apt-get -y install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf binutils-arm-linux-gnueabihf \
    && apt-get -y install gcc-riscv64-linux-gnu g++-riscv64-linux-gnu binutils-riscv64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*
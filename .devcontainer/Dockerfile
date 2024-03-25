# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
#ARG VARIANT="focal"
FROM ubuntu:focal

LABEL dev.containers.features="common"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
RUN apt update \
    && apt -y install g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf rust-gdb sshpass cmake make gdb-multiarch 
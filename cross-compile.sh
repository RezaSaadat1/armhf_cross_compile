#!/bin/bash
SDK_DIR="$1"

. ${SDK_DIR}
make clean; make -j$(nproc)

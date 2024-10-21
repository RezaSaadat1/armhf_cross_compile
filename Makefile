PROJECT_BINARY_NAME = firmware.bin
PROJECT_SOURCES = src/main.cpp

INCLUDES = -Iinclude

LDFLAGS += -Llib

CFLAGS = -Wall -g3 -O0
# CFLAGS += -static-libgcc -static-libstdc++ -static -std=c++11

TARGET_CPP=arm-linux-gnueabihf-g++
TARGET_CC=arm-linux-gnueabihf-gcc 
TARGET_AR=arm-linux-gnueabihf-ar 
TARGET_RANLIB=arm-linux-gnueabihf-ranlib
TARGET_LD=arm-linux-gnueabihf-ld

# TARGET_CPP=aarch64-linux-gnu-g++
# TARGET_CC=aarch64-linux-gnu-gcc 
# TARGET_AR=aarch64-linux-gnu-ar 
# TARGET_RANLIB=aarch64-linux-gnu-ranlib
# TARGET_LD=aarch64-linux-gnu-ld

# TARGET_CPP=riscv64-linux-gnu-g++
# TARGET_CC=riscv64-linux-gnu-gcc
# TARGET_AR=riscv64-linux-gnu-ar
# TARGET_RANLIB=riscv64-linux-gnu-ranlib
# TARGET_LD=riscv64-linux-gnu-ld

# TARGET_CPP=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++
# TARGET_CC=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
# TARGET_AR=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ar
# TARGET_RANLIB=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ranlib
# TARGET_LD=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ld

HOST_CPP=g++
HOST_CC=gcc


CROSS_BINARY_NAME = firmware_$(CROSS_ARCH).bin


all:
	$(TARGET_CPP) $(CFLAGS) -DTARGET $(LDFLAGS) -o $(PROJECT_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

host_compile:
	$(HOST_CPP) $(CFLAGS) -DHOST $(HOST_LDFLAGS) -o program.bin $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

cross_compile:
	$(CPP) $(CFLAGS) -D$(CROSS_ARCH) $(LDFLAGS) -o $(CROSS_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)
	$(CPP) $(CFLAGS) $(LDFLAGS) -o $(CROSS_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

clean:
	rm -f *.bin

clean_all: clean
	rm -f lib/*
	rm -rf include/*
	rm -rf host/lib/*
	rm -rf host/include/*
	rm -rf host/include/*
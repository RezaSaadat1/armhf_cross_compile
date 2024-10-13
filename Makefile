PROJECT_BINARY_NAME = firmware.bin
PROJECT_SOURCES = src/main.cpp

INCLUDES = -Iinclude

LDFLAGS += -Llib

CFLAGS = -Wall -g3 -O0
# CFLAGS += -static-libgcc -static-libstdc++ -static  -std=c++11

CPP=arm-linux-gnueabihf-g++
CC=arm-linux-gnueabihf-gcc 
AR=arm-linux-gnueabihf-ar 
RANLIB=arm-linux-gnueabihf-ranlib
LD=arm-linux-gnueabihf-ld

# CPP=riscv64-linux-gnu-g++
# CC=riscv64-linux-gnu-gcc
# AR=riscv64-linux-gnu-ar
# RANLIB=riscv64-linux-gnu-ranlib
# LD=riscv64-linux-gnu-ld

# CPP=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++
# CC=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
# AR=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ar
# RANLIB=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ranlib
# LD=../gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ld


HOST_CPP=g++
HOST_CC=gcc

all: cross_compile

cross_compile:
	$(CPP) $(CFLAGS) -DARM_TARGET $(LDFLAGS) -o $(PROJECT_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

host_compile:
	$(HOST_CPP) $(CFLAGS) -DHOST_TARGET $(HOST_LDFLAGS) -o program.bin $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

clean:
	rm -f $(PROJECT_BINARY_NAME)
	rm -f program.bin

clean_all: clean
	rm -f lib/*
	rm -rf include/*
	rm -rf host/lib/*
	rm -rf host/include/*
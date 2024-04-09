PROJECT_BINARY_NAME = firmware.bin
PROJECT_SOURCES = src/main.cpp

INCLUDES = -Iinclude

LDFLAGS += -Llib

CFLAGS = -Wall -g3
#CFLAGS += -static-libgcc -static-libstdc++ -static

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

all:
	$(CPP) $(CFLAGS) $(LDFLAGS) -o $(PROJECT_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

clean:
	rm -f $(PROJECT_BINARY_NAME)

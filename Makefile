PROJECT_BINARY_NAME = firmware.bin
PROJECT_SOURCES = src/main.cpp

INCLUDES = -Iinclude

LDFLAGS += -Llib

CFLAGS = -Og -Wall -g
CFLAGS += -static-libgcc -static-libstdc++ -static

CPP=arm-linux-gnueabihf-g++
CC=arm-linux-gnueabihf-gcc 
AR=arm-linux-gnueabihf-ar 
RANLIB=arm-linux-gnueabihf-ranlib
LD=arm-linux-gnueabihf-ld

all:
	$(CPP) $(CFLAGS) $(LDFLAGS) -o $(PROJECT_BINARY_NAME) $(PROJECT_SOURCES) $(INCLUDES) $(LIB_NAME) $(LDLIBS)

clean:
	rm -f $(PROJECT_BINARY_NAME)
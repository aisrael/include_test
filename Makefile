ORIGINAL_SRC=original/src
MODIFIED_SRC=modified/src
INCLUDE=include
BUILD=build
C_INCLUDES=-I $(MODIFIED_SRC)/$(INCLUDE) -I $(ORIGINAL_SRC)/$(INCLUDE) 
LIB=lib
DIST=dist
CC=gcc
CPP=g++
CFLAGS=
CPPFLAGS=

all: main

dirs:
	mkdir -p $(BUILD)
	mkdir -p $(LIB)
	mkdir -p $(DIST)

$(BUILD)/means.o:
	$(CC) $(CFLAGS) $(C_INCLUDES) -c -fpic -fPIC $(ORIGINAL_SRC)/libtest/means.c -o $(BUILD)/means.o
	
$(BUILD)/libtest.o:
	$(CC) $(CFLAGS) $(C_INCLUDES) -c -fpic -fPIC $(MODIFIED_SRC)/libtest/libtest.c -o $(BUILD)/libtest.o

libtest: dirs $(BUILD)/means.o $(BUILD)/libtest.o	
	$(CC) $(CFLAGS) -shared $(BUILD)/means.o $(BUILD)/libtest.o -o $(LIB)/libtest.so 

main: dirs libtest
	$(CC) $(CPPFLAGS) $(C_INCLUDES) -L $(LIB) $(ORIGINAL_SRC)/main.c -ltest -o $(DIST)/main

clean:
	rm -rf $(DIST)
	rm -rf $(BUILD)
	rm -rf $(LIB)

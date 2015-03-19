ORIGINAL_SRC=original/src
MODIFIED_SRC=modified/src
LIBTEST=libtest
INCLUDE=include
BUILD=build
C_INCLUDES=-I $(MODIFIED_SRC)/$(INCLUDE) -I $(ORIGINAL_SRC)/$(INCLUDE) -I $(MODIFIED_SRC)/$(LIBTEST) -I $(MODIFIED_SRC)/$(LIBTEST)
LIB=lib
DIST=dist
CC=gcc
CPP=g++
CFLAGS=
CPPFLAGS=

all: ./$(DIST)/main.exe

dirs:
	mkdir -p $(BUILD)
	mkdir -p $(LIB)
	mkdir -p $(DIST)

$(BUILD)/%.o:$(MODIFIED_SRC)/libtest/%.c
	$(CC) $(CFLAGS) $(C_INCLUDES) -c -fpic -fPIC $^ -o $@

$(BUILD)/%.o:$(ORIGINAL_SRC)/libtest/%.c
	$(CC) $(CFLAGS) $(C_INCLUDES) -c -fpic -fPIC $^ -o $@
	
./$(DIST)/libtest.dll: dirs $(BUILD)/means.o $(BUILD)/libtest.o	$(BUILD)/testf.o
	$(CC) $(CFLAGS) -shared $(BUILD)/means.o $(BUILD)/libtest.o $(BUILD)/testf.o -o $(DIST)/libtest.dll -H



./$(DIST)/main.exe: dirs ./$(DIST)/libtest.dll
	$(CC) $(CPPFLAGS) $(C_INCLUDES) $(ORIGINAL_SRC)/main.c  -o $(DIST)/main.exe -L./$(DIST) -ltest -H

clean:
	rm -rf $(DIST)
	rm -rf $(BUILD)
	rm -rf $(LIB)

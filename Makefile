NAME := threebox
CC := cc
CFLAGS :=\
	-fPIC\
	-g\
	-std=c99\
	-Wall\
	-Wextra\
	-Wpedantic
OUT_DIR := dist
QUICKJS_FLAGS := CONFIG_CLANG=true #CONFIG_LTO=true

SO := .so

ifeq ($(OS), Windows_NT)
	SO = .dll
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S), Darwin)
		SO = .dylib
	endif
endif

all: out_dir native js

out_dir:
	mkdir -p $(OUT_DIR)

quickjs:
	cd third_party/quickjs && $(MAKE) $(QUICKJS_FLAGS) qjs
	cd third_party/quickjs && $(MAKE) $(QUICKJS_FLAGS) libquickjs.a
	@cp third_party/quickjs/qjs.exe dist || cp third_party/quickjs/qjs dist

quickjs-ffi:
	$(CC) $(CFLAGS) -shared -fPIC -Wl,--out-implib,libquickjs-ffi.a -Ithird_party -lpthread -ldl -lffi -Lthird_party/quickjs -lquickjs -o $(OUT_DIR)/libquickjs-ffi$(SO) third_party/quickjs-ffi/quickjs-ffi.c

native: quickjs quickjs-ffi

js:
	cp third_party/quickjs-ffi/quickjs-ffi.js $(OUT_DIR)

clean:
	cd third_party/quickjs && $(MAKE) clean
	rm $(OUT_DIR)/*

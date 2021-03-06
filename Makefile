CC := afl-clang
CFLAGS := -D_FORTIFY_SOURCE=0
LDFLAGS :=
BIN_DIR := bin

hello-vulnerable-world: src/hello-vulnerable-world.o
	$(CC) -o $(BIN_DIR)/hello-vulnerable-world src/hello-vulnerable-world.o $(LDFLAGS)

hello-integer-world: src/hello-integer-world.o
	$(CC) -o $(BIN_DIR)/hello-integer-world src/hello-integer-world.o $(LDFLAGS)

all: hello-vulnerable-world hello-integer-world

.PHONY: clean
clean:
	-rm -rf src/*.o
	-find $(BIN_DIR)/ -type f -not -name 'EMPTY' -print0 | xargs -0 rm --

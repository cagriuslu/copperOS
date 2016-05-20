SRC="src"
OBJ="obj"
LIB="lib"

# Clean
rm -rf $LIB/*
rm -rf $OBJ/*

# Create directories
mkdir -p $LIB
mkdir -p $OBJ

# Build
CC="i386-elf-gcc"
CC_INC_DIRS="-Iinclude"
C_FLAGS="-ffreestanding -O2 -Wall -Wextra $CC_INC_DIRS"
$CC $C_FLAGS -c $SRC/tterm.c -o $OBJ/tterm.c.o

# Archive
AR="i386-elf-ar"
$AR rs -o $LIB/libt.a $OBJ/tterm.c.o

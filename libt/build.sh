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
AS="nasm"
ASM_FLAGS="-felf32"
$AS $ASM_FLAGS $SRC/tstring.asm -o $OBJ/tstring.asm.o
$AS $ASM_FLAGS $SRC/tgdt.asm -o $OBJ/tgdt.asm.o
$AS $ASM_FLAGS $SRC/tstack.asm -o $OBJ/tstack.asm.o

CC="i386-elf-gcc"
CC_INC_DIRS="-Iinclude"
C_FLAGS="-ffreestanding -O2 -Wall -Wextra $CC_INC_DIRS"
$CC $C_FLAGS -c $SRC/tterm.c -o $OBJ/tterm.c.o

# Archive
AR="i386-elf-ar"
$AR rs -o $LIB/libt.a $OBJ/tstring.asm.o $OBJ/tgdt.asm.o $OBJ/tstack.asm.o $OBJ/tterm.c.o

SRC="src"
OBJ="obj"
LIB="lib"

# Clean
rm -rf $LIB
rm -rf $OBJ

# Create Directories
mkdir -p $LIB

mkdir -p $OBJ
mkdir -p $OBJ/string

# Build
CC="i386-elf-gcc"
C_FLAGS="-ffreestanding -O2 -Wall -Wextra -Iinclude"
$CC $C_FLAGS -c $SRC/string/memcpy.c -o $OBJ/string/memcpy.o

# Archive
AR="i386-elf-ar"
$AR rs -o $LIB/libc.a $OBJ/string/memcpy.o

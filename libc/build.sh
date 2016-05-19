SRC="src"
OBJ="obj"
LIB="lib"

CC="i386-elf-gcc"

C_FLAGS="-ffreestanding -O2 -Wall -Wextra -Iinclude"
$CC $C_FLAGS -c $SRC/string/memcpy.c -o $OBJ/string/memcpy.o

AR="i386-elf-ar"
$AR -cvq -o $LIB/libc.a $OBJ/string/memcpy.o

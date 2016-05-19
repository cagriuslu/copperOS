# Build dependencies
cd libc
./build.sh
cd ..

cd libgrey
./build.sh
cd ..

AS="nasm"
AS_FLAGS="-felf32"
$AS $AS_FLAGS boot.asm -o boot.o

CC="i386-elf-gcc"
CC_INC_DIRS="-Ilibc/include -Ilibgrey/include"
C_FLAGS="-ffreestanding -O2 -Wall -Wextra $CC_INC_DIRS"
$CC $C_FLAGS -c kernel.c -o kernel.o

LD="i386-elf-gcc"
LD_LIB_DIRS="-Llibc/lib -Llibgrey/lib"
LD_FLAGS="-T linker.ld -ffreestanding -O2 -nostdlib $LD_LIB_DIRS"
LD_LIBS="-lgcc -lc -lgrey"
OBJS="boot.o kernel.o"
$LD $LD_FLAGS -o grey.bin $OBJS $LD_LIBS


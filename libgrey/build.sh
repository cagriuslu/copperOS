SRC="src"
OBJ="obj"
LIB="lib"

# Clean
rm -rf $LIB
rm -rf $OBJ

# Create directories
mkdir -p $LIB

mkdir -p $OBJ
mkdir -p $OBJ/grstring
mkdir -p $OBJ/grgdt
mkdir -p $OBJ/grstack

# Build
AS="nasm"
ASM_FLAGS="-felf32"
$AS $ASM_FLAGS $SRC/grstring/memcpy.asm -o $OBJ/grstring/memcpy.o
$AS $ASM_FLAGS $SRC/grgdt/SetupFlatGdt.asm -o $OBJ/grgdt/SetupFlatGdt.o
$AS $ASM_FLAGS $SRC/grstack/SetStack.asm -o $OBJ/grstack/SetStack.o

# Archive
AR="i386-elf-ar"
$AR rs -o $LIB/libgrey.a $OBJ/grstring/memcpy.o $OBJ/grgdt/SetupFlatGdt.o $OBJ/grstack/SetStack.o

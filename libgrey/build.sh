SRC="src"
OBJ="obj"
LIB="lib"

AS="nasm"

ASM_FLAGS="-felf32"
$AS $ASM_FLAGS $SRC/gr_string/gr_memcpy.asm -o $OBJ/gr_string/gr_memcpy.o
$AS $ASM_FLAGS $SRC/Gdt/SetupFlatGdt.asm -o $OBJ/Gdt/SetupFlatGdt.o

AR="i386-elf-ar"
$AR -cvq -o $LIB/libgrey.a $OBJ/gr_string/gr_memcpy.o $OBJ/Gdt/SetupFlatGdt.o

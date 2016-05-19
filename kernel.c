#include <Gdt.h>

void StartKernel()
{
	SetupFlatGdt((void*) 2000000);
	char *vgaBuffer = (char*) 0xb8000;
	*vgaBuffer = 'X';
}

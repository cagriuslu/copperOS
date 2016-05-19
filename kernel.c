#include <grgdt.h>
#include <grstack.h>

void StartKernel()
{
//	SetStack_asm((void*) 0x100000);
//	asm("mov $0xFFFFFFFF, %esp");
	SetupFlatGdt_asm((void*) 0x100000);
	asm("mov $0x10000, %esp");
	char *vgaBuffer = (char*) 0xb8000;
	*vgaBuffer = 'X';
}

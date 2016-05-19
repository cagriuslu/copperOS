#include <tgdt.h>
#include <tstack.h>
#include <tterm.h>

void StartKernel()
{

	SetupFlatGdt_asm((void*) 0x100000);
	
	tClearTerm();
	tPrintChar('A');
	tPrintChar('A');
	tPrintChar('A');
	
//	char *vgaBuffer = (char*) 0xb8000;
//	*vgaBuffer = 'X';
}

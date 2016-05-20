#include <tterm.h>

void StartKernel()
{
	tClearTerm();
	tPrintStr("\nThis is tOS.\n");
	//tPrintStr("Your magic number is ");
	//tPrintDword(0x38574910);
	//tPrintStr(".\n");
}

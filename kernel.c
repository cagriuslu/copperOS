#include <kernel.h>
#include <tterm.h>

void StartKernel()
{
	tClearTerm();
	tPrintStr("This is tOS.\n");
	
	tsh_main();
}

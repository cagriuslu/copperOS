#include <kernel.h>
#include <tterm.h>

void StartKernel()
{
	tClearTerm();
	
	if (CurrentProcess == 0)
	{
		CurrentProcess = 1;
		tsh_main();
	}
}

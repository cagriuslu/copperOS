#include <kernel.h>
#include <tterm.h>

void tsh_main()
{
	tClearTerm();
	tPrintStr("Welcome to tsh!\n");
	tPrintChar('$');
}

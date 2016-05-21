/* entry point of the kernel is _start */
ENTRY(_start)

SECTIONS
{
	/* put the kernel wide global variables here */
	. = 0x180800;
	.globals : { *(.globals) }
	
	/* put the kernel's stack above this point */
	
	. = 2M;
	
	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}
	
	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}
	
	.data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}
	
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}
}


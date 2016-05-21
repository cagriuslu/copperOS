; these are variables that can be accessed by the kernel, their locations on the memory is fixed

section .globals

global KernelName
KernelName:
	db	"tOS", 0

global KernelVersion	
KernelVersion:
	dd	1

global CurrentProcess
CurrentProcess:
	dd	0


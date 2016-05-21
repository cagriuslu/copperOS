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





;times memsize-$-KernelName db 0

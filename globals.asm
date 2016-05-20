
section .globals
KernelName:
	db	"tOS", 0
KernelVersion:
	dd	1
	
	
;times memsize-$-KernelName db 0

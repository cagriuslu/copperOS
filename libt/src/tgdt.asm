[BITS 32]

GDT_START:
GDT_NULL:
	dd 0
	dd 0

GDT_CODE:
	dw 0xffff
	dw 0
	db 0
	db 10011010b
	db 11001111b
	db 0

GDT_DATA:
	dw 0xffff
	dw 0
	db 0
	db 10010010b
	db 11001111b
	db 0
GDT_END:

GDT_DESCRIPTOR:
	dw GDT_END - GDT_START - 1
GDT_START_ADDRESS:
	dd 0		; start address of GDT
GDT_DESCRIPTOR_END:

CODE_SEG equ 8
DATA_SEG equ 16

; new location of the GDT is in ecx
global SetupFlatGdt_asm
SetupFlatGdt_asm:
	cli
	
	push ecx
	
	mov eax, ecx
	mov ebx, GDT_START
	mov ecx, GDT_DESCRIPTOR_END - GDT_START
	extern memcpy_asm
	call memcpy_asm
	
	pop ecx
	mov eax, ecx
	add eax, GDT_START_ADDRESS - GDT_START
	mov [eax], ecx
	
	add ecx, GDT_DESCRIPTOR - GDT_START
	lgdt [ecx]

	jmp CODE_SEG:.continue
.continue:
	mov eax, DATA_SEG
	mov ds, eax
	mov ss, eax
	mov es, eax
	mov fs, eax
	mov gs, eax
	
;	sti
	ret

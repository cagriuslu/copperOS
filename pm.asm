[BITS 16]

pm:
	cli
	lgdt [.gdt_descriptor]

	mov eax, cr0
	or eax, 0x01
	mov cr0, eax

	jmp .CODE_SEG:.pm_code

[BITS 32]

.pm_code:
	mov ax, .DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	jmp main

.gdt_start:
.gdt_null:
db 0,0,0,0,0,0,0,0
.gdt_code:
dw 0xffff	; limit[0:15]
dw 0x0		; base[0:15]
db 0x0		; base[16:23]
db 10011010b	; present=1 privilage=00 descritor_type=1 type: code=1 conforming=0 readable=1 accessed=0
db 11001111b	; granularity=1 32bit_default=1 64bit_segment=0 AVL=0 limit[16:19]
db 0x0		; base[24:31]
.gdt_data:
dw 0xffff	; limit[0:15]
dw 0x0		; base[0:15]
db 0x0		; base[16:23]
db 10010010b	; present=1 privilage=00 descritor_type=1 type: code=0 expand_down=0 writable=1 accessed=0
db 11001111b	; granularity=1 32bit_default=1 64bit_segment=0 AVL=0 limit[16:19]
db 0x0		; base[24:31]
.gdt_end:

.gdt_descriptor :
dw .gdt_end - .gdt_start - 1	; always less 1 of the true size
dd .gdt_start			; start address of GDT

; used for CS=CODE_SEG and DS=DATA_SEG (offsets from GDT_START)
.CODE_SEG equ .gdt_code - .gdt_start
.DATA_SEG equ .gdt_data - .gdt_start


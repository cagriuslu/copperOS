MBALIGN		equ 1<<0
MEMINFO		equ 1<<1
FLAGS		equ MBALIGN | MEMINFO
MAGIC		equ 0x1BADB002
CHECKSUM	equ -(MAGIC + FLAGS)

section .multiboot
align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM

section .bootstrapStack, nobits
align 4
stackTop:
	resb 16384
stackBottom:

section .text
global _start
_start:
	mov ebp, stackBottom
	mov esp, stackBottom
	
	; disable VGA cursor
	mov al, 0x0a
	mov dx, 0x3d4
	out dx, al
	
	mov al, 0x20
	inc dx
	out dx, al
	
	extern tPrintDword
	extern tPrintWord
	extern tPrintChar
	sgdt [.temp]
	mov cx, [.temp]
	call tPrintWord
	mov cx, 10
	call tPrintChar
	mov ecx, [.temp+2]
	call tPrintDword
	
	extern	StartKernel
	call	StartKernel
	
	cli
	hlt
	jmp $

.temp:
	dq 0
	dq 0
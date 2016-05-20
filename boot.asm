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

section .text
global _start
_start:
	cli
	
	; set kernel stack
	mov ebp, 0x200000
	mov esp, 0x200000
	
	; setup flat gdt
	mov ecx, 0x100000
	extern asmFlatGdt
	call asmFlatGdt
	
	; disable VGA cursor
	mov al, 0x0a
	mov dx, 0x3d4
	out dx, al
	
	mov al, 0x20
	inc dx
	out dx, al
	
	extern StartKernel
	call StartKernel
	
	cli
	hlt
	jmp $

[org 0x7c00]
[BITS 16]
	
	; save boot drive
	mov [BOOT_DRIVE], dl

	; init stack
	mov bp, 0x8000
	mov sp, bp
	
	jmp pm
	
BOOT_DRIVE: db 0

%include "pm.asm"

[BITS 32]
main:
	mov byte [0xb8000], 'X'
	jmp $

times 510-($-$$) db 0 
db 0x55,0xaa

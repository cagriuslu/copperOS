; bios_print_str
; prints the string pointed by si to the screen using BIOS interrupt routines
; returns the number of characters printed with ax
; modifies si, ax
bios_print_str:
	mov ah, 0x0E
	mov word [.length], 0x0000
	
.next:
	lodsb
	cmp al, 0
	je .end
	
	inc word [.length]
	int 0x10
	jmp .next
	
.end:
	mov ax, [.length]
	ret
.length:
dw 0x0000
; prints the hex value is AL
bios_print_hexb:
	push ax
	push bx
	push cx
	
	mov cl, al
	mov ah, 0x0E
	
	mov bl, cl
	and bx, 0x00F0
	shr bx, 4
	mov al, [.table+bx]
	int 0x10
	
	mov bl, cl
	and bx, 0x000F
	mov al, [.table+bx]
	int 0x10
	
	pop cx
	pop bx
	pop ax
	
	ret
	
.table:
db "0123456789ABCDEF"

; prints the hex value in AX
bios_print_hexw:
	push ax
	
	shr ax, 8
	call bios_print_hexb
	
	pop ax
	call bios_print_hexb
	
	ret
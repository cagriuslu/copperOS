; bios_print_char
; if AL == 0
;	return
; else
;	print the character in AL to screen using BIOS interrupt routine
;	modifies AH
;	return
bios_print_char:
	cmp al, 0
	je .end
	mov ah, 0x0E
	int 0x10
.end:
	ret
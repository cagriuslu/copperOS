bios_drive_load:
	mov ah, 0x02
	int 0x13
	jc .error
	
.noerror:
	mov ah, 0x00
	ret
	
.error:
	mov ah, 0xFF
	ret

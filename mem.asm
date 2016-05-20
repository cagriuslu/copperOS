[BITS 32]

; dest : eax
; src  : ebx
; n    : ecx
global asmMemCopy
asmMemCopy:
	cmp ecx, 0
	je .return
.loop:
	mov dl, [ebx]
	mov [eax], dl
	inc eax
	inc ebx
	dec ecx
	jne .loop	
.return:
	ret

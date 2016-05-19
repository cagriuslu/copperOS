[BITS 32]

; new stack position is in ecx
; use only for NEAR call
global SetStack_asm
SetStack_asm:
	pop eax
	
	mov esp, ecx

	push eax
	ret

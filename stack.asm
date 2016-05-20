[BITS 32]

; new stack position is in ecx
; use only for NEAR call
; because FAR call pushes CS to the stack also
; which is not good
global asmSetStack
asmSetStack:
	
	; pop the return address from stack
	pop eax
	
	; set new stack
	mov esp, ecx
	
	; push the return address to stack
	push eax
	ret

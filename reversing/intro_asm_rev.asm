;------------------------------------------------------------------------------------------------
;Problema/CTF: assembly-0
;Pontos: 150 pontos
;Resolução de: Joeru AKA:Joerito
;------------------------------------------------------------------------------------------------
;What does asm0(0xd8,0x7a) return?
;Submit the flag as a hexadecimal value (starting with '0x').
;NOTE: Your submission for this question will NOT be in the normal flag format.
;------------------------------------------------------------------------------------------------
;asm0(0xd8,0x7a)
;------------------------------------------------------------------------------------------------
.intel_syntax noprefix
.bits 32
	
.global asm0

asm0:
	push	ebp					;prólogo
	mov	ebp,esp					;prólogo
	mov	eax,DWORD PTR [ebp+0x8]	;Atribui o valor do register [ebp+0x8] ao register eax		eax=0xD8
	mov	ebx,DWORD PTR [ebp+0xc]	;Atribui o valor do register [ebp+0xc] ao register ebx		ebx=0x7A 
	mov	eax,ebx					;Atribui o valor do register ebx ao register eax			eax=ebx | eax==0x7A
	mov	esp,ebp					;epílogo
	pop	ebp						;epílogo
	ret							;ret 0x7A

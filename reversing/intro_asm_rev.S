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
	push	ebp					;|0| prólogo
	mov	ebp,esp					;|1| prólogo
	mov	eax,DWORD PTR [ebp+0x8]	;|2| Atribui o valor do register [ebp+0x8] ao register eax		;debug: eax=0xD8
	mov	ebx,DWORD PTR [ebp+0xc]	;|3| Atribui o valor do register [ebp+0xc] ao register ebx		;debug: ebx=0x7A 
	mov	eax,ebx					;|4| Atribui o valor do register ebx ao register eax			;debug: eax=ebx | eax==0x7A
	mov	esp,ebp					;|5| epílogo
	pop	ebp						;|6| epílogo
	ret							;|7| ret 0x7A

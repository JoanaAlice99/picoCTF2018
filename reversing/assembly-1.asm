;------------------------------------------------------------------------------------------------
;Problema/CTF: assembly-1
;Pontos: 200 pontos
;Resolução de: Joeru AKA:Joerito
;------------------------------------------------------------------------------------------------
;What does asm1(0xcd) return?
;Submit the flag as a hexadecimal value (starting with '0x').
;NOTE: Your submission for this question will NOT be in the normal flag format. 
;------------------------------------------------------------------------------------------------
;asm1(0xcd)
;------------------------------------------------------------------------------------------------
.intel_syntax noprefix
.bits 32
	
.global asm1

asm1:
	push	ebp				;prólogo
	mov	ebp,esp				;prólogo
	cmp	DWORD PTR [ebp+0x8],0xde	;Compara o valor do register [ebp+0x8] com 0xDE		 CMP 0xCD, 0xDE == CMP dec(205), dec(222)
	jg 	part_a				;Se o valor for maior que 0xDE salta para part_a	 jg=False
	cmp	DWORD PTR [ebp+0x8],0x8		;Compara o valor do register [ebp+0x8] com 0x8		 CMP 0xCD, 0x8 == CMP dec(205), dec(8)
	jne	part_b				;Se o valor não for igual salta para part_b		 jne=True
	mov	eax,DWORD PTR [ebp+0x8]
	add	eax,0x3
	jmp	part_d
part_a:
	cmp	DWORD PTR [ebp+0x8],0x4e
	jne	part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_b:
	mov	eax,DWORD PTR [ebp+0x8]		;Atribui o valor do register [ebp+0x8] ao register eax		eax=[ebp+0x8] | eax==0xCD
	sub	eax,0x3				;Subtrai 0x3 ao register eax					eax-=0x3      | eax==0xCA
	jmp	part_d				;Salta para part_d						jmp=True
	cmp	DWORD PTR [ebp+0x8],0xee
	jne	part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_c:
	mov	eax,DWORD PTR [ebp+0x8]
	add	eax,0x3
part_d:
	pop	ebp				;epílogo
	ret					;ret 0xCA

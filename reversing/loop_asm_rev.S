;------------------------------------------------------------------------------------------------
;Problema: assembly-2
;Pontos: 250 pontos
;Resolução de: Joeru AKA:Joerito
;------------------------------------------------------------------------------------------------
;What does asm2(0x6,0x28) return? 
;Submit the flag as a hexadecimal value (starting with '0x'). 
;NOTE: Your submission for this question will NOT be in the normal flag format.
;------------------------------------------------------------------------------------------------
;asm2(0x6,0x28)
;------------------------------------------------------------------------------------------------
.intel_syntax noprefix
.bits 32
	
.global asm2

asm2:
	push   	ebp								;prólogo
	mov    	ebp,esp							;prólogo
	sub    	esp,0x10						;prólogo
	mov    	eax,DWORD PTR [ebp+0xc]			;Atribui o valor do register [ebp+0xc] ao register eax		;debug: eax=[ebp+0xc] | eax==0x28
	mov 	DWORD PTR [ebp-0x4],eax			;Atribui o valor do register eax ao register [ebp-0x4]		;debug: [ebp-0x4]=eax | [ebp-0x4]==0x28
	mov    	eax,DWORD PTR [ebp+0x8]			;Atribui o valor do register [ebp+0x8] ao register eax		;debug: eax=[ebp+0x8] | eax==0x6
	mov		DWORD PTR [ebp-0x8],eax			;Atribui o valor do register eax ao register [ebp-0x8]		;debug: [ebp-0x8]=eax | [ebp-0x8]==0x6
	jmp    	part_b							;Salta para part_b											;debug: jmp=True
part_a:	
	;Vai adicionando +0x1 ao register [ebp-0x4] e +0x8F ao register [ebp+0x8]
	add    	DWORD PTR [ebp-0x4],0x1			;Adiciona 0x1 ao register [ebp-0x4]			;debug: [ebp-0x4]=0x28+0x1
	add		DWORD PTR [ebp+0x8],0x8f		;Adiciona 0x8F ao register [ebp+0x8]		;debug: [ebp+0x8]=0x6+0x8F
part_b:	
	;Vai comparar [ebp+0x8] até o jle=False que é quando for maior que 0x8F90, nesse instante jle=False e depois da skip para a próxima linha
	cmp    	DWORD PTR [ebp+0x8],0x8f90		;Compara o valor do register [ebp+0x8] com valor 0x8F90		;debug: CMP 0x6, 0x8F90 == CMP dec(6), dec(36752)
	jle    	part_a							;Se for menor ou igual salta para part_a					;debug: jle=True
	
	;Obviamente não vou fazar o loop "manualmente" xd rip
	;fiz um script em py para fazer-lo por mim
	;------------------------------------------------------------------------------------------------
	;i=0
	;ebp_menos_0x4=0x28
	;ebp_mais_0x8=0x6
	;	while True:
    ;		if ebp_mais_0x8<=0x8f90:
    ;			ebp_menos_0x4+=0x1
    ;    		ebp_mais_0x8+=0x8f
    ;    		i+=1
    ;		else:
    ;    		print("Após: "+str(i)+" Iterações xd\n[ebp+0x8]="+hex(ebp_mais_0x8),"\n[ebp-0x4]="+hex(ebp_menos_0x4))
    ;    		break
	;------------------------------------------------------------------------------------------------
	;OUTPUT: Após: 257 Iterações xd
	;		 [ebp+0x8]=0x8f95
	;		 [ebp-0x4]=0x129
	;------------------------------------------------------------------------------------------------
	
	;Agora assumindo que [ebp+0x8] já é maior que 0x8F90 e jle=False
	mov    	eax,DWORD PTR [ebp-0x4]			;Atribui o valor do register [ebp-0x4] ao register eax		;debug: eax=0x129
	mov	esp,ebp								;epílogo
	pop	ebp									;epílogo
	ret										;ret 0x129

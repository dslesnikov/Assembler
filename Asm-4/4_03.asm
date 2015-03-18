.486

.MODEL Flat, StdCall

.DATA
	num dd -67863
	len dd ?
	ten dd 10
	two dd 2
	result db 100 dup (0)
	rems db 100 dup (0)

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset result
	mov edi, offset rems
	mov eax, num
	mov ebx, 0
	
	;To check the sign of number and negate it if needed
	cdq
	idiv two
	mov eax, num
	cmp edx, 2
	jb digits_calc
	neg eax

digits_calc:
	cdq
	idiv ten
	mov [edi + type rems * ebx], dl
	inc ebx
	cmp eax, 0
	jne digits_calc

	mov len, ebx
	mov ecx, ebx
	dec ebx
	mov edx, 0
reverse:
	mov al, [edi + type rems * edx]
	mov [esi + type result * ebx], al
	dec ebx
	inc edx
	loop reverse
	call exit

end main

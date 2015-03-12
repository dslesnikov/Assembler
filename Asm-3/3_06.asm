.486

.MODEL Flat, StdCall

.DATA
	len equ 6
	arr dd 3, 57, 9, -73, 2, -1
	res_arr dd len dup (0)
	k dd 3
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov edi, offset res_arr
	mov ecx, len
	mov edx, 0
	mov ebx, k

copy_mults:
	mov eax, [esi + type arr * edx]
	push edx
	cdq
	idiv ebx
	cmp edx, 0
	je multiples
	pop edx
	inc edx
	loop copy_mults
	call exit

multiples:
	pop edx
	mov eax, [esi + type arr * edx]
	mov [edi + type arr * edx], eax
	inc edx
	loop copy_mults
	call exit

end main

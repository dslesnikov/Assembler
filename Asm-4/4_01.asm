.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	vec1 dd 3, 57, -73, 2, -1
	vec2 dd 15, 32, 1, 78, 4
	sum dd len dup (0)
	product dd ?
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset vec1
	mov edi, offset vec2
	mov ecx, len
	mov edx, 0

sum_calc:
	mov eax, [esi + type vec1 * edx]
	mov ebx, [edi + type vec2 * edx]
	inc edx
	add eax, ebx
	push eax
	loop sum_calc

	mov ecx, len
	mov edx, len
	mov esi, offset sum

sum_write:
	dec edx
	pop [esi + type sum * edx]
	loop sum_write

	mov esi, offset vec1
	mov edi, offset vec2
	mov ecx, len
	mov edx, 0

	push dword ptr 0
prod_calc:
	mov eax, [esi + type vec1 * edx]
	mov ebx, [edi + type vec2 * edx]
	inc edx
	push edx
	imul ebx
	pop edx
	pop ebx
	add ebx, eax
	push ebx
	loop prod_calc
	
	mov product, eax
	call exit

end main

.486

.MODEL Flat, StdCall

.DATA
	a DD 19

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, 2
	cdq
	div ebx
	cmp edx, 0
	je is_even
	mov eax, a
	mov ebx, 3
	mul ebx
	inc eax
	mov a, eax
	call exit

is_even:
	mov a, eax
	call exit

end main

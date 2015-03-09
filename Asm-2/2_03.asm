.486

.MODEL Flat, StdCall

.DATA
	a DD 18
	b DD 19
	cc DD 23
	d DD 31

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, b
	mul ebx
	mov ebx, eax
	mov eax, cc
	mov ecx, d
	cdq
	idiv ecx
	sub ebx, edx
	call exit
end main

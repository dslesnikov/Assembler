.486

.MODEL Flat, StdCall

.DATA
	a DD 18
	b DD 7
	d DD 89
	e DD 43

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, b
	mul ebx
	mov ebx, d
	sub eax, ebx
	mov e, eax
	call exit
end main

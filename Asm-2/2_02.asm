.486

.MODEL Flat, StdCall

.DATA
	a1 DD -3
	b1 DD 5
	a2 DD -3
	b2 DD -5
	a3 DD 3
	b3 DD -5
	res DD ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a3
	mov ebx, b3
	cdq
	idiv ebx
	call exit
end main

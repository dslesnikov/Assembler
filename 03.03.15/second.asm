.486

.MODEL Flat, StdCall

.DATA
	a1 DD -1
	b1 DD 1
	a2 DD -1
	b2 DD -1
	a3 DD -1
	b3 DD -1
	res DD ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a1
	mov ebx, b1
	cdq
	idiv ebx
	call exit

end main

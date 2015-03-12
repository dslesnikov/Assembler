.486

.MODEL Flat, StdCall

.DATA
	n db 2
	f dd ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov ecx, 0
	mov cl, n
	mov eax, 1
	cmp ecx, 1
	ja fact
	mov f, 1
	call exit

fact:
	mul ecx
	loop fact
	mov f, eax
	call exit

end main

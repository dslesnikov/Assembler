.486

.MODEL Flat, StdCall

.DATA
	a DD -18
	two DD 2
	three DD 3

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, three
	cdq
	idiv ebx
	mov cl, dl
	mov eax, a
	mov ebx, two
	cdq
	idiv ebx
	mov ah, dl
	mov al, cl
	call exit
end main

.486

.MODEL Flat, StdCall

.DATA
	a DD 2048
	n DB 4

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov cl, n
	sar eax, cl
	call exit
end main

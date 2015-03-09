.486

.MODEL Flat, StdCall

.DATA
	a DW 9

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, 00h
	mov ax, a
	and ax, 1h
	not ax
	add ax, 2h
	call exit
end main

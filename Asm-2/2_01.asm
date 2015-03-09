.486

.MODEL Flat, StdCall

.DATA
	x DB 2
	y DW 7
	z DD 19

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov al, x
	not al
	add al, 1h
	mov x, al
	call exit
end main

.486

.MODEL Flat, StdCall

.DATA
	len 		equ 5
	not_pal		dw	3, 18, 7, 9, 15
	palind		dw	3, 15, 7, 15, 3

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset not_pal
	mov ecx, len
	call exit


end main

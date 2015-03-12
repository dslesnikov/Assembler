.486

.MODEL Flat, StdCall

.DATA
	year dw 2010
	year1 dw 2008
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov ax, year
	mov bx, 400
	cdq
	div bx
	cmp dx, 0
	je is_leap
	mov ax, year
	mov bx, 100
	cdq
	div bx
	cmp dx, 0
	je not_leap
	mov ax, year
	mov bx, 4
	cdq
	div bx
	cmp dx, 0
	je is_leap
	jmp not_leap

is_leap:
	mov ax, 1
	call exit
not_leap:
	mov ax, 0
	call exit

end main

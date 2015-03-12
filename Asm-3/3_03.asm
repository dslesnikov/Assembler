.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	arr dw 3, 5, 7, 2, 1
	sum dw ?
	prod dw ?
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov ecx, len
	mov edx, 0
	mov bx, 0

sum_calc:
	mov ax, [esi + type arr*edx]
	inc edx
	add bx, ax
	loop sum_calc
	mov sum, bx

	mov edx, 0
	mov ax, 1
	mov ecx, len

prod_calc:
	mov bx, [esi + type arr*edx]
	inc edx
	push edx
	mul bx
	pop edx
	loop prod_calc
	mov prod, ax

	call exit

end main

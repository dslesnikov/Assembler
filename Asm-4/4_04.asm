.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	arr dw 14, 15, 78, 32, 2
	res dw len dup (0)
	ten dw 10

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov edi, offset res
	mov ecx, len
	mov edx, 0

run_through:
	mov ax, [esi + type arr * edx]
	push edx
	push word ptr 1
calc_mult:
	and dx, 0
	div ten
	mov bx, ax
	pop ax
	mul dx
	push ax
	mov ax, bx
	cmp bx, 0
	jne calc_mult

	pop ax
	pop edx
	mov [edi + type res * edx], ax
	inc edx
	loop run_through
	call exit

end main

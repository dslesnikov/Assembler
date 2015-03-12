.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	arr dw 3, 57, -73, 2, -1
	res_arr db len dup (0)
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov edi, offset res_arr
	mov ecx, len
	mov ebx, 0

arr_copy:
	mov ax, [esi + type arr * ebx]
	push ebx
	mov bx, 10
	cwd
	idiv bx
	cmp dx, 10
	ja negative
	jmp continue

negative:
	neg dx

continue:
	pop ebx
	mov [edi + type arr * ebx], dx
	inc ebx
	loop arr_copy
	call exit

end main

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
	mov edx, 0

copy_to_stack:
	mov ax, [esi + type arr * edx]
	push ax
	inc edx
	loop copy_to_stack

	mov ecx, len
	mov edx, 0
pop_from_stack:
	pop ax
	mov [edi + type arr * edx], ax
	inc edx
	loop pop_from_stack
	call exit

end main

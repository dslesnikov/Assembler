.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	arr db 3, 57, -73, 2, -1
	res_arr db len dup (0)
	

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov edi, offset res_arr
	mov ecx, len
	mov edx, 0
	loop copy

copy:
	mov al, [esi + type arr * edx]
	mov [edi + type arr * ecx], al
	inc edx
	loop copy
	mov al, [esi + type arr * edx]
	mov [edi + type arr * ecx], al
	call exit

end main

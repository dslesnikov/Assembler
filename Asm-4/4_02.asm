.486

.MODEL Flat, StdCall

.DATA
	len equ 5
	arr dd 37, 57, 7333, 2123, 100
	res dd 0FFFFFFFFH
	thr1 dd 8000
	thr2 dd 60
	ind dd ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset arr
	mov ebx, thr1
	mov ecx, len
	mov edx, 0

compare_arr:
	mov eax, [esi + type arr * edx]
	cmp ebx, eax
	jb found_bigger
	inc edx
	loop compare_arr
	call exit

found_bigger:
	mov res, eax
	mov ind, edx
	call exit

end main

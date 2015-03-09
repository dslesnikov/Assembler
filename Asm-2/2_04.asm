.486

.MODEL Flat, StdCall

.DATA
	a DD 18
	b DD 19
	d DD ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, b
	cmp eax, ebx
	ja bigger
	mov d, ebx
	call exit

bigger:
	mov d, eax
	call exit

end main

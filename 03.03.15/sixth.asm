.486

.MODEL Flat, StdCall

.DATA
	a DD 17
	b DD 20
	gcd DD ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, a
	mov ebx, b
	jmp gcd_search
	
gcd_search:
	and edx, 0
	div ebx
	cmp edx, 0
	je found_gcd
	mov eax, ebx
	mov ebx, edx
	jmp gcd_search

found_gcd:
	mov gcd, ebx
	call exit

end main

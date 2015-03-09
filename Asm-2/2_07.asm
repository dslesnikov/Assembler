.486

.MODEL Flat, StdCall

.DATA
	n DD 17
	fib_res DD ?

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, 1
	mov ebx, 1
	mov ecx, n
	jmp fib_calc

fib_calc:
	mov edx, eax
	add eax, ebx
	mov ebx, edx
	loop fib_calc
	mov fib_res, eax
	call exit

end main

.486

.MODEL Flat, StdCall

.DATA
	num		dd	15
	len 	equ	3
	pow 	db	1, 2, 5

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov eax, num
	mov esi, offset pow
	mov edx, 0
	mov ecx, len
run_through:
	mov bl, [esi + type pow * edx]
	inc edx
	call power
	push eax
	mov eax, num
	loop run_through

	mov ecx, len
	mov eax, 0
pop_and_sum:
	pop ebx
	add eax, ebx
	loop pop_and_sum

	call exit


;Возводим число в степень
;eax - основание степени
;bl - показатель степени
;Результат лежит в eax
power:
	push edx
	push ecx
	mov ecx, eax
multy_loop:
	dec bl
	cmp bl, 0
	je powered
	imul ecx
	jmp multy_loop

powered:
	pop ecx
	pop edx
	ret


end main

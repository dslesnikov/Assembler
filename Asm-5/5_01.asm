.486

.MODEL Flat, StdCall

.DATA
	len equ 7
	arr dd 28, -9, 15, -8, -1, 1000, 0DEADBEAFH
	test_arr dd 8, 16, 32, 4, 1024, 512, 4
	two dd 2

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.CODE
main:
	mov esi, offset test_arr
	mov ecx, len
	dec ecx
	mov edx, 0
	mov ebx, [esi + type arr * edx]
	call absolute_please
	mov eax, ebx
common_gcd:
	inc edx
	mov ebx, [esi + type arr * edx]
	call absolute_please
	call find_gcd
	mov eax, ebx
	loop common_gcd
	call exit


;Проверка числа на отрицательность, взятие его модуля
;ebx - входное число
;Результат лежит в ebx
absolute_please:
	push edx
	push eax

	mov eax, ebx
	cdq
	idiv two
	cmp edx, 2
	jb absoluted
	neg ebx
absoluted:
	pop eax
	pop edx
	ret



;Ищет наибольший общий делитель двух чисел
;eax - первое число
;ebx - второе число
;Результат лежит в ebx
find_gcd:
	; Чтобы не засорять счетчик массива
	push edx
finding_loop:
	cdq
	idiv ebx
	cmp edx, 0
	je found
	mov eax, ebx
	mov ebx, edx
	jmp finding_loop
found:
	pop edx
	ret

end main

.486

.MODEL Flat, StdCall

.DATA
	len equ 4
	arr dd 28, -70, 154, 98
	test_arr dd 8, 16, 32, 4, 1024, 512, 4

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
	test ebx, ebx
	jns absoluted
	neg ebx
absoluted:
	ret


;Ищет наибольший общий делитель двух чисел
;eax - первое число
;ebx - второе число
;Результат лежит в ebx
find_gcd:
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

.486
.MODEL Flat, StdCall
.DATA
	len			equ	1000
	first		dd  len dup (0)
	second		dd  len dup (0)
	test_size	dd  300
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib
.CODE
main:
	mov eax, 1
	mov ebx, test_size
	mov esi, offset first
	mov edi, offset second
	mov edx, 0
finding_loop:
	call are_friendly
	cmp ecx, 0
	je not_friends
	mov [esi + edx*type first], eax
	mov [edi + edx*type second], ebx
	inc edx
not_friends:
	inc eax
	cmp eax, ebx
	jne finding_loop
	mov eax, 1
	dec ebx
	cmp ebx, 1
	jne finding_loop
	call exit


;Checks if 2 numbers are friendly
;Inputs:
;eax, ebx - numbers

;Result:
;if true, ecx = 1, else ecx = 0
are_friendly:
	push eax
	push ebx
	push edx
	mov edx, ebx
	call calc_div_sum
	mov ecx, eax
	mov eax, edx
	mov edx, ebx
	call calc_div_sum
	cmp eax, edx
	jne false
	cmp ecx, ebx
	je true
false:
	mov ecx, 0
	jmp return
true:
	mov ecx, 1
return:
	pop edx
	pop ebx
	pop eax
	ret

;Calculates sum of divisors of number
;Inputs:
;eax - number

;Locals:
;[ebp-4] - accumulator

;Result:
;ebx contains sum
calc_div_sum:
	sub esp, 4
	push edx
	push ecx
	cmp eax, 1
	jne number_is_not_one
	mov [ebp-4], dword ptr 1
	jmp return_calc_div_sum
number_is_not_one:
	mov ebx, 1
	mov ecx, eax
	mov [ebp-4], dword ptr 0
accumulating:
	mov edx, 0
	div ebx
	mov eax, ecx
	cmp edx, 0
	jne continue
	add [ebp-4], ebx
continue:
	inc ebx
	cmp ebx, eax
	jne accumulating
return_calc_div_sum:
	mov ebx, [ebp-4]
	pop ecx
	pop edx
	add esp, 4
	ret
end main

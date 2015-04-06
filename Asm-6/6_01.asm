.486
.Model Flat, StdCall
.DATA
	len    equ 5
	arr    dd  4, 5, 6, 7, 8
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib
.CODE
main:
	mov ecx, 0
	mov ebx, len
	mov edx, 0
inner_loop:
	push ecx
	push ebx
	push offset arr
	call calc_sum
	cmp eax, edx
	jle continue
	mov edx, eax
	add ecx, ebx
	cmp ecx, len
	je to_outter
	sub ecx, ebx
	inc ecx
	jmp inner_loop
to_outter:
	sub ecx, ebx
	mov ecx, 0
	dec ebx
	jmp inner_loop
	call exit


;Calculates sum of elems from array
;Inputs:
;[ebp+8] - array address, elemets of size 4
;[ebp+12] - length of subarray to calculate
;[ebp+16] - index of starting of calculation
;Asserts: [ebp+12] + [ebp+16] < length of array
;Outputs:
;eax - sum
calc_sum:
	push ebp
	mov ebp, esp
	push ebx
	push edx
	push esi
	mov ecx, [ebp+12]
	mov esi, [ebp+8]
	mov edx, [ebp+16]
	mov eax, 0
summing_loop:
	mov ebx, [esi+4*edx]
	add eax, ebx
	loop summing_loop
	pop esi
	pop edx
	pop ebx
	pop ebp
	ret
end main

.486

.MODEL Flat, StdCall

.DATA
	len 		equ 10
	test1		dw	3, 18, 3, 3, 18, 3, 3, 3, 18, 3
	test2		dw	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	two			dw	2

INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib


;As result, eax contains length of palindrome, edx contains starting index
.CODE
main:
	mov esi, offset test1
	mov eax, len
	mov edx, 0
inner_loop:
	call is_palindrome
	cmp ebx, 1
	je found
	add eax, edx
	cmp eax, len
	je to_outter
	sub eax, edx
	inc edx
	jmp inner_loop
to_outter:
	sub eax, edx
	mov edx, 0
	dec eax
	jmp inner_loop
found:
	call exit

;Checks if array is palindrome

;Inputs:
;esi - adress of start of the array (2 bytes length)
;eax - length of the array
;edx - index of starting position for subarray to check

;Locals:
;[ebp-4] - index of starting position

;Result:
;if true, then ebx contents 1, else 0

is_palindrome:
	push eax
	push ecx
	push edx
	sub esp, 4
	mov [ebp-4], edx
	cmp eax, 1
	je true
	mov ebx, eax
	mov ecx, eax
pushing_loop:
	mov ax, [esi+edx*2]
	push ax
	inc edx
	loop pushing_loop
	mov ecx, ebx
	mov edx, [ebp-4]
poping_loop:
	mov bx, [esi+edx*2]
	inc edx
	pop ax
	cmp ax, bx
	jne false
	loop poping_loop
true:
	mov ebx, 1
	jmp return
false:
	dec ecx
continue_popping:
	pop bx
	loop continue_popping
	mov ebx, 0
return:
	add esp, 4
	pop edx
	pop ecx
	pop eax
	ret
end main

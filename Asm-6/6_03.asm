.486
.MODEL Flat, StdCall
.DATA
	a	dd	5
	b	dd	4
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib
.CODE
main:
	mov ecx, a
	call factorial
	call exit


factorial:
    push ebp                 ;Сохранение BP
    push ebx
    mov ebp, esp               ;BP=SP
    mov eax, [ebp+8]           ;AX=параметр
    test eax,eax              ;Проверка AX
    jz f_ret1               ;Если 0, вернуть 1
    dec eax                  ;Декремент AX
    push eax                 ;Помещение параметра в стек
    call factorial          ;Вызов процедуры для предыдущего числа
    mov ebx, [ebp+8]
    mul ebx          ;Умножение результата на параметр процедуры
    jmp f_ret               ;Переход к возврату из процедуры
f_ret1:
    inc eax
f_ret:
	pop ebx
    pop ebp                  ;Восстановление BP
    ret 4                   ;Возврат из процедуры
end main

section .data                           ; сегмент инициализированных переменных
	InArrMsg db "Введите массив из 28 элементов",10
	lenInArrMsg equ $-InArrMsg

    OutOriginArrMsg db "Массив до перестановок",10
    lenOutOriginArrMsg equ $-OutOriginArrMsg

    OutSwappedArrMsg db "Массив после перестановок",10
    lenOutSwappedArrMsg equ $-OutSwappedArrMsg

    NewLine db 10

section .bss                            ; сегмент неинициализированных переменных
    buf  resb 10
	
	arr resd 28

section .text                           ; сегмент кода
	global _start                   
_start:
	; Вывод сообщения для ввода
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InArrMsg                   ; адрес выводимой строки
	mov rdx, lenInArrMsg                ; длина выводимой строки
	syscall 		                    ; вызов системной функции

   mov rcx, 28
   xor rbx, rbx
input_loop:
    push rcx
    push rbx

    mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    call StrToInt64
    pop rbx
    mov [arr+rbx], eax
    add rbx, 4    

    pop rcx
    loop input_loop

;=======================================

    ; Вывод сообщения для оригинального массива
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, OutOriginArrMsg            ; адрес выводимой строки
	mov rdx, lenOutOriginArrMsg         ; длина выводимой строки
	syscall 

    mov rcx, 28
    xor rbx, rbx
output_origin_loop:
    push rcx

    mov eax, [arr+rbx]
    add rbx, 4
    push rbx

	mov rsi, buf
	call IntToStr64
	mov rdx, rax

    ; Замена переноса строки на пробел
    sub rax, 1
    mov byte[buf+rax], 32

    ; write
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, rsi                        ; адрес выводимой строки
	mov rdx, rdx                        ; длина выводимой строки
	syscall

    pop rbx
    pop rcx
    loop output_origin_loop

    ; Перенос строки
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, NewLine                    ; адрес выводимой строки
	mov rdx, 1                          ; длина выводимой строки
	syscall

;=======================================

    mov rdx, 1
pos_and_neg_swaps:
    cmp edx, 0
    je end_pos_and_neg_swaps

    xor rdx, rdx
    mov rcx, 27 ; size - 1
inner_pn_loop:
    mov rax, [arr+rcx*4]
    cmp eax, 0
    jge continue_pn

    dec rcx
    mov eax, [arr+rcx*4]
    inc rcx
    cmp eax, 0
    jl continue_pn

    xchg eax, [arr+rcx*4]
    dec rcx
    xchg eax, [arr+rcx*4]
    inc rcx

    mov rdx, 1
continue_pn:
    loop inner_pn_loop

    jmp pos_and_neg_swaps
end_pos_and_neg_swaps:

;=======================================

mov rdx, 1
zero_and_pos_swaps:
    cmp edx, 0
    je end_zero_and_pos_swaps

    xor rdx, rdx
    mov rcx, 27 ; size - 1
inner_zp_loop:
    mov rax, [arr+rcx*4]
    cmp eax, 0
    jle continue_zp

    dec rcx
    mov eax, [arr+rcx*4]
    inc rcx
    cmp eax, 0
    jne continue_zp

    xchg eax, [arr+rcx*4]
    dec rcx
    xchg eax, [arr+rcx*4]
    inc rcx

    mov rdx, 1
continue_zp:
    loop inner_zp_loop

    jmp zero_and_pos_swaps
end_zero_and_pos_swaps:

;=======================================

    ; Вывод сообщения для упорядоченного массива
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, OutSwappedArrMsg           ; адрес выводимой строки
	mov rdx, lenOutSwappedArrMsg        ; длина выводимой строки
	syscall 

    mov rcx, 28
    xor rbx, rbx
output_swapped_loop:
    push rcx

    mov eax, [arr+rbx]
    add rbx, 4
    push rbx

	mov rsi, buf
	call IntToStr64
	mov rdx, rax

    ; Замена переноса строки на пробел
    sub rax, 1
    mov byte[buf+rax], 32

    ; write
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, rsi                        ; адрес выводимой строки
	mov rdx, rdx                        ; длина выводимой строки
	syscall

    pop rbx
    pop rcx
    loop output_swapped_loop

    ; Перенос строки
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, NewLine                    ; адрес выводимой строки
	mov rdx, 1                          ; длина выводимой строки
	syscall

    ; exit
	mov rax, 60                         ; системная функция 1 (exit)
	xor rdi, rdi                        ; код возврата 0 
	syscall                             ; вызов системной функции

%include "lib64.asm"
section .data                           ; сегмент инициализированных переменных
	InStrMsg db "Введите строку",10
	lenInStrMsg equ $-InStrMsg

    OutStrMsg db "Отсортированная строка",10
    lenOutStrMsg equ $-OutStrMsg

section .bss                            ; сегмент неинициализированных переменных
    string resb 56
    num_buf resb 3
    word_buf resb 6

    min_num resb 1

section .text                           ; сегмент кода
	global _start                   
_start:
	; Вывод сообщеня для ввода
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InStrMsg                   ; адрес выводимой строки
	mov rdx, lenInStrMsg                ; длина выводимой строки
	syscall 		                    ; вызов системной функции

    ; Считывание строки
    mov rax, 0
    mov rdi, 0
    mov rsi, string
    mov rdx, 56
    syscall

    mov byte[string+55], 32

    mov rsi, string
    mov rdi, string

    mov rcx, 8
iteration_loop:
    push rcx

    push rsi
    push rdi

    mov byte[min_num], 255                  ; Минимум числа
    xor rbx, rbx                            ; Адрес слова с минимумом
    mov rcx, rcx
find_min_loop:
        push rcx
    
        mov rdx, rsi                        ; Сохраняем начало слова
    
        push rdi
        mov rdi, num_buf
        mov rcx, 2
        rep movsb                           ; Переносим число в буфер
        mov byte[num_buf+2], 10             ; Добавление символа переноса строки
        pop rdi
    
        push rsi
        push rdx
        push rbx
        mov rsi, num_buf
        call StrToInt64
        pop rbx
        pop rdx
        pop rsi
    
        push rax
        mov rax, 32                         ; Символ пробела
        push rdi
        push rsi
        mov rdi, rsi
rep_not_equal_in_min_loop:
        scasb                               ; Пропускаем символы до след слова
        jne rep_not_equal_in_min_loop
        pop rsi
        mov rsi, rdi
        pop rdi
        pop rax

        cmp al, [min_num]
        jnb end_if
        mov [min_num], al
        mov rbx, rdx
end_if:
        pop rcx
        loop find_min_loop

    pop rdi

    ; Перенос первого слова в word_buf
    pop rsi
    push rsi
    push rdi
    mov rdi, word_buf
    mov rcx, 6
    rep movsb
    pop rdi
    
    ; Перенос минимального слова в начало
    push rbx
    mov rsi, rbx
    mov rcx, 6
    rep movsb
    ; Добавление пробелов между словами
    mov byte[rdi], 32
    inc rdi
    pop rbx

    ; Перенос первого слова из буфера на место минимального
    mov rsi, word_buf
    push rdi
    mov rdi, rbx
    mov rcx, 6
    rep movsb
    ; Добавление пробелов между словами
    mov byte[rdi], 32
    inc rdi
    pop rdi

    pop rsi

    push rax
    mov al, 32                          ; Символ пробела
    push rdi
    push rsi
    mov rdi, rsi
rep_not_equal_it_loop:
    scasb                               ; Пропускаем символы до след слова
    jne rep_not_equal_it_loop
    pop rsi
    mov rsi, rdi
    pop rdi
    pop rax

    pop rcx
    loop crutch_loop
crutch_loop:
    cmp rcx, 0
    jne iteration_loop

    mov byte[string+55], 10

    mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, OutStrMsg                  ; адрес выводимой строки
	mov rdx, lenOutStrMsg               ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, string                     ; адрес выводимой строки
	mov rdx, 56                         ; длина выводимой строки
	syscall 		                    ; вызов системной функции

    ; exit
	mov rax, 60                         ; системная функция 1 (exit)
	xor rdi, rdi                        ; код возврата 0 
	syscall                             ; вызов системной функции

%include "lib64.asm"

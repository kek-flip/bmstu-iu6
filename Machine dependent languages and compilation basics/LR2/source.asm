section .data                           ; сегмент инициализированных переменных
	InAMsg db "Input a:",10
	lenInAMsg equ $-InAMsg

	InBMsg db "Input b:",10
	lenInBMsg equ $-InBMsg

	InXMsg db "Input x:",10
	lenInXMsg equ $-InXMsg

	InYMsg db "Input y:",10
	lenInYMsg equ $-InYMsg

	OutMsg db "Answer:",10
	lenOutMsg equ $-OutMsg

section .bss                            ; сегмент неинициализированных переменных
	a resd 1
	b resd 1
	x resd 1
	y resd 1
	
	n resd 1

    buf resb 10

section .text                           ; сегмент кода
	global _start                   
_start:
read_a:
	; Вывод сообщеня для переменной А
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InAMsg                     ; адрес выводимой строки
	mov rdx, lenInAMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной А
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64
	cmp rax, 0
	je read_a

	mov [a], rax

	; Вывод сообщеня для переменной B
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InBMsg                     ; адрес выводимой строки
	mov rdx, lenInBMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной B
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64
	mov [b], rax

	; Вывод сообщеня для переменной X
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InXMsg                     ; адрес выводимой строки
	mov rdx, lenInXMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной X
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64
	mov [x], rax

read_y:
	; Вывод сообщеня для переменной Y
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InYMsg                     ; адрес выводимой строки
	mov rdx, lenInYMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной Y
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64

	mov rbx, -1

	imul rbx
	cmp eax, [a]
	je read_y

	imul rbx
	mov [y], rax

	; n = a * x^2 - (b * y) / a + x / (y + a)

	; Первое слагаемое
	mov eax, [x]
	imul eax
	mov ebx, [a]
	imul ebx
	mov ecx, eax

	; Второе слагаемое
	mov eax, [b]
	mov ebx, [y]
	imul ebx
	mov ebx, [a]
	cdq
	idiv ebx
	sub ecx, eax

	; Третье слагаемое
	mov eax, [x]
	mov ebx, [y]
	add ebx, [a]
	cdq
	idiv ebx
	add ecx, eax

	mov [n], ecx

	; write
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, OutMsg                     ; адрес выводимой строки
	mov rdx, lenOutMsg                  ; длина выводимой строки
	syscall

	; Конвертация в str
	mov rax, [n]
	mov rsi, buf
	call IntToStr64
	mov rdx, rax

    ; write
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, rsi                        ; адрес выводимой строки
	mov rdx, rdx                        ; длина выводимой строки
	syscall
 
	; exit
	mov rax, 60                         ; системная функция 1 (exit)
	xor rdi, rdi                        ; код возврата 0 
	syscall                             ; вызов системной функции

%include "lib64.asm"
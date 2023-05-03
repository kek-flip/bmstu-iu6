section .data                           ; сегмент инициализированных переменных
	InBMsg db "Input b:",10
	lenInBMsg equ $-InBMsg

	InCMsg db "Input c:",10
	lenInCMsg equ $-InCMsg

	InDMsg db "Input d:",10
	lenInDMsg equ $-InDMsg

	InMMsg db "Input m:",10
	lenInMMsg equ $-InMMsg

	OutMsg db "Answer:",10
	lenOutMsg equ $-OutMsg

section .bss                            ; сегмент неинициализированных переменных
	b resd 1
	c resd 1
	d resd 1
	m resd 1
	
	y resd 1

    buf resb 10

section .text                           ; сегмент кода
	global _start                   
_start:
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

	; Вывод сообщеня для переменной C
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InCMsg                     ; адрес выводимой строки
	mov rdx, lenInCMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной C
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64
	mov [c], rax

	; Вывод сообщеня для переменной D
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InDMsg                     ; адрес выводимой строки
	mov rdx, lenInDMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной D
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64
	mov [d], rax

	mov edx, [c]
	sub edx, [d]
	cmp edx, 10

	jg calc_first

read_m:
	; Вывод сообщеня для переменной M
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, InMMsg                     ; адрес выводимой строки
	mov rdx, lenInMMsg                  ; длина выводимой строки
	syscall 		                    ; вызов системной функции

	; Считывание переменной M
	mov rax, 0                          ; системная функция 3 (read)
	mov rdi, 0                          ; дескриптор файла stdin=0
	mov rsi, buf                        ; адрес буфера ввода
	mov rdx, 10                         ; размер буфера
	syscall                             ; вызов системной функции

    ; Конвертация в int
    mov rsi, buf
    call StrToInt64

	; Проверка на неравенство m нулю
	cmp rax, 0
	je read_m

	mov [m], rax
	jmp calc_second

	; f = b * (c - d) if c - d > 10
	;	  c / m else

calc_first:
	mov eax, [b]
	mov edx, [c]
	sub edx, [d]
	imul edx
	mov [y], eax
	jmp end
calc_second:
	mov eax, [c]
	cdq
	mov ebx, [m]
	idiv ebx
	mov [y], eax
end:
	; write
	mov rax, 1 		                    ; системная функция 1 (write)
	mov rdi, 1 		                    ; дескриптор файла stdout=1 
	mov rsi, OutMsg                     ; адрес выводимой строки
	mov rdx, lenOutMsg                  ; длина выводимой строки
	syscall

	; Конвертация в str
	mov rax, [y]
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
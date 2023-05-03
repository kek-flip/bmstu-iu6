section .data                           ; сегмент инициализированных переменных
	ExitMsg db "Press Enter to Exit",10 ; выводимое сообщение
	lenExit equ $-ExitMsg

    ;A dd -30
    B dd 21

	val1 db 255
	chart dw 256 
	lue3 dw -128 
	v5 db 10h 
	db 100101B 
	beta db 23,23h,0ch
	sdk db "Hello",10
	min dw -32767 
	ar dd 12345678h 
	valar times 5 db 8

	TWF dw 25
	TRF dd -35
	NL db "Maxim",10
	NR db "Максим",10

	NUM1 dw 37
	NUM2 dw 9472

	F1 dw 65535
	F2 dd 65535

	A dw 5,-5

section .bss                            ; сегмент неинициализированных переменных
	InBuf resb 10                       ; буфер для вводимой строки
	lenIn equ $-InBuf

    X resd 1

	alu resw 10

section .text                           ; сегмент кода
	global _start                   
_start:
    mov EAX,[A]                         ; загрузить число A в регистр EAX
    add EAX,5                           ; сложить EAX и 5, результат в EAX
    sub EAX,[B]                         ; вычесть число B, результат в EAX
    mov [X],EAX                         ; сохранить результат в памяти

	add [F1], word  1
	add [F2], dword 1

	; write
	mov eax, 4 		                    ; системная функция 4 (write)
	mov ebx, 1 		                    ; дескриптор файла stdout=1 
	mov ecx, ExitMsg                    ; адрес выводимой строки
	mov edx, lenExit                    ; длина выводимой строки
	int 80h 		                    ; вызов системной функции

	; read
	mov eax, 3                          ; системная функция 3 (read)
	mov ebx, 0                          ; дескриптор файла stdin=0
	mov ecx, InBuf                      ; адрес буфера ввода
	mov edx, lenIn                      ; размер буфера
	int 80h                             ; вызов системной функции
 
	; exit
	mov eax, 1                          ; системная функция 1 (exit)
	xor ebx, ebx                        ; код возврата 0 
	int 80h                             ; вызов системной функции
section .bss
    w_len resd 128
    w_addr resd 128

section .text
    extern sort_len_and_idx
	global sort_str
sort_str:
    push rbp
    mov rbp, rsp
    lea rsp, [rsp-0]
    push rax
    push rbx
    push rcx
    push rdx

    xor rcx, rcx ; Индекс символа в строке (i)
    xor rbx, rbx ; Индекс начала последнего слова (w)
    xor rax, rax ; Кол-во слов (k)

    xor rdx, rdx ; Очистка rdx

get_words_len_and_idx_loop:
    mov dl, [rsi+rcx]
    cmp dl, 0
    je end_get_words_len_and_idx_loop

space_if:
    cmp dl, 32
    jne end_space_if

    push rcx
    sub rcx, rbx
    mov [w_len+rax*4], ecx
    pop rcx

    mov [w_addr+rax*4], rbx

    mov rbx, rcx
    inc rbx

    inc rax
end_space_if:

    inc rcx
    
    jmp get_words_len_and_idx_loop
end_get_words_len_and_idx_loop:

    push rcx
    sub rcx, rbx
    mov [w_len+rax*4], ecx
    pop rcx

    mov [w_addr+rax*4], rbx

    inc rax

; Передача параметров через регистры и вызов подпрограммы
    push rdi
    push rsi
    push rdx
    mov rdi, w_len
    mov rsi, w_addr
    mov rdx, rax
    call sort_len_and_idx
    pop rdx
    pop rsi
    pop rdi

    xor rbx, rbx ; Индекс символа в отсортированной строке (j)
    mov rcx, rax
write_loop:
    push rcx
    push rax
    
    sub rax, rcx ; rax == i
    mov eax, dword[w_addr+rax*4] ; rax == c !!!! Поменять на w_addr

word_loop:
    cmp byte[rsi+rax], 32
    je end_word_loop
    cmp byte[rsi+rax], 0
    je end_word_loop

    mov dl, byte[rsi+rax]
    mov byte[rdi+rbx], dl
    inc rax
    inc rbx
    jmp word_loop
end_word_loop:

    mov byte[rdi+rbx], 32
    inc rbx

    pop rax
    pop rcx
    loop write_loop

    dec rbx
    mov byte[rdi+rbx], 0

    pop rdx
    pop rcx
    pop rbx
    pop rax
    mov rsp, rbp
    pop rbp
    ret

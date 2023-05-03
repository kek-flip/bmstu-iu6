         section .text     ; ������� ����
IntToStr64: 
         push   rdi
         push   rbx
         push   rdx
         push   rcx
		 push   rsi
		 mov    byte[rsi],0 ; �� ����� �����
         cmp    eax,0
         jge    .l1
         neg    eax
         mov    byte[rsi],'-'
.l1      mov    byte[rsi+6],10
         mov    rdi,5
         mov    bx,10
.again:  cwd           ; ��������� ����� �� ��������
         div    bx     ; ����� ��������� �� 10
         add    dl,30h ; �������� �� ������� ��� �����
         mov    [rsi+rdi],dl ; ����� ������ � ������
         dec    rdi    ; ��������� ��������� ��  
                       ; ���������� �������
         cmp    ax, 0  ; ������������� ��� �����?
         jne    .again
         mov    rcx, 6
         sub    rcx, rdi ; ����� ����������+����
		 mov    rax,rcx
		 inc    rax    ; ����� ����������+OA
         inc    rsi    ; ���������� ����
		 push   rsi
         lea    rsi,[rsi+rdi] ; ������ ����������
		 pop    rdi
         rep movsb
         pop    rsi  
         pop    rcx
         pop    rdx
         pop    rbx
         pop    rdi
         ret
StrToInt64:
         push   rdi
         mov    bh, '9'
         mov    bl, '0'
         push   rsi     ; ��������� ����� �������� ������
         cmp    byte[rsi], '-'
         jne    .prod
         inc    rsi     ; ���������� ����
.prod    cld
         xor    di, di  ; �������� ������� �����
.cycle:  lodsb          ; ��������� ������ (�����)
         cmp    al, 10  ; ���� 10, �� �� �����
         je     .Return
         cmp    al, bl  ; ���������� � ����� ����
         jb     .Error  ; "����" � ������
         cmp    al, bh  ; ���������� � ����� ������ 
         ja     .Error  ; "����" � ������
         sub    al, 30h ; �������� ����� �� �������
         cbw            ; ��������� �� �����
         push   ax      ; ��������� � �����
         mov    ax, 10  ; ������� 10 � AX
         mul    di      ; ��������, ��������� � DX:AX
         pop    di      ; � DI � ��������� �����
         add    ax, di
         mov    di, ax  ; � DI � ����������� �����        
         jmp    .cycle
.Return: pop    rsi
         mov    rbx, 0
         cmp    byte[rsi], '-'
         jne    .J
         neg    di
.J       mov    ax, di
         cwde
         jmp    .R
.Error:  pop    rsi
         mov    rax, 0
         mov    rbx, 1
.R       pop    rdi
         ret
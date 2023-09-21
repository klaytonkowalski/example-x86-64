; Double elements in list
; <1> list, <2> length
%macro double_list 2
    mov rbx, %1
    mov rcx, %2
    mov rsi, 0
%%doubleLoop:
    mov rax, [rbx+rsi*8]
    imul rax, 2
    mov [rbx+rsi*8], rax
    inc rsi
    loop %%doubleLoop
%endmacro

; Single-line macro
%define list_len 3

section .data

list dq 1, -2, 3

section .text

global _start
_start:
    ; [2, -4, 6]
    double_list list, list_len
    ; [4, -8, 12]
    double_list list, list_len
    ; [8, -16, 24]
    double_list list, list_len

end:
    mov rax, 60
    mov rdi, 0
    syscall
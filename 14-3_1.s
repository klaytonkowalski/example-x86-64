; asmSum -> 14-3_2.s
; asmAvg -> 14-3_3.s
extern asmSum, asmAvg

section .data

list dd 1, 2, 3, 4, 5
length dd 5

section .bss

sum resd 1
avg resd 1

section .text

global _start
_start:
    mov rdi, list
    mov rsi, [length]
    ; Call external asmSum and asmAvg functions
    call asmSum
    mov [sum], eax
    movsxd rdi, eax ; result of asmSum is 1st arg of asmAvg
    call asmAvg
    mov [avg], eax

end:
    mov rax, 60
    mov rdi, 0
    syscall
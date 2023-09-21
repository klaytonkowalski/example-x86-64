section .data

list dq 1, 2, 3, 4, 5
sum dq 0
average dq 0

section .text

global _start
_start:
    ; 1st, 2nd, 3rd, 4th args
    mov rdi, list
    mov rsi, 5
    mov rdx, sum
    mov rcx, average
    call funcSumAverage
    jmp end

; sumAverage(&list, length, &sum, &average)
funcSumAverage:
    push r12 ; prologue, preserve r12
    mov r12, 0
    mov rax, 0
sumLoop:
    ; Calculate sum
    add rax, [rdi+r12*8]
    inc r12
    cmp r12, rsi
    jl sumLoop
    mov [rdx], rax
    ; Calculate average
    cqo
    idiv rsi
    mov [rcx], rax
    pop r12 ; epilogue, restore r12
    ret

end:
    mov rax, 60
    mov rdi, 0
    syscall
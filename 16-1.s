section .text

; With GCC, argc and argv are passed into rdi and rsi.
; With YASM, command-line args are passed onto stack by OS at rsp and rsp+8.
global _start
_start:
    ; Get cmd-line args
    mov r12, [rsp]
    mov r13, rsp
    add r13, 8
    ; Begin arg loop
    mov rbx, 0
printLoop:
    mov rdi, [r13+rbx*8]
    call printString
    inc rbx
    cmp rbx, r12
    jl printLoop
    jmp end

; Standard printString(*string) function
printString:
    push rbp
    mov rbp, rsp
    push rbx
    mov rbx, rdi
    mov rdx, 0
printStringLoop:
    cmp byte [rbx], 0
    je printStringDone
    inc rdx
    inc rbx
    jmp printStringLoop
printStringDone:
    cmp rdx, 0
    je end
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall
    pop rbx
    pop rbp
    ret

end:
    mov rax, 60
    mov rdi, 0
    syscall
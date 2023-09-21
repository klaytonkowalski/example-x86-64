section .data

; Reversed = 5, 4, 3, 2, 1
list dq 1, 2, 3, 4, 5

section .text

global _start
_start:
    ; Set up push loop
    mov rcx, 5
    mov rsi, 0
    mov r8, list

pushLoop:
    ; Push elements from list onto the stack
    push qword [r8+rsi*8]
    inc rsi
    loop pushLoop
    ; Set up pop loop
    mov rcx, 5
    mov rsi, 0

popLoop:
    ; Pop elements off the stack onto list
    pop qword [r8+rsi*8]
    inc rsi
    loop popLoop

end:
    mov rax, 60
    mov rdi, 0
    syscall
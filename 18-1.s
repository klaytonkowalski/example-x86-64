section .data

sum dq 0.0
average dq 0.0

list dq 1.5, 2.0, 3.5, 4.0, 5.5
length dd 5

section .text

global _start
_start:
    movsd xmm0, [sum]
    movsd xmm1, [average]
    mov rcx, [length]
    mov rsi, 0

; Calculate sum
findSum:
    addsd xmm0, [list+rsi*8]
    inc rsi
    loop findSum
    movsd [sum], xmm0

; Calculate average
findAverage:
    cvtsi2sd xmm1, dword [length]
    divsd xmm0, xmm1
    movsd [average], xmm0

end:
    mov rax, 60
    mov rdi, 0
    syscall
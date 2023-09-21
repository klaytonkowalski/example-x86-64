section .data

list db -1, 1, -3, 3, 12

sum db 0
min db -1
max db -1
avg db 0

section .text

global _start
_start:
    mov rcx, 5
    mov rsi, 0
    mov al, 0

startLoop:
    ; Add to intermediate sum
    add al, byte [list + rsi]

checkMin:
    ; Check new min
    mov dl, [min]
    cmp dl, [list + rsi]
    jle checkMax
    ; Set new min
    mov dl, [list + rsi]
    mov [min], dl

checkMax:
    ; Check new max
    mov dh, [max]
    cmp dh, [list + rsi]
    jge nextLoop
    ; Set new max
    mov dh, [list + rsi]
    mov [max], dh

nextLoop:
    ; Continue onto next loop iteration
    inc rsi
    loop startLoop

afterLoop:
    ; Set sum and average
    mov [sum], al
    mov dl, 5
    idiv dl
    mov [avg], al

end:
    mov rax, 60
    mov rdi, 0
    syscall
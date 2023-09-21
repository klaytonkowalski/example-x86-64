section .data

; Sorted = -75, -10, 5, 30, 100
list dq 5, 100, -75, 30, -10

; If no swapping happens during a pass, then
; elements are sorted and we are done
swapped db 0

section .text

global _start
_start:
    ; Requires 4 bubbles, the 5th element
    ; will then already be at the lowest slot
    mov rcx, 4
    mov rsi, 0

passLoop:
    mov byte [swapped], 0
    mov rdi, 0

bubbleLoop:
    ; Compare current and next element
    mov rbx, [list+rdi*8]
    mov r8, [list+(rdi+1)*8]
    ; Swap if current is greater than next
    cmp rbx, r8
    jg swap
    jmp bubbleLoopEnd

swap:
    xchg rbx, r8
    mov [list+rdi*8], rbx
    mov [list+(rdi+1)*8], r8
    mov byte [swapped], 1

bubbleLoopEnd:
    ; Check if we should repeat bubble loop
    ; for the next element up the list
    inc rdi
    cmp rdi, rcx
    jl bubbleLoop

passLoopEnd:
    ; If all elements are sorted, then exit early
    mov bl, [swapped]
    cmp bl, 0
    je end
    inc rsi
    loop passLoop

end:
    mov rax, 60
    mov rdi, 0
    syscall
section .data

bNum db 5
bPrev1 db 0
bPrev2 db 1
bIndex db 2
bResult db 0

section .text

global _start
_start:
    mov cl, [bNum]
    ; Return 0 if bNum == 0
    cmp cl, 0
    jle _end
    ; Return 1 if bNum == 1
    cmp cl, 1
    je _one
    ; Return Fibonacci number if bNum > 1
    jmp _fibonacci

_one:
    mov byte [bResult], 1
    jmp _end

_fibonacci:
    ; bResult = bPrev1 + bPrev2
    mov al, [bPrev1]
    add al, [bPrev2]
    mov [bResult], al
    ; Update previous
    mov al, [bPrev2]
    mov [bPrev1], al
    mov al, [bResult]
    mov byte [bPrev2], al
    ; Loop if not complete
    inc byte [bIndex]
    cmp [bIndex], cl
    jle _fibonacci

_end:
    mov rax, 60
    mov rdi, 0
    syscall
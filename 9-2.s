section .data

; Check if this string is a palindrome
; (Not using string functions, so no \0 needed)
mystring db "racecar"

section .text

global _start
_start:
    ; Loop through mystring, pushing each character
    ; onto the stack
    mov rsi, 0
    mov rcx, 7
pushLoop:
    movzx rbx, byte [mystring+rsi]
    push rbx
    inc rsi
    loop pushLoop
    ; Loop through mystring, popping each character
    ; from the stack
    mov rsi, 0
    mov rcx, 7
popLoop:
    pop rax
    ; Check if character is valid for palindrome
    movzx rbx, byte [mystring+rsi]
    cmp rax, rbx
    jne failure
    inc rsi
    loop popLoop
    jmp success

failure:
    ; Not a palindrome
    mov rdi, -1
    jmp end

success:
    ; Is a palindrome
    mov rdi, 0

end:
    mov rax, 60
    ; mov rdi, 0
    syscall
section .data

section .text

; 10 = LF (line feed or \n)
; 0 = NULL-terminating character
message1 db "Hello, world!", 10, 0
message2 db "Hello, again!", 10, 0
message3 db "Hello, goodbye!", 10, 0

global _start
_start:
    ; Print three messages to terminal then quit
    mov rsi, message1
    call printString
    mov rsi, message2
    call printString
    mov rsi, message3
    call printString
    jmp end

; printString(&string)
printString:
    mov rdx, 0
countCharacters:
    cmp byte [rsi+rdx], 0
    je countCharactersDone
    inc rdx
    jmp countCharacters
countCharactersDone:
    cmp rdx, 0
    je end
    ; System call - write to STDOUT
    mov rax, 1
    mov rdi, 1
    syscall
    ret

end:
    mov rax, 60
    mov rdi, 0
    syscall
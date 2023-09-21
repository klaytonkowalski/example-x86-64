section .data

bNum1 db 2
bNum2 db -2
bNum3 db 4
bNum4 db -4

wNum1 dw 6

bAns1 db 0
bAns2 db 0
bAns3 db 0
bAns4 db 0
bAns5 db 0
bAns6 db 0
bAns7 db 0
bAns8 db 0
bAns9 db 0
bAns10 db 0

wAns1 dw 0
wAns2 dw 0
wAns3 dw 0

section .text

global _start
_start:
    ; bAns1 = bNum1 + bNum2 = 0
    mov al, [bNum1]
    add al, [bNum2]
    mov [bAns1], al
    ; bAns2 = bNum1 + bNum3 = 6
    mov al, [bNum1]
    add al, [bNum3]
    mov [bAns2], al
    ; bAns3 = bNum3 + bNum4 = 0
    mov al, [bNum3]
    add al, [bNum4]
    mov [bAns3], al
    ; bAns4 = bNum1 - bNum2 = 4
    mov al, [bNum1]
    sub al, [bNum2]
    mov [bAns4], al
    ; bAns5 = bNum1 - bNum3 = -2
    mov al, [bNum1]
    sub al, [bNum3]
    mov [bAns5], al
    ; bAns6 = bNum2 - bNum4 = 2
    mov al, [bNum2]
    sub al, [bNum4]
    mov [bAns6], al
    ; bAns7 = bNum1 / bNum2 = -1
    mov ax, 0
    mov al, [bNum1]
    idiv byte [bNum2]
    mov [bAns7], al
    ; bAns8 = bNum3 / bNum4 = -1
    mov ax, 0
    mov al, [bNum3]
    idiv byte [bNum4]
    mov [bAns8], al
    ; bAns9 = wNum1 / bNum4 = -1 R 2
    mov ax, [wNum1]
    idiv byte [bNum4]
    mov [bAns9], al
    ; bAns10 = wNum1 % bNum4 = 2
    mov ax, [wNum1]
    idiv byte [bNum4]
    mov [bAns10], ah
    ; wAns1 = bNum1 * bNum3 = 8
    mov al, [bNum1]
    imul byte [bNum3]
    mov [wAns1], ax
    ; wAns2 = bNum2 * bNum2 = 4
    mov al, [bNum2]
    imul al
    mov [wAns2], ax
    ; wAns3 = bNum2 * bNum4 = 8
    mov al, [bNum2]
    imul byte [bNum4]
    mov [wAns3], ax

end:
    mov rax, 60
    mov rdi, 0
    syscall
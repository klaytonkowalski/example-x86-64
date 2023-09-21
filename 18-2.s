; abs_double(*result, *value)
%macro abs_double 2
    movsd xmm0, [%2]
    ucomisd xmm0, [zero]
    jae %%escape
    ; value is negative, multiply by -1.0
    mulsd xmm0, [negate]
%%escape:
    movsd [%1], xmm0
%endmacro

section .bss

result1 resq 1
result2 resq 1
result3 resq 1

section .data

test1 dq 1.5
test2 dq -2.4
test3 dq -5.7

zero dq 0.0
negate dq -1.0

section .text

global _start
_start:
    ; Find absolute value of test cases
    abs_double result1, test1
    abs_double result2, test2
    abs_double result3, test3

end:
    mov rax, 60
    mov rdi, 0
    syscall
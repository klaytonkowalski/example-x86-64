; int asmSum(&list, length)
global asmSum
asmSum:
    mov eax, 0
    mov rbx, 0
asmSumLoop:
    add eax, [rdi+rbx*4]
    inc rbx
    cmp rbx, rsi
    jl asmSumLoop
    ret
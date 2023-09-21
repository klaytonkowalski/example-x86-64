; int asmAvg(sum, length)
;
; Yeah, pretty dumb to take the sum instead of the list,
; but demonstrates chaining the result of asmSum() to the
; 1st arg in asmAvg().
global asmAvg
asmAvg:
    mov rax, rdi
    idiv rsi
    ret
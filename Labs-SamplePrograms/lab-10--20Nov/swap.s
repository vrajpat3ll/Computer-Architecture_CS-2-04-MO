.data
d1: .word 5
d2: .word 4
.text
.global _start
@swaps r3 and r4 registers always
swap:
    stmfd r13!, {r3-r4, r14}
    mov r6, r4
    mov r4, r3
    mov r3, r6
    @ ret lr
    mov pc, lr
    @ works as a return statement

_start:
    ldr r1, =d1
    ldr r3, [r1]
    ldr r1, =d2
    ldr r4, [r1]
    bl swap @r3,r4 as numbers
    @r6 as temp storage

    nop @Dummy instruction

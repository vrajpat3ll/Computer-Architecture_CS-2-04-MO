@
.section .data
number: .word 100
result: .word 0
.global __start__

__start__:
    LDR r0, =result
    LDR r0, [r0]
    LDR r1, =number
    LDR r1, [r1]
    BL square
    STR r2, [r2]
    B exit
square:
    MUL r2, r1, r1
    MOV r15/*PC */, r14/*LR */
exit:
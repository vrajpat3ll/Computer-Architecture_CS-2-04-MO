@caller-savee scheme &&
@callee-savee scheme

@we are using callee-savee scheme
.section .data
number: .word 2
result: .word 0
.global __start__

__start__:
    LDR r0, =result
    LDR r0, [r0]
    LDR r1, =number
    LDR r1, [r1]
    MOV r4, #5
    MOV r2, #1
    BL square
    STR r2, [r0]
    B exit
    
square:
    STMFD r13!, {r0, r1, r14}
    MUL r2, r2, r1
    SUB r4, #1
    CMP r4, #0
    BNE square

    @ LDMFD sp!, {lr}
    @ STMFD r13!, {r0, r1, r2}
    MOV pc, lr

exit:
    NOP

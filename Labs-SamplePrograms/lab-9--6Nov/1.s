@caller-savee scheme &&
@callee-savee scheme

@we are using callee-savee scheme
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
    STMFD r13!,{r0,r1,r2,r14}
    MUL r2, r1, r1
    BL add_
    STMFD r13!,{r0,r1,r2}
    LDMFD sp!, {r0,r1,r2,r14} 
    MOV r15/*PC */, r14/*LR */

add_:
    ADD r2,#4
    MOV pc, lr

exit:
    NOP
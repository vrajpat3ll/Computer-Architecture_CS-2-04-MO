.data
d1: .word 6
d2: .word 0
.text
.global _start

@Factorial using recursion.
factorial:
    stmfd r13!, {r1-r3, r14}
    mul r0, r3
    subs r3, #1
    beq storeResult
    bl factorial
    b _return
storeresult:
    ldr r1, =d2
    str r0, [r1]
_return:
    ldmfd r13!, {r1-r3, pc}
    nop

_start:
    ldr r1, =d1
    ldr r3, [r1]
    mov r0, #1
    bl factorial

@ recursive functions me STMFD upar aayega and LDMFD niche aayega
@ r13 - stack pointer
@ r14 - link address
@ r15 - program counter

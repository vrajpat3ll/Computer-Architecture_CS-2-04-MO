.data
n:          .word 0x44fcc052 @2022.0100
increment:  .word 0x3f800000 @1.0
result:     .float 0.0
counter:    .int 5
.global __start

__start:

    LDR r0, =result
    VLDR s0, [r0]
    @s0 contains result value
    LDR r0, =increment
    VLDR s1, [r0]
    @s1 contains value of increment in each step
    LDR r0, =n
    VLDR s2, [r0]
    @s2 contains value of initial number

    LDR r0, =counter
    LDR r0, [r0]
    @r0 contains number of times the loop has to run
    MOV r1, #0

loop:
    VADD.F32 s2, s2, s1
    VADD.F32 s0, s2
    ADD r1, #1
    CMP r1, r0
    BLT loop

exit:
    VSTR s0, =0x8000
    NOP

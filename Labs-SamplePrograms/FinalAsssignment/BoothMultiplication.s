.section .data
multiplier:     .word -0x8   @num1
multiplicand:   .word -0x7   @num2
u:              .word 0x0
v:              .word 0x0
instruction_u:  .word 0x0
instruction_v:  .word 0x0

.section .text
@     I have used Booth's Multiplication algorithm
@     given in the notes to implement this.
@     r0  -> U
@     r1  -> V
@     r2  -> Mulitplicand (N)
@     r3  -> Multiplier (M)
@     r4  -> iterator
@     r5  -> prevBit
@     r6  -> currBit
@     r7  -> stores last bit of r0
@     r8  -> stores last bit of r0 to add to the beginning of r1
@     r11 -> multiplicand * multiplier (first 32 bits)
@     r12 -> multiplicand * multiplier (last 32 bits)

.global main

main:
    mov r0, #0 @ U
    mov r1, #0 @ V
    ldr r2, =multiplicand
    ldr r2, [r2]@r2 = multiplicand
    ldr r3, =multiplier
    ldr r3, [r3] @r3 = multiplier
    add r1, r3  @V = multiplier
    mov r4, #0  @i = 0
    mov r5, #0  @prevBit = 0

    @ b boothmultiply

boothmultiply:
    add r4, r4, #1 @i++
    and r6, r1, #1 @r6 = (r1 & 1) -> currBit
    cmp r6, r5 @currBit ?< | ?> prevBit
    blt add @(0, 1)
    cmp r6, r5 @currBit ?< | ?> prevBit
    bgt subtract @ 1, 0
    cmp r6, r5 @currBit ?< | ?> prevBit
    beq skip @ 0, 0 or 1, 1
subtract:
    sub r0, r2 @U = U - N
    b skip
add:
    add r0, r2
skip:
    mov r5, r6 @prevBit = currBit

    and r7, r0, #1 @r7 = lsb(U)
    lsl r8, r7, #31 @r7 = r7*2^31

    @here UV <- UV >> 1 is issue
    asr r0, r0, #1 @ UV <- UV >> 1
    lsr r1, r1, #1
@   Understood the issue. we need to use LSR for
@   register storing V as we need to add lsb(U) in
@   the msb(V).

    add r1, r1, r8 @add last bit of U in V
    @ nop
    cmp r4, #32 @i<32
    blt boothmultiply

end:
    smull r12, r11, r2, r3 @for comparison

    @r0,r1 -> U V
    ldr r10, =u
    str r0, [r10]
    ldr r10, =v
    str r1, [r10]
    ldr r10, =instruction_u
    str r11, [r10]
    ldr r10, =instruction_v
    str r12, [r10]
.section .data
f1: .word 0x44fcc056
f2: .word 0x3f800000
f3: .word 0x00000000
.section .text
.global _start
_start:

    ldr r0, =f1
    vldr.f32 s0, [r0]
    ldr r1, =f2
    vldr.f32 s1, [r1]
    mov r2, #1
    vldr.f32 s2, [r0]
    vldr.f32 s3, [r0]
    ldr r3, =f3

loop:
    vadd.f32 s2, s2, s1
    vadd.f32 s3, s3, s2
    add r2, #1

    cmp r2, #5
    blt loop

    vstr.f32 s3, [r3]

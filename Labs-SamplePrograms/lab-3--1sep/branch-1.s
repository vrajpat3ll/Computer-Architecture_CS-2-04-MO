.data
d1: .word 0xffffffff
.text
.global _start
ldr r1,=d1
ldr r2, [r1]

_start:
adds r0,r2,#1
add r3,r0,r4
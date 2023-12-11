.data
mynum: .byte 0x5a,0,0,0
nextTennum: .space 10

.text
.global _start

_start:
    nop
    ldr r3,=mynum
    ldrb r1,[r3]
    mov r2,#0
    ldr r3,=nextTennum
    mov r4,#0
    mov r5,#0

l1: 
    mov r2, r2,lsl #8
    orr r2,r1, r2
    add r1,#5
    
    add r4,#1
    add r5,#1
    cmp r5,#10
    beq l2

    cmp r4,#4
    bne l1

l2:
    str r2, [r3]
    add r3, #4

    mov r4,#0
    mov r2,#0
    cmp r5,#10
    beq l3
    b l1
l3:
nop
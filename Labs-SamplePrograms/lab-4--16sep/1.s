@ take your roll number and add 5 to it for some number of times
.data
number: .word 0x013488C4  @20220100
arr:    .space 40

.text
.global main

main:
    ldr r1,=number
    ldr r2,=arr
    mov r3,#0
    mov r4,#10
    ldr r5,[r1]
    ldr r6,[r2]
    add r6,r6,r5

loop:
    add r6,r6,#5
    str r6,[r2],#4
    add r3,r3,#1
    cmp r4,r3
    bne loop
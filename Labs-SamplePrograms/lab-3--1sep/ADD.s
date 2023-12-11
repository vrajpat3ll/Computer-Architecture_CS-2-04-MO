.data
d1: .word 2022100
d2: .word 0
d3: .word 0
d4: .word 0
d5: .word 0
d6: .word 0
d7: .word 0
d8: .word 0
d9: .word 0
d10:.word 0
.text


.global _start

@generate 10 numbers starting from the roll number
@ program starts here
_start:
ldr r0,=d1
ldr r0,[r0]
str r0,[r1,#4]
add r1, r0, #1
str r1,[r2,#4]
add r2, r1,#1 
str r2,[r3,#4]
add r3, r2,#1 
str r3,[r4,#4]
add r4, r3,#1 
str r4,[r5,#4]
add r5, r4,#1 
str r5,[r6,#4]
add r6, r5,#1 
str r6,[r7,#4]
add r7, r6,#1 
str r7,[r8,#4]
add r8, r7,#1 
str r8,[r9,#4]
add r9, r8,#1 
str r9,[r10,#4]
sbn r0,#1,21
@Add two numbers available in Memory.
@Result to be stored in Memory
.data
d1: .word 0x1234
d2: .word 0x9876
d3: .word 0      @to store the result
.text
.global _start
@This is a comment
@You can give blank lines

_start:
ldr r1, =d1
ldr r2, [r1]
ldr r1, =d2
ldr r3, [r1]
add r4, r2, r3
ldr r1, =d3
str r4, [r1]
nop  @Dummy instruction

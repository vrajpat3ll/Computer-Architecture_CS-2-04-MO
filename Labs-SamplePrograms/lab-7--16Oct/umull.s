.data
number:     .word 0xffffffff
reverse:    .word 0xffffffff
result:     .space 8
.text
.global _start

_start:
    LDR r0, =number
    LDR r1, =reverse
    LDR r2, [r0] @ r2 = number
    LDR r3, [r1] @ r3 = reverse
    UMULL r5, r4, r2, r3
    LDR r0, =result
    STR r5, [r0, #4]
    STR r4, [r0]


@ why start from even address only?
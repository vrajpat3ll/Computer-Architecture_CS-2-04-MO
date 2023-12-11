.data
number:     .word 0x13488c4
reverse:    .word 0x18f3a
.text
.global _start

_start:
    LDR r0, =number
    LDR r1, =reverse
    LDR r2, [r0] @ r2 = number
    LDR r3, [r1] @ r3 = reverse
    UMULL r5, r4, r2, r3
    @ STR 
    
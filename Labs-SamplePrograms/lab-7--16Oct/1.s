@ .data
@ number:     .word 0x13488c4
@ reverse:    .word 0x18f3a
@ result:     .space 4

@ .text
@ .global _start

@ _start:
@ mov r0,#4
@ mvn r2,r0 @move negated

@ LSL: Logical Shift Left
@ mov r0,r2, LSL #2

@ LSR: Logical Shift Right
@ ROR: ROtate Right
@ ASR: Arithmetic Right Shift

@ *******Subtract numbers****************************************
    @ LDR r0, =number
    @ LDR r1, =reverse
    @ LDR r8, =result
    @ LDR r2, [r0] @ r2 = number
    @ LDR r3, [r1] @ r3 = reverse
    @ MVN r4, r3
    @ ADD r4, #1
    @ ADD r5, r2, r4
    @ STR r5, [r8]

@ using UMULL, multiply two big numbers and store it in two registers


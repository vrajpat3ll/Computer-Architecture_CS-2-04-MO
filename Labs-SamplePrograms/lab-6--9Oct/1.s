.data
mynum:  .word #20220100

.text
.global _start

_start:
    mov r1, #4
    add r2, r1, #10
    bne ext
    add r2, r2, r1

ext:
    add r3, r1, #0

@Factorial using recursion.
.data
d1: .word 5
d2: .word 0
.text
.global _start

fact: 
	stmfd R13!, {r1-r3, r14}
	mul r0, r3
	subs r3, #1
	beq storeResult
	bl fact
	b retFromFact
storeResult:
	ldr r1, =d2
	str r0, [r1]
retFromFact:
	ldmfd R13!, {r1-r3, pc}
	nop

_start:
	ldr r1, =d1
	ldr r3, [r1]
	mov r0, #1
	bl fact
	nop  @Dummy instruction

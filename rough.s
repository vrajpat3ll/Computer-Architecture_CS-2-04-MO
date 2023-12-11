.data
multiplicand: .word 5
multiplier: .word 12
u: .word 0
v: .word 0
uu: .word 0
vv: .word 0
.text
.global _start

_start:
  mov r0,#0
  mov r1,#0
  ldr r2,=multiplicand  @ Load the address of the multiplicand into R2
  ldr r2,[r2]
  ldr r3,=multiplier     @ Load the address of the multiplier into R3
  ldr  r3,[r3]
  mov r4,#0         @ loop counter 
  mov r5,#0     @initialize  previous bit as 0


boothmultiplication:
 add r4,r4,#1
 and r6,r1,#1     @ current bit  by Extracting  the least significant bit
 cmp r6,r5 
 blt addition @case of current bit 0 and prev bit 1
 cmp r6,r5 
 bgt subtraction @case of current bit 1 and prev bit 0
 cmp r6,r5 
 beq skip   @case when current and prev bit both are same  as 0,0 or 1,1

 addition:
  add r0,r2

 subtraction:
  sub r0,R2
  b skip

skip:
 mov r5,r6 @prevbit=currentbit
   
 and r7,r0,#1 @to extract the lsb
 lsl r8, r7, #31 @r7 = r7*2^31

    
    asr r0, r0, #1  
    lsr r1, r1, #1

    add r1, r1, r8 @add last bit of U in V
     
    cmp r4, #32 @i<32
    blt boothmultiply

end:
    smull r12, r11, r2, r3 
   
    ldr r10, =u
    str r0, [r10]
    ldr r10, =v
    str r1, [r10]
    ldr r10, =uu
    str r11, [r10]
    ldr r10, =vv
    str r12, [r10]
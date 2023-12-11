.data
Value1: .word 0x13488c4 , 0x13488c5
Value2: .word 0x13488c6 , 0x13488c7
Result: .word 0 

.text
.global _start
_start:

 LDR    R0, =Value1  
 LDR    R1, [R0]       
  LDR    R2, [R0, #4]     
  LDR    R0, =Value2      
  LDR    R3, [R0]         
  LDR    R4, [R0, #4]     
      
  ADDS    R6, R2, R4      
  ADC    R5, R1, R3       
      
  LDR    R0, =Result  
      
  STR    R5, [R0]         
  STR    R6, [R0, #4]
  nop
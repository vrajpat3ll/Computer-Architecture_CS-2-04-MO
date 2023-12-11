.data
N1: .word   0x44fcc052
N2: .float  2023.01
N3: .float  2024.01
N4: .float  2025.01
N5: .float  2026.01
.text
.global main

MAIN:
    @ Load the floating-point numbers into Neon registers
    ldr         r0, =N1 @ Load the address of the first number
    vldr        s0, [r0] @ Load the first number into d0

    ldr         r0, =N2 @ Load the address of the second number
    vldr        s1, [r0] @ Load the second number into d1

    ldr         r0, =N3 @ Load the address of the third number
    vldr        s2, [r0] @ Load the third number into d2

    ldr         r0, =N4 @ Load the address of the fourth number
    vldr        s3, [r0] @ Load the fourth number into d3

    ldr         r0, =N5 @ Load the address of the fifth number
    vldr        s4, [r0] @ Load the fifth number into d4

    vadd.f32    s0, s0, s1
    vadd.f32    s0, s0, s2
    vadd.f32    s0, s0, s3
    vadd.f32    s0, s0, s4

    @ Store the result in memory at address 0x8000 (adjust the address as needed)
    ldr         r0, =0x8000        @ Load the memory address where you want to store the result
    vstr        s5, [r0]           @ Store the result in memory at the specified address

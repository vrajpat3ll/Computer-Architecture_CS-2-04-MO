
.data
array:      .word 5, 2, 9, 1, 6
array_size: .word 5

.text
.global _start
_start:
    ldr r0, =array_size
    ldr r1, =array
    ldr r0, [r0]
    bl BubbleSort
    b _exit

BubbleSort:
    mov r4, #1 @ flag to check if sorted

BubbleLoop:
    mov r2, #0 @index
    mov r3, r4

CompareLoop:
    cmp r2, r0
    beq EndBubbleSort @ If index == array size, exit loop

    ldr r5, [r1, r2]
    ldr r6, [r1, r2]
    cmp r5, r6
    ble DoNotSwap
    str r5, [r1, r2, lsl #4]
    str r6, [r1, r2, lsl #4]
    mov r3, #0

DoNotSwap:
    add r2, r2, #1
    b CompareLoop

EndBubbleSort:
    cmp r3, #1
    beq ExitBubbleSort @if flag is 1, the array is sorted

    sub r4, r4, #1 @ Decrement the flag for another pass
    b BubbleLoop @ Repeat the bubble sort

ExitBubbleSort:
    bx lr
_exit:

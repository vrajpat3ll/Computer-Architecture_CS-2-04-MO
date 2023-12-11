.global _start

.section .data
arr:      .word 9, 2, 7, 9, 1, 5, 6, 3, 8, 10, 123, 69, 96, 13, 4, 4
size_arr: .word 16
.section .text
@ascending order
_start:
    ldr r1, =size_arr
    ldr r1, [r1]    @ r1 = sizeof(arr)

    mov r2, #0       @ int i = 0;
OuterLoop:
    mov r3, #0       @ int j = 0;
InnerLoop:
    ldr r4, =arr     @ r4 = arr;
    lsl r5, r3, #2     @ r5 = offset for arr[j] (r3 << 2)->(4*r3)
    add r4, r4, r5     @ r4 =  address of arr[j]
    ldr r5, [r4]       @ r5 = *r4 (arr[j])

    ldr r6, [r4, #4]   @ r6 = *(arr + j + 1)
    cmp r5, r6         @ Compare arr[j] && arr[j + 1]
    ble NoSwap        @ Branch if arr[j] <= arr[j + 1]

    str r5, [r4, #4]   @ SWAP here!   (r5 = *(r4+4))
    str r6, [r4]       @ (r6 = *(r4))

NoSwap:
    add r3, r3, #1     @ j++
    cmp r3, r1         @ Compare j sizeof(arr)
    blt InnerLoop     @ Branch to InnerLoop if j < size

    add r2, r2, #1     @ i++
    cmp r2, r1         @ Compare(i, sizeod(arr))
    blt OuterLoop     @ Branch to OuterLoop if i < sizeof(arr)

; To find the largest of three numbers stored in the memory location 2050H, 2051H and 2052H.
; Assuming that all three numbers are unequal.

       LXI H, 2050H
       MOV A, M
       INX H
       CMP M
       JNC SKIP1
       
       MOV A, M
       
SKIP1: INX H
       CMP M
       JNC SKIP2
       
       MOV A, M
       
SKIP2: OUT 01H
       
       HLT

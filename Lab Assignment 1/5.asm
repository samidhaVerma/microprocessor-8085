; To find the largest and smallest numbers out of 10 assigned 8-bit integers stored at 3000H onwards.
; Store the result at 3050H and 3051H. 					

       LXI H, 3000H
       MVI C, AH

       MOV A, M
       INX H
LOOP1: CMP M
       JNC SKIP1
       MOV A, M
SKIP1: INX H
       DCR C
       JNZ LOOP1
       
       LDA 3050H
       
       LXI H, 3000H    ; re-initializing the memory location to run the loop again 
       MVI C, AH

       MOV A, M
       INX H
LOOP2: CMP M
       JC SKIP2
       MOV A, M
SKIP2: INX H
       DCR C
       JNZ LOOP2
       
       LDA 3051H  
       
       HLT

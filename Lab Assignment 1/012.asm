; A set of 8 data bytes is stored in the memory locations starting at 2050H.
; Write an assembly language program to check each data byte for bit D7 and D0. 
; If D7 or D0 is 1, reject the data byte; otherwise, store the data bytes at memory locations starting from 2060H. 

       LXI H, 2050H
       LXI D, 2060H
       MVI C, 08H

LOOP:  MOV A, M
       RLC
       JNC REJECT
       RRC
       RRC 
       JNC REJECT
       RLC
       STAX D
       INX D

REJECT:INX H
       DCR C
       JNZ LOOP

       HLT

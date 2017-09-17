; To sort the list of bytes, in ascending order, stored in the memory starting from 2061H. 
; The count of the bytes in the list is stored at memory location 2060H.	

        LXI H, 2060H
        MOV C, M
        DCR C
DOPASS: LXI H, 2061H
        MOV D, C
CHECK:  MOV A, M
        INX H
        MOV B, M
        DCX H
        CMP B
        JNC NOSWAP

        MOV M, B
        INX H
        MOV M, A
        DCX H
        INX H

NOSWAP: DCR D
        JNZ CHECK

        DCR C
        JNZ DOPASS

        HLT

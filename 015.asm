; To search a data byte in stored at memory location 3000H in the list of 100 data bytes stored in the memory starting from location 3001H. 
; If the data byte is found, display 01H and if not found display 00H, on the output port 82H.

      LXI H, 3000H
      MVI C, 64H
      MOV B, M
      INX H
      MVI D, 00H

LOOP: LDAX H
      CMP B
      JNZ SKIP
      MVI D, 01H
      JMP EXIT
      
SKIP: INX H
      DCR C
      JNZ LOOP

EXIT: MOV A, D
      OUT 82H
 
      HLT

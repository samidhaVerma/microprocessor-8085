; To exchange a block of data bytes stored in the memory starting from 2051H with a block of data bytes 
; stored at another section of memory starting from 3051H. 
; Number of bytes to be exchanged is given at memory location 2050H.

      LXI H, 2050H
      MOV C, M
      INX H
      LXI D, 3051H
      
LOOP: MOV A, M
      XCHG
      MOV B, M
      STAX H
      MOV A, B
      STAX D
      XCHG
      INX H
      INX D
      DCR C
      JNZ LOOP
      
      HLT

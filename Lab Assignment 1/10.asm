; To copy a block of data bytes from one memory location starting from 2051H to another section of memory starting from 3051H.
; Number of bytes to be copied is given at memory location 2050H.


      LXI H, 2050H
      MOV C, M
      INX H
      LXI D, 3051H
      
LOOP: LDA H
      STA D
      INX H
      INX D
      DCR C
      JNZ LOOP
      
      HLT

; To shift a block of data from memory locations 3000H – 3009H to new memory locations 3050H – 3059H in reverse order
; i.e., data from 3000H will be moved to 3059H and so on.


      LXI H, 3000H
      LXI D, 3059H
      MVI C, 0AH

LOOP: MOV A, M
      STAX D
      INX H
      DCX D
      DCR C
      JNZ LOOP

      HLT

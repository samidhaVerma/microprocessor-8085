; To divide a 16-bit dividend, stored in memory locations 2051H & 2052H, by an 8-bit divisor, stored in memory location 2053H. 
; After division the quotient must be stored in memory location 2054H and remainder in memory location 2055H.


      LHLD 2051H
      LDA 2053H
      MOV B, A
      MVI C, 08H

LOOP: DAD H
      MOV A, H
      SUB B
      JC SKIP

      MOV H, A
      INR L

SKIP: DCR C
      JNZ LOOP

      SHLD 2054H

      HLT

; To multiply two 8-bit numbers. Multiplicand is extended to 16-bit and stored in the two consecutive memory locations 2050H and 2051H. 
; The multiplier is stored at 2052H. 
; Store the 16-bit product at two consecutive memory locations 2053H and 2054H.


      LHLD 2050H
      XCHG
      LDA 2052H
      LXI H, 0000H
      MVI C, 08H

LOOP: DAD H
      RAL
      JNC SKIP

      DAD D

SKIP: DCR C
      JNZ LOOP
  
      SHLD 2053H

      HLT

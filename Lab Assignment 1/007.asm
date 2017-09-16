; To add the given list of n data bytes stored in the memory starting from memory location 3050H.
; Store the 16-bit sum in the memory location 3070H (lower byte) and 3071H (higher byte).
; Where n may be any number but for this case choose n=25.

      LXI H, 3050H
      MVI C, 19H
      MVI D, 00H
      
      MOV A, M
      INX H
LOOP: MOV B, M
      ADD B
      JNC SKIP
      INR D
SKIP: INX H
      DCR C
      JNZ LOOP
      
      STA 3070H
      MOV A, D
      STA 3071H
      
      HLT

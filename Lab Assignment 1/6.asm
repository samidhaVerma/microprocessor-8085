; To add the given list of n data bytes stored in the memory starting from memory location 3000H.
; Store the 8-bit sum in the memory location 3050H.
; Where n may be any number but for this case choose n=10.

      LXI H, 3000H
      MVI C, AH
     
      MOV A, M
      INX H
LOOP: MOV B, M
      ADD B
      INX H
      DCR C
      JNZ LOOP
      
      LDA 3050H
      
      HLT

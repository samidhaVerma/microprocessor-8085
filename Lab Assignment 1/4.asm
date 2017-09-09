; to find the smallest of the given list of n data bytes stored in the memory starting from memory location 2071H.
; Count of data bytes in the list (i.e. n) is stored at memory location 2070H.

      LXI H, 2070H
      MOV C, M
      INX H

      MOV A, M
      INX H
      DCR C
      
LOOP: CMP M
      JC SKIP
      MOV A, M
      
SKIP: INX H
      DCR C
      JNZ LOOP
      
      OUT 01H
      
      HLT

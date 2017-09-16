; To find the sum of positive numbers only and ignore negative numbers from the list of numbers. 
; The length of the list is in memory location 2050H and the series itself begins from memory location 2051H. 
; Store the 8-bit sum at the memory location 3070H.


      LXI H, 2050H
      MOV C, M
      INX H
      XRA A
      MOV B, A
      
LOOP: MOV A, M
      RLC 
      JC SKIP
      
      RRC
      ADD B
      MOV B, A
      
SKIP: INX H
      DCR C
      JNZ LOOP
      
      MOV A, B
      STA 3070H
      HLT
      
      

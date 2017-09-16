; To add the set of data bytes stored in the memory starting form 2050H. 
; The end of data string is indicated by 00H. 
; Result may be larger than FFH. 
; Display the sum at port 1 and port 2.

      LXI H, 2050H
      XRA A
      MOV C, A
      
LOOP: MOV A, M
      CPI 00H
      JZ END
      
      ADD C
      JNC SKIP
      
      INR B
SKIP: MOV C, A
      INX H
      JMP LOOP
      
END:  MOV A, B
      OUT PORT1
      MOV A, C
      OUT PORT2
      
      HLT

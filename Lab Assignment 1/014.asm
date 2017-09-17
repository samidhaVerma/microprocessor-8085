; To check if the Input string of characters (in ASCII codes) stored at location 2050H to 205FH 
; is equal to a string stored at location 2100H to 210FH (in ASCII codes). 
; If two strings are same, display 1 at Port 1, otherwise 0.


      LXI D, 2050H
      LXI H, 2100H
      MVI C, 10H
      MVI B, 00H

LOOP: LDAX D
      CMP M
      JNZ EXIT
      
      INX H
      INX D
      DCR C
      JNZ LOOP

      MVI B, 01H

EXIT: MOV A, B
      OUT 01H

      HLT

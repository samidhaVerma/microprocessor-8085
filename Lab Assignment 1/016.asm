; To scan a data byte in the memory block of 128 bytes starting from 2501H. 
; Assume that the data byte to be scanned is stored at 2500H. 
; Store the number that how many times the given data byte is found in the memory block, at memory location 4000H
; and also display the data byte and the number at output port 00H and 01H respectively. 


      LXI H, 2500H
      MOV A, M
      MVI C, 80H
      MVI B, 00H
      INX H
      
LOOP: CMP M
      JNZ SKIP
      INR B
SKIP: INX H
      DCR C
      JNZ LOOP
      
      STA 4000H
      OUT 00H
      
      MOV A, B
      OUT 01H
      
      HLT

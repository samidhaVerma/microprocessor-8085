;To perform addition of two Hexadecimal Numbers:
;	9A5B8938H & 8BC34AD1H
; Both the numbers are stored in 3000H and 3051H.


      LXI H, 3000H
      LXI D, 3050H
      MVI C, 04H
      XRA A

LOOP: LDAX D
      ADC M
      MOV M, A
      INX H
      INX D
      DCR C
      JNC LOOP

      HLT



;Data					
;2555H	Value of M1				
;2556H	Value of M2				
;2557H	Value of M3
        
          MVI	A, 98H	
          OUT	03	
	  MVI	A, 9AH	
	  OUT	0B	
START:    MOV   B, A	
          IN 	0A	    ;Input V
          CMP	B 	    ;Check whether V crossed peak
	  JZ	START	
	  IN 	00	    ;Input Im cos phi
	  CMA		
	  SUI	80H	
	  STA	2552H	
	  IN 	00	      ;Input Vdc
	  CMA		
	  SUI	80H	
	  STA   2550H	
	  CALL  DIVISION	     ;M = 1 / Ycos phi
	  LXI	H, 2553H	    ;Stores M
          MOV	B, M	
	  INX	H 	
	  INX	H 	
	  MOV	A, M	     ;M1 in accumulator
	  CMP	B 	
	  JNC   TRIP1	  ;Zone 1 trip
	  INX   H 
	  MOV	A, M	     ;M2 in accumulator
	  CMP	B 	
	  JNC   TRIP2	   ;Zone 2 trip
	  INX   H 
	  MOV	A, M	      ;M3 in accumulator
	  CMP	B 	
	  JNC   TRIP3	    ;Zone 3 trip
	  JMP	START			
					
;Delay subroutine					
TRIP3:	  MVI	C, 06H	      ;For 0.4 sec delay
          JMP	THID	
TRIP2:	  MVI	C, 03H	      ;For 0.2 sec delay
THID:	  MVI	D, FFH	
SEND:	  MVI	E, 33H	
FIRST:	  DCR	E 	
          JNZ	FIRST	
	  DCR	D 	
	  JNZ	SEND	
	  DCR	C 	
	  JNZ	THID	
TRIP1:	  MVI	A, 01H	
          OUT	01	
	  JMP	START
		

;Division subroutine
DIVISION:					
	   LHLD 2550H	
	   LDA	2552H	
	   MOV	C, A	
	   MVI	B, 08H	
DIV:	   DAD	H 	
    	   MOV	A, H	
	   SUB	C 	
	   JC	AHEAD	
	   MOV	H, A	
	   INR	L	
AHEAD:	   DCR	B 	
           JNZ	DIV	
	   SHLD 2553H	;Quotient in 2553
	   RET			 

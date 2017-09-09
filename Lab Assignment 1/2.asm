;to find the largest of three numbers stored in the memory location 2050H, 2051H and 2052H, assuming that all three numbers are unequal.

       mov a, m
       inx h
       cmp m
       jnc skip1
       mov a,m
skip1: inx h
       cmp m
       jnc skip2
       mov a,m 
skip2: out 01h
       hlt

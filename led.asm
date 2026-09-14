
L1:    
    MOV AL, 00101010B 
    mov DX, 2070H
    
    OUT DX, AL    ;goes to PORT A (which is dedicated to seven segment)
    
   
    JMP L1
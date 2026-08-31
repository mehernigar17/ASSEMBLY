   .MODEL SMALL 
.STACK 100H 
 
.DATA 
ARR DW 100 DUP(?)  
MSGMIN DB 0DH,0AH,"MIN = $" 
MSGMAX DB 0DH,0AH,"MAX = $" 
 
MIN DW ? 
 
.CODE 
 
MAIN PROC 
     
    MOV AX,@DATA 
    MOV  DS,AX 
     
    CALL INDEC 
    MOV CX,AX  
    MOV BX,0 
    MOV SI,0 
     
    INPUT:    
    CALL INDEC 
    MOV ARR[SI],AX   
    INC SI 
    INC SI 
    INC BX 
    LOOP INPUT 
     
    MOV SI,0   
    MOV AX,ARR[SI]
    MOV MIN,AX
    MOV CX,BX 
    DEC CX 
    INC SI  
    INC SI 
     
    MINCHECK: 
    MOV AX,ARR[SI] 
    CMP MIN,AX 
    JG  MIN_ 
    
    NEXT:
    INC SI 
    INC SI 
    LOOP MINCHECK 
    JMP OUTPUT
     
    MIN_:  
    MOV CX,ARR[SI]
    MOV MIN,CX
    JMP NEXT  
    
    OUTPUT:
     
    MOV AH,9 
    LEA DX,MSGMIN 
    INT 21H 
     
    MOV AX,MIN 
    CALL OUTDEC 
        
     
    MOV AH,4CH  
    INT 21H 
     
MAIN ENDP    
INCLUDE  INDEC.ASM 
INCLUDE OUTDEC.ASM 
END MA
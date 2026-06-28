.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER LENGTH:$"
MSG1 DB 0DH,0AH,"ENTER  WIDTH :$"
MSG2 DB 0DH,0AH,"PERIMETER :$"  
   L DB ?
   W DB ?
   P DB ?
.CODE                
                            
MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;MSG
    MOV AH,9
    LEA DX,MSG
    INT 21H
    ;INPUT LENGTH
    MOV AH,1
    INT 21H 
    SUB AL,30H
    MOV L,AL
    ;MSG2
    MOV AH,9  
    LEA DX,MSG1
    INT 21H
             
    ;INPUT WIDTH
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV W,AL
    ;MSG2 
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    ;OUTPUT
    MOV AL,L
    MOV BL,W
    ADD AL,BL
    MOV CL,2
    MUL CL
    MOV P,AL
    
    MOV DL,P  
    ADD DL,30H
    MOV AH,2
    INT 21H
    
    
    
    
    MAIN ENDP
END MAIN


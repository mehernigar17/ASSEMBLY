;1^2+2^2+3^2+4^2+5^2=557
.MODEL SMALL
.STACK 100H

.DATA
N DW ?
SUM DW ?
MSG DB 0AH,0DH,"SUM:$:"

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INDEC
    MOV N,AX
    MOV SUM,0
    MOV CX,N
    
    L1:
     CALL INDEC  
     MUL AX
     ADD SUM,AX
     LOOP L1
    
    MOV AX,SUM
    
    PUSH AX  
    
    MOV AH,9
    LEA DX,MSG
    INT 21H   
    
    POP AX
    
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
    
    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
    
    
    

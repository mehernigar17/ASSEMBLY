; AVERAGE

.MODEL SMALL
.STACK 100H

.DATA
MSG DB 0AH,04H,"AVERAGE:$"  
N DW ?
SUM DW ?

.CODE
      
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INDEC
    MOV N,AX
    
    MOV CX,N
    MOV SUM,0
    
    L1:
   
    CALL INDEC 
    
    ADD SUM,AX
    LOOP L1
    
    MOV AX,SUM
    MOV DX,0
    MOV BX,N
    DIV BX
    
    PUSH AX  
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    POP AX
    CALL OUTDEC
    
    
    MOV AH, 4CH
    INT 21H
       
    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM   
END MAIN




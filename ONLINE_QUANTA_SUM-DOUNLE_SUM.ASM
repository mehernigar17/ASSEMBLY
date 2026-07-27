.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB "Enter number of elements: $"
MSG2 DB 13,10,"Enter numbers: $"
SUMMSG DB 13,10,"Sum = $"
DOUBLEMSG DB 13,10,"Double = $"

SUM DB 0
N DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;INPUT N
    
     MOV AH,09H
     LEA DX,MSG1 
                 
     MOV AH,01H
     SUB AL,'0'
     INT 21H
     MOV N,AL
     
     ;INPUT NUMBERS   
     MOV AH,09H
     LEA DX,MSG2
     MOV CH,0
     MOV CL,N
     MOV SUM,0
     
     L1:
     MOV AH,01
     INT 21H 
     CMP AL,''
     JE L1
     SUB AL,30H
     ADD SUM,AL
     LOOP L1
    
    
    
    
    
    ; Print Sum
    LEA DX,SUMMSG
    MOV AH,09H
    INT 21H

    XOR AH,AH
    MOV AL,SUM
    MOV BL,10
    DIV BL

    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

    MOV AL,AH
    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

    ; Print Double
    LEA DX,DOUBLEMSG
    MOV AH,09H
    INT 21H

    XOR AH,AH
    MOV AL,SUM
    ADD AL,SUM
    MOV BL,10
    DIV BL

    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

    MOV AL,AH
    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
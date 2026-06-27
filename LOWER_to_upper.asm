.MODEL SMALL
.STACK 100H

.DATA
MSG  DB "ENTER A LOWERCASE LETTER: $"
MSG2 DB 0DH,0AH,"CORRESPONDING UPPERCASE LETTER: $"

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    ; Print first message
    MOV AH,9
    LEA DX,MSG
    INT 21H

    ; Input a lowercase letter
    MOV AH,1
    INT 21H
    MOV BL,AL

    ; Print second message
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    ; Print uppercase letter
    MOV AH,2 
    
    ; Convert to uppercase
   
    SUB BL,20H

    MOV DL,BL
    INT 21H

    ; Exit
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN


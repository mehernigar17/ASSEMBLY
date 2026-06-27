.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB "ENTER THE VALUE OF B: $"
    MSG2 DB 0DH,0AH,"VALUE OF C = $"

    A DB 4
    B DB ?
    C DB 2

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    ; Display first message
    MOV AH,9
    LEA DX,MSG
    INT 21H

    ; Input B
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV B,AL

    ; C = (A+B) - 2B + 3C

    ; (A+B)
    MOV AL,A
    ADD AL,B
    MOV BH,AL

    ; 2B
    MOV AL,B
    MOV BL,2
    MUL BL
    MOV CL,AL

    ; 3C
    MOV AL,C
    MOV BL,3
    MUL BL
    MOV CH,AL

    ; Final calculation
    MOV AL,BH
    SUB AL,CL
    ADD AL,CH

    MOV C,AL

    ; Display result message
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    ; Print C
    MOV DL,C
    ADD DL,30H
    MOV AH,2
    INT 21H

    ; Exit program
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
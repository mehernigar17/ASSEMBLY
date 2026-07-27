.MODEL SMALL
.STACK 100H

.DATA
MSG DB "Masked value: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Print message first
    LEA DX,MSG
    MOV AH,09H
    INT 21H

    ; NOW load DH (important)
    MOV DH,10000000B

    ; Complement odd bits
    XOR DH,10101010B

    ; Copy result
    MOV BL,DH
    MOV CX,8

PRINT:
    SHL BL,1
    JC ONE

    MOV DL,'0'
    MOV AH,02H
    INT 21H
    JMP NEXT

ONE:
    MOV DL,'1'
    MOV AH,02H
    INT 21H

NEXT:
    LOOP PRINT

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
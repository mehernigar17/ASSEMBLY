.MODEL SMALL
.STACK 100H
.DATA
ARR DB 1,2,3,4,5,6
NEW_LINE DB 0AH,0DH,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV SI,0
    MOV DI,5
    MOV CX,3
    XOR BX,BX

    REVERSE:
        MOV BL,ARR[SI]
        MOV BH,ARR[DI]
        MOV ARR[SI],BH
        MOV ARR[DI],BL
        INC SI
        DEC DI
    LOOP REVERSE

    ;---------- PRINT REVERSED ARRAY (LEA style) ----------
    LEA SI, ARR
    MOV CX, 6
    XOR AX, AX
    PRINT:   
     XOR AH, AH 
        MOV AL, [SI]
        CALL OUTDEC
        INC SI

        MOV AH, 9
        LEA DX, NEW_LINE
        INT 21H
    LOOP PRINT

END_:
    MOV AH, 4CH
    INT 21H    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
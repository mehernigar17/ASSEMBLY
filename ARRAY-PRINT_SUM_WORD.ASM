.MODEL SMALL
.STACK 100H
.DATA
NEW_LINE DB 0AH,0DH,'$' 
W DW 1,2,3,4,5   
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ;---------- PRINT EACH ELEMENT ----------
    LEA SI, W
    XOR AX, AX
    MOV CX, 5
    PRINT:    
        MOV AX, [SI]
        CALL OUTDEC

        MOV AH, 9
        LEA DX, NEW_LINE
        INT 21H

        ADD SI, 2
    LOOP PRINT

    ;---------- SUM (LEA SI + [SI] style) ----------
    LEA SI, W
    MOV CX, 5
    XOR AX, AX
    SUM_:
        ADD AX, [SI]
        ADD SI, 2
    LOOP SUM_

    CALL OUTDEC

END_:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
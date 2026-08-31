.MODEL SMALL
.STACK 100H

.DATA
COUNT DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BL, 253D
    XOR BL, 10101010B
    
    MOV CX, 8
    
    COUNTER:
        ROR BL,1
        JC _ONE
        JMP _SKIP
    
    _ONE:
        INC COUNT       
    
    _SKIP:
        LOOP COUNTER
        
        
    CMP COUNT, 4
    JL FOR_FOUR
    SHR COUNT,1
    JMP _END
    
    FOR_FOUR:
        MOV AL,COUNT
        SHL COUNT,2
        ADD COUNT, AL
        ADD COUNT, AL
        
    _END:
        MOV AH, 4CH
        INT 21H
    
    
MAIN ENDP
END MAIN
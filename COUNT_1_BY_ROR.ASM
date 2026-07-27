.MODEL SMALL
.STACK 100H 

.DATA
 CNT DB 0
.CODE
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX
   
     MOV BX,320
     MOV CX,16
     PRINT:
     ROR BL,1
     JC PRINT_ONE  
     
      
    JMP  SKIP
     
     PRINT_ONE: 
     INC CNT
    
     SKIP:
     LOOP PRINT
     
        MOV AH,2
        MOV DL,CNT
        ADD DL,30H
        INT 21H
   
   
   
      MOV AH,4CH
      INT 21H
      
   
    MAIN ENDP
END MAIN

    

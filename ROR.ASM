.MODEL SMALL
.STACK 100H
.CODE
.DATA

MAIN PROC
   MOV AX,@DATA
   MOV DS,AX
   
     MOV BL,68
     MOV CX,8
     PRINT:
     ROR BL,1
     JC PRINT_ONE
     
     MOV AH,2
     MOV DL,'0'
     INT 21H  
    JMP  SKIP
     
     PRINT_ONE:
     MOV AH,2
     MOV DL,'1'
     INT 21H
     SKIP:
     LOOP PRINT
     
   
   
   
   
      MOV AH,4CH
      INT 21H
      
   
    MAIN ENDP
END MAIN

    



   .MODEL SMALL
   .STACK 100H
   .DATA
   VAR1 DB 3
   .CODE
   MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,2
    MUL VAR1
      ;PRODUCT =AX
    
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
   END MAIN


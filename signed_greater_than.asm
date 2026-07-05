.MODEL SMALL
.STACK 100H
.DATA
.CODE
 MAIN PROC 
    MOV AX,5
    MOV BX,4
    MOV CX,AX
    CMP BX,CX
    JLE NEXT 
    MOV CX,BX
    NEXT:
          
     MOV AH,4CH
     INT 21H
     
    
    MAIN ENDP
 END MAIN


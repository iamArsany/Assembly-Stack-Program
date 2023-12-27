.model small
.data 

HEADER db "                           %%%%%%%    STACK   %%%%%%%             ","$"

NEWLINE DB 13,10,"$"
C_PUSH DB " 1 -PUSH()","$"
C_POP  DB " 2 -POP()","$"
C_PEEK DB " 3 -PEEK()","$"
C_SIZE DB " 4 -SIZE()","$"
C_ISEMPTY DB " 5 -IS_EMPTY()","$"
CHOICE_MSG DB "YOUR CHOICE: ","$"

PUSH_MSG DB"ENTER YOUR ANSWER (1 CHAR): ","$"
TRUE_MSG DB "TRUE ","$"
FALSE_MSG DB"FALSE","$"
EMPTY_MSG DB " THE STACK IS EMPTY ","$"
FALSE_INPUT DB "PLEASE CHOOSE FROM OPTIONS : ","$"
AGAIN_MSG1 DB "1 -AGAIN","$"
AGAIN_MSG2 DB "2 -EXIT","$"
VAR DB '1',"$"

.code
    
    MAIN PROC FAR
        
        .STARTUP
        
        ;DISPLAY HEADER
        LEA DX,HEADER
        CALL PRINT
        MOV CX,0
        MOV BX,0
        
        ;DISPLAY THE OPTIONS
    PROGRAM_START:
 
        CALL PRINT_OPTIONS
        
        
    READ_OPTION:
        ; TAKE CHAR
        CALL INPUT_CHAR
        
        CMP AL,'1'
        JL FALSE_OPTION
        CMP AL,'5'
        JLE EXECUTE_OPTION
        
    FALSE_OPTION:
        LEA DX,FALSE_INPUT
        CALL PRINT
        JMP READ_OPTION
        
    EXECUTE_OPTION:
        
        CMP AL,'1'
        JE OPTION_ONE
        CMP AL,'2'
        JE OPTION_TWO
        CMP AL,'3'
        JE OPTION_THREE
        CMP AL,'4'
        JE OPTION_FOUR
        JMP OPTION_FIVE
        
    OPTION_ONE:
        CALL S_PUSH
        JMP PLAY_AGAIN
    OPTION_TWO:
        CALL S_POP
        JMP PLAY_AGAIN
    OPTION_THREE:
        CALL S_PEEK
        JMP PLAY_AGAIN
    OPTION_FOUR:
        CALL S_SIZE
        JMP PLAY_AGAIN
    OPTION_FIVE:
        CALL S_ISEMPTY
        JMP PLAY_AGAIN
        
        
    PLAY_AGAIN:
        LEA DX,AGAIN_MSG1
        CALL PRINT
        
        LEA DX,AGAIN_MSG2
        CALL PRINT
        LEA DX,CHOICE_MSG
        CALL PRINT
        
    VALID_CHOICE_LABEL:
        CALL INPUT_CHAR
        
        CMP AL,'1'
        JE PROGRAM_START
        CMP AL,'2'
        JE EXIT_LABEL
        LEA DX,FALSE_INPUT
        CALL PRINT
        JMP VALID_CHOICE_LABEL
        
        
        
        
    
        
      
        
        
        
        ;DISPLAY CHAR
        CALL DISPLAY_CHAR
        
        
        
    EXIT_LABEL:
        .EXIT
        
    MAIN ENDP
    
        INPUT_CHAR PROC NEAR
        MOV AH,01H
        INT 21H
        RET
        INPUT_CHAR ENDP
        
        DISPLAY_CHAR PROC NEAR
        MOV DL,AL
        MOV AH,02H
        INT 21H
        RET
        DISPLAY_CHAR ENDP
        
        PRINT PROC NEAR
        MOV SI,DX
            
            ;PRINT NEWLINE
            LEA DX,NEWLINE
            MOV AH,09H
            INT 21H
            
            ;PRINT THE OPTION
            MOV DX,SI
            MOV AH,09H
            INT 21H
            
            RET
            
        PRINT ENDP
        
        NEWLINE_PROC PROC NEAR
            LEA DX,NEWLINE
            MOV AH,09H
            INT 21H
            RET
        NEWLINE_PROC ENDP
        
        PRINT_OPTIONS proc near
            
            CALL NEWLINE_PROC
            
            LEA DX,C_PUSH
            CALL PRINT
            
            LEA DX,C_POP
            CALL PRINT
            
            LEA DX,C_PEEK
            CALL PRINT
            
            LEA DX,C_SIZE
            CALL PRINT
            
            LEA DX,C_ISEMPTY
            CALL PRINT
            
            CALL NEWLINE_PROC
            CALL NEWLINE_PROC
            
            LEA DX,CHOICE_MSG
            CALL PRINT
            
            RET 
        PRINT_OPTIONS ENDP
        
        S_PUSH PROC NEAR
            LEA DX,PUSH_MSG
            CALL PRINT
            
            ;HERE GO THE LOGIC
            INC CX
            CALL ADD_EIGHT
            CALL INPUT_CHAR
            MOV [VAR+BX],AL
            MOV [VAR+BX+1H],"$"

            RET
            
        S_PUSH ENDP
        
        S_POP PROC NEAR
            ;CHECK IF IT'S EMPTY
            CMP CX,0
            JE EMPTY_LABEL
            
            
            LEA DX,VAR+BX
            CALL PRINT
            
            ;ZERO ITS PLACE
            MOV [VAR+BX],0000H
            DEC CX
            CALL SUB_EIGHT
            RET
            
        EMPTY_LABEL:
            
            LEA DX,EMPTY_MSG
            CALL PRINT 
            CALL NEWLINE_PROC
            RET
        
        S_POP ENDP
        
        S_PEEK PROC NEAR
            CMP CX,0
            JE EMPTY_LAB
            LEA DX,VAR+BX
            CALL PRINT
            CALL NEWLINE_PROC
            RET
            
        EMPTY_LAB:
             LEA DX,EMPTY_MSG
             CALL PRINT 
             CALL NEWLINE_PROC
             RET
            
        S_PEEK ENDP
        
        S_SIZE PROC NEAR
        CALL NEWLINE_PROC
        
        ;CLONE BX , CX TO USE THEM
        MOV SI,BX
        MOV DI,CX
        
        MOV AX,CX
        XOR DX,DX
        MOV CX,10
        DIV CX
        
        
        MOV BX,DX
        MOV DX,AX
        ADD DX,'0'
        
        MOV AH,02H
        INT 21H
        MOV DX,BX
        ADD DX,'0'
        MOV AH,02H
        INT 21H
        
        ;MOVE BACK CX,BX VALUES
        MOV BX,SI
        MOV CX,DI
      
        
        RET
        S_SIZE ENDP
        
        S_ISEMPTY PROC NEAR
        
        CMP CX,0
        JE TRUE_LABEL
        
    FALSE_LABEL:
        LEA DX,FALSE_MSG
        CALL PRINT
        RET
    TRUE_LABEL:
        LEA DX,TRUE_MSG
        CALL PRINT
        RET
        
        S_ISEMPTY ENDP

         ADD_EIGHT PROC
         ADD BX,8
            RET
         ADD_EIGHT ENDP
         
            
         SUB_EIGHT PROC
         SUB BX,8
            RET
         SUB_EIGHT ENDP
    
    
END MAIN
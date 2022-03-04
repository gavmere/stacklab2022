.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R5, STACKADDRESS
;push_val(4) pushes the value 4 onto the stack [4]
AND R4, R4, #0
ADD R4, R4, #4
LD R6, PUSH_VALR4
JSRR R6

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R4, R4, #0
ADD R4, R4, #3
LD R6, PUSH_VALR4
JSRR R6


;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R4, R4, #0
ADD R4, R4, #2
LD R6, PUSH_VALR4
JSRR R6


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R6, ADD_VAL
JSRR R6


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR R6



;move the top value of the stack into r4
HALT
STACKADDRESS    .FILL   xFE00
PUSH_VALR4  .FILL x3400
ADD_VAL  .FILL x3800





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
    ST R0,  BackupR03400 
    ST R1,  BackupR13400 
    ST R2,  BackupR23400
    ST R3,  BackupR33400 
    ST R4,  BackupR43400 
    ST R6,  BackupR63400 
    ST R7,  BackupR73400 
    ;algo
    ADD R5, R5, #-1
    STR R4, R5, #0
    ;restore
    LD R0, BackupR03400 
    LD  R1, BackupR13400 
    LD R2,  BackupR23400
    LD  R3, BackupR33400 
    LD  R4, BackupR43400 
    LD  R6, BackupR63400 
    LD  R7, BackupR73400 
	;return
	RET
    ;data
				 
    BackupR03400 .BLKW #1
    BackupR13400 .BLKW #1
    BackupR23400 .BLKW #1
    BackupR33400 .BLKW #1
    BackupR43400 .BLKW #1
    BackupR63400 .BLKW #1
    BackupR73400 .BLKW #1



.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    ST R0,  BackupR03800 
    ST R1,  BackupR13800 
    ST R2,  BackupR23800
    ST R3,  BackupR33800 
    ST R4,  BackupR43800 
    ST R6,  BackupR63800 
    ST R7,  BackupR73800 
    ;algo
    LDR R1, R5, #0
    ADD R5, R5, #1
    LDR R2, R5, #0
    ADD R1, R1, R2
    STR R1, R5, #0
    
    ;restore
    LD R0, BackupR03800 
    LD  R1, BackupR13800 
    LD R2,  BackupR23800
    LD  R3, BackupR33800 
    LD  R4, BackupR43800 
    LD  R6, BackupR63800 
    LD  R7, BackupR73800 
	;return
	RET
    ;data
				 
    BackupR03800 .BLKW #1
    BackupR13800 .BLKW #1
    BackupR23800 .BLKW #1
    BackupR33800 .BLKW #1
    BackupR43800 .BLKW #1
    BackupR63800 .BLKW #1
    BackupR73800 .BLKW #1


.end





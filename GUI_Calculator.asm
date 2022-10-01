


INCLUDE EMU8086.INC     ;Including Library

org 100h

.data       ;Data Segment

msg_intro db ' 1. Addition', 0dh,0ah, ' 2. Subtration', 0dh,0ah, ' 3. Multiplication', 0dh,0ah, ' 4. Division', 0dh,0ah, ' 5. Modulus', 0dh,0ah,' 6. Negation', 0dh,0ah, ' 7. Square', 0dh,0ah, ' 8. Cube', 0dh,0ah, ' 9. OR', 0dh,0ah, ' 0. Exit', 0dh,0ah, '$'

msg_A db 'The SUM of two Numbers = $', 0dh,0ah       ;Printing Strings
msg_S db 'The SUBTRACTION of two Numbers = $', 0dh,0ah
msg_M db 'The MULTIPLICATION of two Numbers = $', 0dh,0ah
msg_D db 'The DIVISION of two Numbers = $', 0dh,0ah
msg_MD db 'The MODULUS of Two Numbers = $', 0dh,0ah  ;0DH carriage return
msg_N db 'The NEG value of Number = $', 0dh,0ah      ;OAH line feed
msg_SQ db 'The SQUARE of Number = $', 0dh,0ah
msg_CB db 'The CUBE of Number = $', 0dh,0ah  
msg_OR db 'The OR operation of two Number = $', 0dh,0ah

cont db 10,13,'Do you want to Use Again ? $'   ;Hexadecimal equivalents of 10 and 13
bye db '       **** Thank You !!!  :) **** $'
      
val1 dw ?       ;Uninitialize
val2 dw ?       ;Uninitialize
res dw ?
agn dw ?

.code       ;Code Segment
MAIN PROC
    
MOV AX, @data
MOV DS, AX


Start:          ;Start Loop 

MOV AH, 0       ;AH = 0
MOV AL, 13H
INT 10H         ;Int 10h / AH = 0 - sets video mode

MOV AH, 0CH
MOV AL, 11      ;AL = Pixel Color
MOV CX, 100     ;CX = Column Number
MOV DX, 20      ;DX = Row Number
INT 10H         ;Sets Graphic Video Mode

MOV BL, 165     ;165 pix Length of Line1
lineone:        ;Line Func
INT 10H
INC CX          ;Incrementing Column No.
DEC BL          ;Decrementing BL 
JNZ lineone     ;Runs until BL = 0

MOV BL, 20      ;20 pix Length of Line2
linetwo:
INT 10H
DEC DX          ;Decreasing Row
DEC BL          ;Decrementing Length
JNZ linetwo


MOV BL, 165     ;165 pix Length of Line3
linethree:
INT 10H
DEC CX          ;Decrementing Column No.
DEC BL
JNZ linethree

MOV BL, 20      ;20 pix Length of Line4
linefour:
INT 10H
INC DX          ;Increasing Row 
DEC BL
JNZ linefour


printn
print '             **** CALCULATOR ****    '  
printn      ;New Line
 
printn
MOV AH,9
MOV DX, OFFSET msg_intro
INT 21h                                          

print 'Select Any Option : '
CALL scan_num
printn
printn



CMP CX, 0
JE _Bye         ;Jumps to Exit Func if input is equal to 0


CMP CX, 1
JE Addition     ;Jumps to Addition if input is equal to 1


CMP CX, 2
JE Subtraction     ;Jumps to Substraction if input is equal to 2
   
   
CMP CX, 3
JE Multiplication     ;Jumps to Multiplication if input is equal to 3


CMP CX, 4
JE Division     ;Jumps to Division if input is equal to 4


CMP CX, 5
JE Modulus     ;Jumps to Modulus if input is equal to 5


CMP CX, 6
JE Negation     ;Jumps to Negation if input is equal to 6


CMP CX, 7
JE Square     ;Jumps to Square if input is equal to 7


CMP CX, 8 
JE Cube     ;Jumps to Cube if input is equal to 8


CMP CX, 9 
JE _OR     ;Jumps to OR Func if input is equal to 8
                
                
                ;FUNCTIONS OF OPERATIONS

Addition:       ;Addition Func

print '     ****--Addition--****'
printn  
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
ADD AX, val2        ;Adding AX to val2
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_A    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg
                        
JMP Con                 ;Goes to Con Func               


Subtraction:        ;Subtraction Func

print '     ****--Subtraction--****' 
printn   
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
SUB AX, val2        ;Subtracting AX with val2
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_S    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func             


Multiplication:        ;Multiplication Func

print '     ****--Multiplication--****'
printn 
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
MUL val2            ;Multiplying AX with val2
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_M    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func


Division:        ;Division Func

print '     ****--Division--****' 
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1 
MOV AX, val1        ;Moving val1 to AX reg  

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2    
MOV BX, val2
printn

CMP BX, 0       ;if bx = 0
JE Error

MOV DX, 0           ;Moving 0 in DX to avoid overflow

DIV BX            ;Dividing AX with BX
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_D    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func

        
Modulus:        ;Modulus Func

print '     ****--Modulus--****' 
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1 
MOV AX, val1        ;Moving val1 to AX reg  

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2    
MOV BX, val2
printn

MOV DX, 0           ;Moving 0 in DX to avoid overflow

DIV BX            ;Dividing AX with BX
MOV res, DX         ;Storing DX (Remainder) in res 

printn
MOV AH,9
MOV DX, OFFSET msg_MD    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func


Negation:        ;Negation Func

print '     ****--Negation--****'
printn
printn
print 'Enter Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

MOV AX, val1        ;Moving val1 to AX reg
NEG AX              ;Taking Neg of AX
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_N    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res             ;Moving res to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func


Square:         ;Square Func

print '     ****--Square--****'  
printn 
printn
print 'Enter Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

MOV AX, val1        ;Moving val1 to AX reg
MUL AX              ;Taking Neg of AX
MOV res, AX         ;Storing AX in res

printn
MOV AH,9
MOV DX, OFFSET msg_SQ   ;Displaying Message
INT 21h

MOV AX, res
CALL print_num          ;Printing AX reg

JMP Con                 ;Jumps to Con Func

  
Cube:             ;Cube Func               

print '     ****--Cube--****'
printn
printn
print 'Enter Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

MOV AX, val1
MUL val1  
MUL val1
MOV res, AX

printn
MOV AH,9
MOV DX, OFFSET msg_CB    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res
CALL print_num

JMP Con             ;Jumps to Con Func
        

_OR:            ;Binary OR Func

print '     ****--Binary OR--****'
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1
OR AX, val2
MOV res, AX

printn
MOV AH,9
MOV DX, OFFSET msg_OR    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, res
CALL print_num          ;Prints on screen

JMP Con             ;Jumps to Con Func

Error:      ;Overflow Error

printn
print 'Cannot be divided by 0. ' 
print 'Undefined'
printn
JMP Con


Con:            ;Continue Func
 
printn
MOV AH,9
MOV DX, OFFSET cont    ;Displaying Message
INT 21h                 ;Calling Interrupt

printn
print '(Yes = 1 / No = 0) : '
CALL scan_num           ;Enter 1 for Yes and 0 for No
MOV agn, CX
printn      ;New Line
printn

CMP agn, 1
JE Start            ;Jumps to Start Func if input is equal to 1                    

CMP agn, 0
JE _Bye             ;Jumps to Bye Func if input is equal to 0
printn


_Bye:       ;EXIT Func

MOV AH, 0       ;AH = 0
MOV AL, 13H
INT 10H         ;Int 10h / AH = 0 - sets video mode

MOV AH, 0CH
MOV AL, 11      ;AL = Pixel Color
MOV CX, 60     ;CX = Column Number
MOV DX, 20      ;DX = Row Number
INT 10H         ;Sets Graphic Video Mode

MOV BL, 200     ;200 Length of Line1
firstline:      ;Line Func
INT 10H
INC CX          ;Incrementing Column No.
DEC BL          ;Decrementing BL 
JNZ firstline   ;Runs until BL = 0

MOV BL, 20      ;20 Lenght of Line2
secondline:
INT 10H
DEC DX          ;Decreasing Row
DEC BL
JNZ secondline

MOV BL, 200     ;200 Length of Line3
thirdline:
INT 10H
DEC CX          ;Decrementing Column No.
DEC BL
JNZ thirdline

MOV BL, 20      ;20 pix Length of Line4
fourthline:
INT 10H
INC DX          ;Increasing Row
DEC BL
JNZ fourthline


MOV AH, 0CH
MOV AL, 12      ;AL = Pixel Color
MOV CX, 0     ;CX = Column Number
MOV DX, 30      ;DX = Row Number
INT 10H         ;Sets Graphic Video Mode

MOV BX, 320     ;320 Length of Line1
line01:      ;Line Func
INT 10H
INC CX          ;Incrementing Column No.
DEC BX          ;Decrementing BL 
JNZ line01   ;Runs until BL = 0


MOV AH, 0CH
MOV AL, 10      ;AL = Pixel Color
MOV CX, 0     ;CX = Column Number
MOV DX, 40      ;DX = Row Number
INT 10H         ;Sets Graphic Video Mode

MOV BX, 320     ;320 Length of Line1
line02:      ;Line Func
INT 10H
INC CX          ;Incrementing Column No.
DEC BX          ;Decrementing BL 
JNZ line02   ;Runs until BL = 0


MOV AH, 0CH
MOV AL, 9      ;AL = Pixel Color
MOV CX, 0     ;CX = Column Number
MOV DX, 50      ;DX = Row Number
INT 10H         ;Sets Graphic Video Mode

MOV BX, 320     ;320 Length of Line1
line03:      ;Line Func
INT 10H
INC CX          ;Incrementing Column No.
DEC BX          ;Decrementing BL 
JNZ line03   ;Runs until BL = 0

printn
MOV AH,9
MOV DX, OFFSET bye    ;Displaying Message
INT 21h 


MAIN ENDP       ;End Main Procedure


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


END main          ;End of program

HLT         ;Halting                                            
ret         ;Return


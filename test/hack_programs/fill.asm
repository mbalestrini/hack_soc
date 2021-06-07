@0
D=A
@R3
M=D


(LOOP)

@SCREEN
D=A
@R3
D=D+M
@R4
M=D

@21845
D=0
@R4
A=M
M=D

@R3
D=M
MD=D+1

@8192
D=A-D
@FINISH
D;JEQ

@LOOP
0;JMP

(FINISH)
@FINISH
0;JMP

@0
@0
@0
@0
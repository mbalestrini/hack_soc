(DEBUG_WRITING)
@4
D=A
@24576
M=D

(WRITE)
@16383
D=A
@0
M=D
(LOOP_WRITE)
@0
MD=M+1
A=M
M=D
@16390
D=A-D
@LOOP_WRITE
D;JGE

(DEBUG_READING)
@8
D=A
@24576
M=D


(READ)
@16384
D=A
@0
M=D
(LOOP_READ)
@0
AD=M
D=M-D
@CHECK_ERROR
D;JNE
@0
MD=M+1
@16390
D=A-D
@LOOP_READ
D;JGE

(CHECK_OK)
@1
D=A
@24576
M=D

@FINISH_LOOP
0;JMP

(CHECK_ERROR)
@2
D=A
@24576
M=D




(FINISH_LOOP)
@FINISH_LOOP
0;JMP





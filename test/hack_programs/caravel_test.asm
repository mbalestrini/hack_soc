// Set first word of the screen to 0x5555
@21485
D=A
@16384
M=D

// Set Memory[4] = 0x5555
@4
M=D

// Read Keyboard and store value on Memory[5]
@24576
D=M
@5
M=D


// Loop forever incrementing Memory[6]=Memory[6]+1
@6
M=0
(LOOP)
@6
M=M+1
@LOOP
0;JMP
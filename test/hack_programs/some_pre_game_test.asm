// Init jumpStack address
// jumpStack = 5
@5
D=A
@jumpStack
M=D

// jumpStackOffset = 0
@jumpStackOffset
M=0


// GAME INIT
@3200
D=A
@player_pos
M=D


(GAME_LOOP)

	// CLEAR_SCREEN call
	@CLEAR_SCREEN
		D=A
		@R0
		M=D

		@T1
		D=A
		@R1
		M=D

		@CALL_FUNC
		0;JMP
	(T1)

	// DRAW_OBJ call
	@DRAW_OBJ
		D=A
		@R0
		M=D

		@T2
		D=A
		@R1
		M=D

		@CALL_FUNC
		0;JMP
	(T2)


	(WAIT_INPUT)
	@KBD
	D=M
	@WAIT_INPUT
	D;JLE
	
	// HANDLE_INPUT
	@130
	D=A
	@KBD
	D=D-M
	@MOVE_LEFT
	D;JEQ
		@player_pos
		M=M+1		
		@END_INPUT
		0;JMP

	(MOVE_LEFT)
		@player_pos
		M=M-1
		
		

	(END_INPUT)

	
@GAME_LOOP
0;JMP





(END)
@END
0;JMP




(CALL_FUNC)
//	input	function address (R0), return to address (R1)
//	usa un offset set callbacks addresses
//	todas las funciones terminan con un jump a RETURN
	
//	Mem[jumpStack + jumpStackOffset] = R1 (return to address)
	@jumpStack
	D=M
	@jumpStackOffset
	D=D+M
	@currentStackAddr
	M=D
	
	@R1
	D=M
	@currentStackAddr
	A=M
	M=D
	
	//jumpStackOffset+=1
	@jumpStackOffset
	M=M+1
	
	// Goto Function	
	@R0
	A=M
	0;JMP
	
	(RETURN)
	//jumpStackOffset-=1
	@jumpStackOffset
	M=M-1
	
	@jumpStack
	D=M
	@jumpStackOffset
	A=D+M
	A=M
	0;JMP
	



(DRAW_OBJ)
	@SCREEN
	D=A
	@player_pos
	A=D+M
	D=A
	M=0
	
	@32
	A=D+A
	D=A
	M=0

	@32
	A=D+A
	D=A
	M=0

	@32
	A=D+A
	D=A
	M=0

	@32
	A=D+A
	D=A
	M=0
	
	
	
	(END_DRAW_OBJ)
	@RETURN
	0;JMP


(CLEAR_SCREEN)
	@color
	M=-1
	
	// Fill screen with @color

	(BEGIN_FILL)

		// screenIdx = SCREEN
		@SCREEN
		D=A
		@screenIdx
		M=D

		// i=8192
		@8192
		D=A
		@i
		M=D

		(FILL_LOOP)
			// IF i<0 GOTO END_FILL
			@END_FILL 
			D;JLT

			// MEM[screenIdx] = color
			@color
			D=M
			@screenIdx
			A=M
			M=D

			// screenIdx+1
			D=A+1
			@screenIdx
			M=D

			// i=i-1
			@i
			MD=M-1

		@FILL_LOOP
		0;JMP
	
(END_FILL)
@RETURN
0;JMP

		
		
		
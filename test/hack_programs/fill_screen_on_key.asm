// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


@21845 
D=A
@key_press_color
M=D


(CHECK_KEYBOARD)
@KBD
D=M

// IF KBD!=0 GOTO ANY_KEY_PRESSED
@ANY_KEY_PRESSED
D;JNE  
	
	// Screen should be white
	@color
	D=M

	// IF previous color was already white (0), GOTO CHECK_KEYBOARD
	@CHECK_KEYBOARD 
	D;JEQ
	
	// else, set color to white and fill screen
	@color
	M=0
	
	@BEGIN_FILL
	0;JMP

(ANY_KEY_PRESSED)
	
	// Screen should be black
	@color
	D=M
	
	// IF previous color was not white (!=0), GOTO CHECK_KEYBOARD
	@CHECK_KEYBOARD 
	D;JNE
	
	// else, set color to @key_press_color and fill screen
	@key_press_color
	D=M

	
	@color
	M=D
	
	@BEGIN_FILL
	0;JMP
	

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

		// MEM[screenIdx] =  color		
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

@CHECK_KEYBOARD
0;JMP



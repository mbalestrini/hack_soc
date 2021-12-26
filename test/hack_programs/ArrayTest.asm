// ............................................
// program: OS_0.asm
// ............................................

	@256		// bootstrap code
	D=A
	@SP
	M=D
	@Sys.init
	D=A
	@R13
	M=D
	D=0
	@R14
	M=D
	@Sys.init_RETURN_0		// global call
	D=A
(GLOBAL_CALL)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THAT
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R14
	D=M
	@5
	D=D+A
	@SP
	D=M-D
	@ARG
	M=D
	@SP
	D=M
	@LCL
	M=D
	@R13
	A=M
	0;JMP
(Sys.init_RETURN_0)
(BOOTSTRAP_OS_0$GUARD_LOOP)
	@BOOTSTRAP_OS_0$GUARD_LOOP
	0;JMP

// ............................................
// module: Array
// from file: Array.vm
// ............................................

	@SKIP_GLOBAL_FUNCTIONS		// global functions
	0;JMP
(GLOBAL_EQ)
	@R15
	M=D
	@SP
	AM=M-1
	D=M
	@SP
	AM=M-1
	D=M-D
	@JUMP_EQ
	D;JEQ
	D=1
(JUMP_EQ)
	D=D-1
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R15
	A=M
	0;JMP
(GLOBAL_GT)
	@R15
	M=D
	@SP
	AM=M-1
	D=M
	@SP
	AM=M-1
	D=M-D
	@JUMP_GT
	D;JGT
	D=0
	@JUMP_GT_END
	0; JMP
(JUMP_GT)
	D=-1
(JUMP_GT_END)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R15
	A=M
	0;JMP
(GLOBAL_LT)
	@R15
	M=D
	@SP
	AM=M-1
	D=M
	@SP
	AM=M-1
	D=M-D
	@JUMP_LT
	D;JLT
	D=0
	@JUMP_LT_END
	0; JMP
(JUMP_LT)
	D=-1
(JUMP_LT_END)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R15
	A=M
	0;JMP
(SKIP_GLOBAL_FUNCTIONS)
(Array.new)		// function Array.new 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_0		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_0)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Array.new$IF_TRUE0
	D;JNE
	@Array.new$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Array.new$IF_TRUE0)		// label IF_TRUE0
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_1
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_1)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Array.new$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.alloc		// call Memory.alloc 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Memory.alloc_RETURN_2
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.alloc_RETURN_2)
(GLOBAL_RETURN)		// global return
	@LCL		// global return
	D=M
	@R13
	M=D
	@5
	A=D-A
	D=M
	@R14
	M=D
	@SP
	AM=M-1
	D=M
	@ARG
	A=M
	M=D
	D=A
	@SP
	M=D+1
	@R13
	AM=M-1
	D=M
	@THAT
	M=D
	@R13
	AM=M-1
	D=M
	@THIS
	M=D
	@R13
	AM=M-1
	D=M
	@ARG
	M=D
	@R13
	AM=M-1
	D=M
	@LCL
	M=D
	@R14
	A=M
	0;JMP
(Array.dispose)		// function Array.dispose 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@R3		// push pointer 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.deAlloc		// call Memory.deAlloc 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Memory.deAlloc_RETURN_3
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.deAlloc_RETURN_3)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Keyboard
// from file: Keyboard.vm
// ............................................

(Keyboard.init)		// function Keyboard.init 0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Keyboard.keyPressed)		// function Keyboard.keyPressed 0
	@24576		// push constant 24576
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.peek		// call Memory.peek 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Memory.peek_RETURN_4
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.peek_RETURN_4)
	@GLOBAL_RETURN		// return
	0;JMP
(Keyboard.readChar)		// function Keyboard.readChar 2
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_5
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_5)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Keyboard.readChar$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_1		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_1)
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_2		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_2)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Keyboard.readChar$WHILE_END0
	D;JNE
	@Keyboard.keyPressed		// call Keyboard.keyPressed 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Keyboard.keyPressed_RETURN_6
	D=A
	@GLOBAL_CALL
	0;JMP
(Keyboard.keyPressed_RETURN_6)
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_3		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_3)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Keyboard.readChar$IF_TRUE0
	D;JNE
	@Keyboard.readChar$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Keyboard.readChar$IF_TRUE0)		// label IF_TRUE0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Keyboard.readChar$IF_FALSE0)		// label IF_FALSE0
	@Keyboard.readChar$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Keyboard.readChar$WHILE_END0)		// label WHILE_END0
	@String.backSpace		// call String.backSpace 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@String.backSpace_RETURN_7
	D=A
	@GLOBAL_CALL
	0;JMP
(String.backSpace_RETURN_7)
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_8
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_8)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_9
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_9)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Keyboard.readLine)		// function Keyboard.readLine 5
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@80		// push constant 80
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.new		// call String.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.new_RETURN_10
	D=A
	@GLOBAL_CALL
	0;JMP
(String.new_RETURN_10)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printString		// call Output.printString 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printString_RETURN_11
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printString_RETURN_11)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@String.newLine		// call String.newLine 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@String.newLine_RETURN_12
	D=A
	@GLOBAL_CALL
	0;JMP
(String.newLine_RETURN_12)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@String.backSpace		// call String.backSpace 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@String.backSpace_RETURN_13
	D=A
	@GLOBAL_CALL
	0;JMP
(String.backSpace_RETURN_13)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Keyboard.readLine$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Keyboard.readLine$WHILE_END0
	D;JNE
	@Keyboard.readChar		// call Keyboard.readChar 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Keyboard.readChar_RETURN_14
	D=A
	@GLOBAL_CALL
	0;JMP
(Keyboard.readChar_RETURN_14)
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_4		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_4)
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Keyboard.readLine$IF_TRUE0
	D;JNE
	@Keyboard.readLine$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Keyboard.readLine$IF_TRUE0)		// label IF_TRUE0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_5		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_5)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Keyboard.readLine$IF_TRUE1
	D;JNE
	@Keyboard.readLine$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Keyboard.readLine$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.eraseLastChar		// call String.eraseLastChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.eraseLastChar_RETURN_15
	D=A
	@GLOBAL_CALL
	0;JMP
(String.eraseLastChar_RETURN_15)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Keyboard.readLine$IF_END1		// goto IF_END1
	0;JMP
(Keyboard.readLine$IF_FALSE1)		// label IF_FALSE1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.appendChar		// call String.appendChar 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@String.appendChar_RETURN_16
	D=A
	@GLOBAL_CALL
	0;JMP
(String.appendChar_RETURN_16)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Keyboard.readLine$IF_END1)		// label IF_END1
(Keyboard.readLine$IF_FALSE0)		// label IF_FALSE0
	@Keyboard.readLine$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Keyboard.readLine$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Keyboard.readInt)		// function Keyboard.readInt 2
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Keyboard.readLine		// call Keyboard.readLine 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Keyboard.readLine_RETURN_17
	D=A
	@GLOBAL_CALL
	0;JMP
(Keyboard.readLine_RETURN_17)
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.intValue		// call String.intValue 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.intValue_RETURN_18
	D=A
	@GLOBAL_CALL
	0;JMP
(String.intValue_RETURN_18)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.dispose		// call String.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.dispose_RETURN_19
	D=A
	@GLOBAL_CALL
	0;JMP
(String.dispose_RETURN_19)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Main
// from file: Main.vm
// ............................................

(Main.main)		// function Main.main 0
	@8000		// push constant 8000
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_20
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_20)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 2 + push local 1 + add
	A=M+1
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@222		// push constant 222
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 2 + push local 1 + add
	A=M+1
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_21
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_21)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 2 + add
	D=M
	@2
	A=A+D
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 2 + push local 1 + add
	A=M+1
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 100 + sub
	A=M-1
	D=M
	@100
	D=D-A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 2 + add
	D=M
	@2
	A=A+D
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@500		// push constant 500
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_22
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_22)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 499 + push local 3 + add
	D=M
	@3
	A=A+D
	D=M
	@499
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 2 + push local 1 + add
	A=M+1
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 2 + add
	D=M
	@2
	A=A+D
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 2 + push local 0 + add
	A=M
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 499 + push local 3 + add
	D=M
	@3
	A=A+D
	D=M
	@499
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_23
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_23)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_24
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_24)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_25
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_25)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 0 + push local 2 + add
	D=M
	@2
	A=A+D
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 499 + push local 3 + add
	D=M
	@3
	A=A+D
	D=M
	@499
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 90 + sub
	A=M-1
	D=M
	@90
	D=D-A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 3 + push local 0 + add
	A=M
	D=M
	@3
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 0 + push local 2 + add
	D=M
	@2
	A=A+D
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_26
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_26)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_27
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_27)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Math
// from file: Math.vm
// ............................................

(Math.init)		// function Math.init 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_28
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_28)
	@SP		// pop static 1
	AM=M-1
	D=M
	@Math.1
	M=D
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_29
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_29)
	@SP		// pop static 0
	AM=M-1
	D=M
	@Math.0
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Math.init$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_6		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_6)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Math.init$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Math.init$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Math.init$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.abs)		// function Math.abs 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_7		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_7)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.abs$IF_TRUE0
	D;JNE
	@Math.abs$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.abs$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// neg
	A=M
	A=A-1
	M=-M
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.abs$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.multiply)		// function Math.multiply 5
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_8		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_8)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_9		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_9)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_10		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_10)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_11		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_11)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_30
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_30)
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_31
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_31)
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_12		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_12)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.multiply$IF_TRUE0
	D;JNE
	@Math.multiply$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.multiply$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.multiply$IF_FALSE0)		// label IF_FALSE0
(Math.multiply$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@GLOBAL_LT_RETURN_13		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_13)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Math.multiply$WHILE_END0
	D;JNE
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_14		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_14)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Math.multiply$IF_TRUE1
	D;JNE
	@Math.multiply$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Math.multiply$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.multiply$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Math.multiply$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Math.multiply$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Math.multiply$IF_TRUE2
	D;JNE
	@Math.multiply$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Math.multiply$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// neg
	A=M
	A=A-1
	M=-M
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.multiply$IF_FALSE2)		// label IF_FALSE2
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.divide)		// function Math.divide 4
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_15		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_15)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.divide$IF_TRUE0
	D;JNE
	@Math.divide$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.divide$IF_TRUE0)		// label IF_TRUE0
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_32
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_32)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Math.divide$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_16		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_16)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_17		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_17)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_18		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_18)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_19		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_19)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_33
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_33)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_34
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_34)
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.divide$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_20		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_20)
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Math.divide$WHILE_END0
	D;JNE
	@32767		// push constant 32767
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@GLOBAL_LT_RETURN_21		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_21)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Math.divide$IF_TRUE1
	D;JNE
	@Math.divide$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Math.divide$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@GLOBAL_GT_RETURN_22		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_22)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Math.divide$IF_TRUE2
	D;JNE
	@Math.divide$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Math.divide$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.divide$IF_FALSE2)		// label IF_FALSE2
(Math.divide$IF_FALSE1)		// label IF_FALSE1
	@Math.divide$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Math.divide$WHILE_END0)		// label WHILE_END0
(Math.divide$WHILE_EXP1)		// label WHILE_EXP1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_23		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_23)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END1
	AM=M-1
	D=M
	@Math.divide$WHILE_END1
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@GLOBAL_GT_RETURN_24		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_24)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@Math.divide$IF_TRUE3
	D;JNE
	@Math.divide$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(Math.divide$IF_TRUE3)		// label IF_TRUE3
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.divide$IF_FALSE3)		// label IF_FALSE3
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Math.divide$WHILE_EXP1		// goto WHILE_EXP1
	0;JMP
(Math.divide$WHILE_END1)		// label WHILE_END1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE4
	AM=M-1
	D=M
	@Math.divide$IF_TRUE4
	D;JNE
	@Math.divide$IF_FALSE4		// goto IF_FALSE4
	0;JMP
(Math.divide$IF_TRUE4)		// label IF_TRUE4
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// neg
	A=M
	A=A-1
	M=-M
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.divide$IF_FALSE4)		// label IF_FALSE4
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.sqrt)		// function Math.sqrt 4
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_25		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_25)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.sqrt$IF_TRUE0
	D;JNE
	@Math.sqrt$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.sqrt$IF_TRUE0)		// label IF_TRUE0
	@4		// push constant 4
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_35
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_35)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Math.sqrt$IF_FALSE0)		// label IF_FALSE0
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.sqrt$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_26		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_26)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Math.sqrt$WHILE_END0
	D;JNE
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_36
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_36)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_27		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_27)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_28		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_28)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Math.sqrt$IF_TRUE1
	D;JNE
	@Math.sqrt$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Math.sqrt$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.sqrt$IF_FALSE1)		// label IF_FALSE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Math.sqrt$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Math.sqrt$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.max)		// function Math.max 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_29		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_29)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.max$IF_TRUE0
	D;JNE
	@Math.max$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.max$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.max$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Math.min)		// function Math.min 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_30		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_30)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Math.min$IF_TRUE0
	D;JNE
	@Math.min$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Math.min$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Math.min$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Memory
// from file: Memory.vm
// ............................................

(Memory.init)		// function Memory.init 0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop static 0
	AM=M-1
	D=M
	@Memory.0
	M=D
	@2048		// push constant 2048
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@14334		// push constant 14334
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@2049		// push constant 2049
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@2050		// push constant 2050
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Memory.peek)		// function Memory.peek 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Memory.poke)		// function Memory.poke 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Memory.alloc)		// function Memory.alloc 2
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_31		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_31)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE0
	D;JNE
	@Memory.alloc$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Memory.alloc$IF_TRUE0)		// label IF_TRUE0
	@5		// push constant 5
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_37
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_37)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Memory.alloc$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_32		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_32)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE1
	D;JNE
	@Memory.alloc$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Memory.alloc$IF_TRUE1)		// label IF_TRUE1
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Memory.alloc$IF_FALSE1)		// label IF_FALSE1
	@2048		// push constant 2048
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Memory.alloc$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16383		// push constant 16383
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_33		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_33)
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_34		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_34)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Memory.alloc$WHILE_END0
	D;JNE
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_35		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_35)
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16382		// push constant 16382
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_36		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_36)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@LCL		// seq 3: push constant 0 + push local 1 + add
	A=M+1
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_37		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_37)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE2
	D;JNE
	@Memory.alloc$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Memory.alloc$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Memory.alloc$IF_END2		// goto IF_END2
	0;JMP
(Memory.alloc$IF_FALSE2)		// label IF_FALSE2
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// seq 3: push constant 0 + push local 1 + add
	A=M+1
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 1 + add
	A=M+1
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@GLOBAL_EQ_RETURN_38		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_38)
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE3
	D;JNE
	@Memory.alloc$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(Memory.alloc$IF_TRUE3)		// label IF_TRUE3
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Memory.alloc$IF_END3		// goto IF_END3
	0;JMP
(Memory.alloc$IF_FALSE3)		// label IF_FALSE3
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 1 + add
	A=M+1
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Memory.alloc$IF_END3)		// label IF_END3
(Memory.alloc$IF_END2)		// label IF_END2
	@Memory.alloc$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Memory.alloc$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@16379		// push constant 16379
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_39		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_39)
	@SP		// if-goto IF_TRUE4
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE4
	D;JNE
	@Memory.alloc$IF_FALSE4		// goto IF_FALSE4
	0;JMP
(Memory.alloc$IF_TRUE4)		// label IF_TRUE4
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_38
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_38)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Memory.alloc$IF_FALSE4)		// label IF_FALSE4
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@GLOBAL_GT_RETURN_40		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_40)
	@SP		// if-goto IF_TRUE5
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE5
	D;JNE
	@Memory.alloc$IF_FALSE5		// goto IF_FALSE5
	0;JMP
(Memory.alloc$IF_TRUE5)		// label IF_TRUE5
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// seq 2: push local 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@SP		// seq 2: push constant 2 + sub
	A=M-1
	D=M
	@2
	D=D-A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@GLOBAL_EQ_RETURN_41		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_41)
	@SP		// if-goto IF_TRUE6
	AM=M-1
	D=M
	@Memory.alloc$IF_TRUE6
	D;JNE
	@Memory.alloc$IF_FALSE6		// goto IF_FALSE6
	0;JMP
(Memory.alloc$IF_TRUE6)		// label IF_TRUE6
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 3 + add
	A=M-1
	D=M
	@3
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// seq 2: push local 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// seq 2: push constant 4 + add
	A=M-1
	D=M
	@4
	D=D+A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Memory.alloc$IF_END6		// goto IF_END6
	0;JMP
(Memory.alloc$IF_FALSE6)		// label IF_FALSE6
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 3 + add
	A=M-1
	D=M
	@3
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// seq 2: push local 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Memory.alloc$IF_END6)		// label IF_END6
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Memory.alloc$IF_FALSE5)		// label IF_FALSE5
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@GLOBAL_RETURN		// return
	0;JMP
(Memory.deAlloc)		// function Memory.deAlloc 2
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + sub
	A=M-1
	D=M
	@2
	D=D-A
	@SP
	A=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// seq 3: push constant 0 + push local 1 + add
	A=M+1
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_42		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_42)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Memory.deAlloc$IF_TRUE0
	D;JNE
	@Memory.deAlloc$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Memory.deAlloc$IF_TRUE0)		// label IF_TRUE0
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@SP		// seq 2: push constant 2 + sub
	A=M-1
	D=M
	@2
	D=D-A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Memory.deAlloc$IF_END0		// goto IF_END0
	0;JMP
(Memory.deAlloc$IF_FALSE0)		// label IF_FALSE0
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// seq 3: push constant 0 + push local 1 + add
	A=M+1
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 1 + add
	A=M+1
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@GLOBAL_EQ_RETURN_43		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_43)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Memory.deAlloc$IF_TRUE1
	D;JNE
	@Memory.deAlloc$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Memory.deAlloc$IF_TRUE1)		// label IF_TRUE1
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 2 + add
	A=M-1
	D=M
	@2
	D=D+A
	@SP
	A=M-1
	M=D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Memory.deAlloc$IF_END1		// goto IF_END1
	0;JMP
(Memory.deAlloc$IF_FALSE1)		// label IF_FALSE1
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 3: push constant 1 + push local 1 + add
	A=M+1
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Memory.deAlloc$IF_END1)		// label IF_END1
(Memory.deAlloc$IF_END0)		// label IF_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Output
// from file: Output.vm
// ............................................

(Output.init)		// function Output.init 0
	@16384		// push constant 16384
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 4
	AM=M-1
	D=M
	@Output.4
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.new		// call String.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.new_RETURN_39
	D=A
	@GLOBAL_CALL
	0;JMP
(String.new_RETURN_39)
	@SP		// pop static 3
	AM=M-1
	D=M
	@Output.3
	M=D
	@Output.initMap		// call Output.initMap 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.initMap_RETURN_40
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.initMap_RETURN_40)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.createShiftedMap		// call Output.createShiftedMap 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.createShiftedMap_RETURN_41
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.createShiftedMap_RETURN_41)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.initMap)		// function Output.initMap 0
	@127		// push constant 127
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_42
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_42)
	@SP		// pop static 5
	AM=M-1
	D=M
	@Output.5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_43
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_43)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_44
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_44)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@33		// push constant 33
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_45
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_45)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@34		// push constant 34
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@20		// push constant 20
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_46
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_46)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_47
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_47)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@36		// push constant 36
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_48
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_48)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@37		// push constant 37
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@49		// push constant 49
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_49
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_49)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@38		// push constant 38
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_50
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_50)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@39		// push constant 39
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_51
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_51)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@40		// push constant 40
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_52
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_52)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@41		// push constant 41
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_53
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_53)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@42		// push constant 42
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_54
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_54)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@43		// push constant 43
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_55
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_55)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@44		// push constant 44
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_56
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_56)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@45		// push constant 45
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_57
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_57)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@46		// push constant 46
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_58
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_58)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@47		// push constant 47
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_59
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_59)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_60
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_60)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@49		// push constant 49
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_61
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_61)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@50		// push constant 50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_62
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_62)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_63
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_63)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@52		// push constant 52
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@26		// push constant 26
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@25		// push constant 25
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@60		// push constant 60
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_64
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_64)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@53		// push constant 53
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_65
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_65)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_66
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_66)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@55		// push constant 55
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@49		// push constant 49
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_67
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_67)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@56		// push constant 56
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_68
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_68)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@57		// push constant 57
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@62		// push constant 62
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_69
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_69)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@58		// push constant 58
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_70
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_70)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_71
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_71)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@60		// push constant 60
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_72
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_72)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@61		// push constant 61
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_73
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_73)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@62		// push constant 62
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_74
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_74)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@64		// push constant 64
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_75
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_75)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_76
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_76)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@65		// push constant 65
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_77
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_77)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@66		// push constant 66
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_78
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_78)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@67		// push constant 67
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_79
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_79)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@68		// push constant 68
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_80
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_80)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@69		// push constant 69
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_81
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_81)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@70		// push constant 70
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_82
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_82)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@71		// push constant 71
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@44		// push constant 44
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_83
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_83)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@72		// push constant 72
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_84
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_84)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@73		// push constant 73
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_85
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_85)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@74		// push constant 74
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@60		// push constant 60
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_86
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_86)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@75		// push constant 75
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_87
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_87)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@76		// push constant 76
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_88
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_88)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@77		// push constant 77
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@33		// push constant 33
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_89
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_89)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@78		// push constant 78
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@55		// push constant 55
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@55		// push constant 55
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_90
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_90)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@79		// push constant 79
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_91
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_91)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@80		// push constant 80
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_92
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_92)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@81		// push constant 81
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@59		// push constant 59
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_93
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_93)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@82		// push constant 82
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_94
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_94)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@83		// push constant 83
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_95
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_95)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@84		// push constant 84
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@45		// push constant 45
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_96
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_96)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@85		// push constant 85
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_97
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_97)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@86		// push constant 86
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_98
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_98)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@87		// push constant 87
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_99
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_99)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@88		// push constant 88
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_100
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_100)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@89		// push constant 89
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_101
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_101)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@90		// push constant 90
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@49		// push constant 49
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@35		// push constant 35
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_102
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_102)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@91		// push constant 91
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_103
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_103)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@92		// push constant 92
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_104
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_104)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@93		// push constant 93
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_105
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_105)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@94		// push constant 94
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@8		// push constant 8
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_106
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_106)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@95		// push constant 95
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_107
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_107)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@96		// push constant 96
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_108
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_108)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@97		// push constant 97
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_109
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_109)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@98		// push constant 98
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_110
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_110)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@99		// push constant 99
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_111
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_111)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@100		// push constant 100
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@60		// push constant 60
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_112
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_112)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@101		// push constant 101
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_113
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_113)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@102		// push constant 102
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@38		// push constant 38
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_114
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_114)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@103		// push constant 103
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@62		// push constant 62
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_115
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_115)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@104		// push constant 104
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@55		// push constant 55
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_116
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_116)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@105		// push constant 105
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_117
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_117)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@106		// push constant 106
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@56		// push constant 56
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_118
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_118)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@107		// push constant 107
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_119
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_119)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@108		// push constant 108
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_120
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_120)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@109		// push constant 109
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@29		// push constant 29
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@43		// push constant 43
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@43		// push constant 43
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@43		// push constant 43
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@43		// push constant 43
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_121
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_121)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@110		// push constant 110
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@29		// push constant 29
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_122
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_122)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@111		// push constant 111
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_123
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_123)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@112		// push constant 112
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_124
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_124)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@113		// push constant 113
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@62		// push constant 62
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_125
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_125)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@114		// push constant 114
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@29		// push constant 29
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@55		// push constant 55
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_126
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_126)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@115		// push constant 115
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_127
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_127)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@116		// push constant 116
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@4		// push constant 4
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@28		// push constant 28
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_128
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_128)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@117		// push constant 117
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@54		// push constant 54
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_129
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_129)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@118		// push constant 118
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_130
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_130)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@119		// push constant 119
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_131
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_131)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@120		// push constant 120
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@30		// push constant 30
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_132
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_132)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@121		// push constant 121
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@62		// push constant 62
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@24		// push constant 24
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_133
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_133)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@122		// push constant 122
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@27		// push constant 27
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@51		// push constant 51
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_134
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_134)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@123		// push constant 123
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@56		// push constant 56
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@56		// push constant 56
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_135
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_135)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@124		// push constant 124
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_136
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_136)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@125		// push constant 125
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@56		// push constant 56
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_137
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_137)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@126		// push constant 126
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@38		// push constant 38
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@45		// push constant 45
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@25		// push constant 25
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Output.create		// call Output.create 12
	D=A
	@R13
	M=D
	@12
	D=A
	@R14
	M=D
	@Output.create_RETURN_138
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.create_RETURN_138)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.create)		// function Output.create 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_139
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_139)
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.5		// seq 2: push static 5 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 0 + push local 0 + add
	A=M
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 1 + push local 0 + add
	A=M
	D=M
	@1
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 2 + push local 0 + add
	A=M
	D=M
	@2
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 3 + push local 0 + add
	A=M
	D=M
	@3
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 4 + push local 0 + add
	A=M
	D=M
	@4
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 5 + push local 0 + add
	A=M
	D=M
	@5
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 6 + push local 0 + add
	A=M
	D=M
	@6
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 7 + push local 0 + add
	A=M
	D=M
	@7
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 8 + push local 0 + add
	A=M
	D=M
	@8
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 9
	D=M
	@9
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 9 + push local 0 + add
	A=M
	D=M
	@9
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 10
	D=M
	@10
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// seq 3: push constant 10 + push local 0 + add
	A=M
	D=M
	@10
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 11
	D=M
	@11
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.createShiftedMap)		// function Output.createShiftedMap 4
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@127		// push constant 127
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_140
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_140)
	@SP		// pop static 6
	AM=M-1
	D=M
	@Output.6
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.createShiftedMap$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@127		// push constant 127
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_44		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_44)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Output.createShiftedMap$WHILE_END0
	D;JNE
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.5		// seq 2: push static 5 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_141
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_141)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.6		// seq 2: push static 6 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.createShiftedMap$WHILE_EXP1)		// label WHILE_EXP1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_45		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_45)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END1
	AM=M-1
	D=M
	@Output.createShiftedMap$WHILE_END1
	D;JNE
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@256		// push constant 256
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_142
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_142)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.createShiftedMap$WHILE_EXP1		// goto WHILE_EXP1
	0;JMP
(Output.createShiftedMap$WHILE_END1)		// label WHILE_END1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_46		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_46)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.createShiftedMap$IF_TRUE0
	D;JNE
	@Output.createShiftedMap$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.createShiftedMap$IF_TRUE0)		// label IF_TRUE0
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.createShiftedMap$IF_END0		// goto IF_END0
	0;JMP
(Output.createShiftedMap$IF_FALSE0)		// label IF_FALSE0
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.createShiftedMap$IF_END0)		// label IF_END0
	@Output.createShiftedMap$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Output.createShiftedMap$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.getMap)		// function Output.getMap 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_47		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_47)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@126		// push constant 126
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_48		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_48)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.getMap$IF_TRUE0
	D;JNE
	@Output.getMap$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.getMap$IF_TRUE0)		// label IF_TRUE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.getMap$IF_FALSE0)		// label IF_FALSE0
	@Output.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Output.getMap$IF_TRUE1
	D;JNE
	@Output.getMap$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Output.getMap$IF_TRUE1)		// label IF_TRUE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.5		// seq 2: push static 5 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.getMap$IF_END1		// goto IF_END1
	0;JMP
(Output.getMap$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.6		// seq 2: push static 6 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.getMap$IF_END1)		// label IF_END1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.drawChar)		// function Output.drawChar 4
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.getMap		// call Output.getMap 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.getMap_RETURN_143
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.getMap_RETURN_143)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.drawChar$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@11		// push constant 11
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_49		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_49)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Output.drawChar$WHILE_END0
	D;JNE
	@Output.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.drawChar$IF_TRUE0
	D;JNE
	@Output.drawChar$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.drawChar$IF_TRUE0)		// label IF_TRUE0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.4		// seq 2: push static 4 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@256
	D=-A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.drawChar$IF_END0		// goto IF_END0
	0;JMP
(Output.drawChar$IF_FALSE0)		// label IF_FALSE0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.4		// seq 2: push static 4 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.drawChar$IF_END0)		// label IF_END0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.4		// seq 2: push static 4 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 32 + add
	A=M-1
	D=M
	@32
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.drawChar$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Output.drawChar$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.moveCursor)		// function Output.moveCursor 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_50		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_50)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@22		// push constant 22
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_51		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_51)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_52		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_52)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@63		// push constant 63
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_53		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_53)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.moveCursor$IF_TRUE0
	D;JNE
	@Output.moveCursor$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.moveCursor$IF_TRUE0)		// label IF_TRUE0
	@20		// push constant 20
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_144
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_144)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Output.moveCursor$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_145
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_145)
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@352		// push constant 352
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_146
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_146)
	@SP		// add
	AM=M-1
	D=M
	A=A-1
	M=D+M
	@Output.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_147
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_147)
	@GLOBAL_EQ_RETURN_54		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_54)
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.drawChar		// call Output.drawChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.drawChar_RETURN_148
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.drawChar_RETURN_148)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.printChar)		// function Output.printChar 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.newLine		// call String.newLine 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@String.newLine_RETURN_149
	D=A
	@GLOBAL_CALL
	0;JMP
(String.newLine_RETURN_149)
	@GLOBAL_EQ_RETURN_55		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_55)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.printChar$IF_TRUE0
	D;JNE
	@Output.printChar$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.printChar$IF_TRUE0)		// label IF_TRUE0
	@Output.println		// call Output.println 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.println_RETURN_150
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.println_RETURN_150)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.printChar$IF_END0		// goto IF_END0
	0;JMP
(Output.printChar$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.backSpace		// call String.backSpace 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@String.backSpace_RETURN_151
	D=A
	@GLOBAL_CALL
	0;JMP
(String.backSpace_RETURN_151)
	@GLOBAL_EQ_RETURN_56		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_56)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Output.printChar$IF_TRUE1
	D;JNE
	@Output.printChar$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Output.printChar$IF_TRUE1)		// label IF_TRUE1
	@Output.backSpace		// call Output.backSpace 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.backSpace_RETURN_152
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.backSpace_RETURN_152)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.printChar$IF_END1		// goto IF_END1
	0;JMP
(Output.printChar$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.drawChar		// call Output.drawChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.drawChar_RETURN_153
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.drawChar_RETURN_153)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Output.printChar$IF_TRUE2
	D;JNE
	@Output.printChar$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Output.printChar$IF_TRUE2)		// label IF_TRUE2
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
(Output.printChar$IF_FALSE2)		// label IF_FALSE2
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_57		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_57)
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@Output.printChar$IF_TRUE3
	D;JNE
	@Output.printChar$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(Output.printChar$IF_TRUE3)		// label IF_TRUE3
	@Output.println		// call Output.println 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.println_RETURN_154
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.println_RETURN_154)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.printChar$IF_END3		// goto IF_END3
	0;JMP
(Output.printChar$IF_FALSE3)		// label IF_FALSE3
	@Output.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
(Output.printChar$IF_END3)		// label IF_END3
(Output.printChar$IF_END1)		// label IF_END1
(Output.printChar$IF_END0)		// label IF_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.printString)		// function Output.printString 2
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.length		// call String.length 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@String.length_RETURN_155
	D=A
	@GLOBAL_CALL
	0;JMP
(String.length_RETURN_155)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Output.printString$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_58		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_58)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Output.printString$WHILE_END0
	D;JNE
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.charAt		// call String.charAt 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@String.charAt_RETURN_156
	D=A
	@GLOBAL_CALL
	0;JMP
(String.charAt_RETURN_156)
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_157
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_157)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Output.printString$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Output.printString$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.printInt)		// function Output.printInt 0
	@Output.3		// push static 3
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@String.setInt		// call String.setInt 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@String.setInt_RETURN_158
	D=A
	@GLOBAL_CALL
	0;JMP
(String.setInt_RETURN_158)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.3		// push static 3
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printString		// call Output.printString 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printString_RETURN_159
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printString_RETURN_159)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.println)		// function Output.println 0
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 352 + add
	A=M-1
	D=M
	@352
	D=D+A
	@SP
	A=M-1
	M=D
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@8128		// push constant 8128
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_59		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_59)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.println$IF_TRUE0
	D;JNE
	@Output.println$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.println$IF_TRUE0)		// label IF_TRUE0
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
(Output.println$IF_FALSE0)		// label IF_FALSE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Output.backSpace)		// function Output.backSpace 0
	@Output.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Output.backSpace$IF_TRUE0
	D;JNE
	@Output.backSpace$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Output.backSpace$IF_TRUE0)		// label IF_TRUE0
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_60		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_60)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Output.backSpace$IF_TRUE1
	D;JNE
	@Output.backSpace$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Output.backSpace$IF_TRUE1)		// label IF_TRUE1
	@Output.0		// push static 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
	@Output.backSpace$IF_END1		// goto IF_END1
	0;JMP
(Output.backSpace$IF_FALSE1)		// label IF_FALSE1
	@31		// push constant 31
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 0
	AM=M-1
	D=M
	@Output.0
	M=D
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_61		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_61)
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Output.backSpace$IF_TRUE2
	D;JNE
	@Output.backSpace$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Output.backSpace$IF_TRUE2)		// label IF_TRUE2
	@8128		// push constant 8128
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
(Output.backSpace$IF_FALSE2)		// label IF_FALSE2
	@Output.1		// push static 1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 321 + sub
	A=M-1
	D=M
	@321
	D=D-A
	@SP
	A=M-1
	M=D
	@SP		// pop static 1
	AM=M-1
	D=M
	@Output.1
	M=D
(Output.backSpace$IF_END1)		// label IF_END1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
	@Output.backSpace$IF_END0		// goto IF_END0
	0;JMP
(Output.backSpace$IF_FALSE0)		// label IF_FALSE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// pop static 2
	AM=M-1
	D=M
	@Output.2
	M=D
(Output.backSpace$IF_END0)		// label IF_END0
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.drawChar		// call Output.drawChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.drawChar_RETURN_160
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.drawChar_RETURN_160)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Screen
// from file: Screen.vm
// ............................................

(Screen.init)		// function Screen.init 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16384		// push constant 16384
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 1
	AM=M-1
	D=M
	@Screen.1
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// pop static 2
	AM=M-1
	D=M
	@Screen.2
	M=D
	@17		// push constant 17
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_161
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_161)
	@SP		// pop static 0
	AM=M-1
	D=M
	@Screen.0
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Screen.init$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_62		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_62)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.init$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// seq 2: push that 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Screen.init$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.init$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.clearScreen)		// function Screen.clearScreen 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
(Screen.clearScreen$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@8192		// push constant 8192
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_63		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_63)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.clearScreen$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.clearScreen$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.clearScreen$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.updateLocation)		// function Screen.updateLocation 0
	@Screen.2		// push static 2
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.updateLocation$IF_TRUE0
	D;JNE
	@Screen.updateLocation$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.updateLocation$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@Screen.updateLocation$IF_END0		// goto IF_END0
	0;JMP
(Screen.updateLocation$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.1		// seq 2: push static 1 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
(Screen.updateLocation$IF_END0)		// label IF_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.setColor)		// function Screen.setColor 0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop static 2
	AM=M-1
	D=M
	@Screen.2
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawPixel)		// function Screen.drawPixel 3
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_64		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_64)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_65		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_65)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_66		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_66)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_67		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_67)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawPixel$IF_TRUE0
	D;JNE
	@Screen.drawPixel$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawPixel$IF_TRUE0)		// label IF_TRUE0
	@7		// push constant 7
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_162
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_162)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawPixel$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_163
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_163)
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_164
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_164)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_165
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_165)
	@LCL		// seq 2: push local 0 + add
	A=M
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_166
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_166)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawConditional)		// function Screen.drawConditional 0
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawConditional$IF_TRUE0
	D;JNE
	@Screen.drawConditional$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawConditional$IF_TRUE0)		// label IF_TRUE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawPixel		// call Screen.drawPixel 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.drawPixel_RETURN_167
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawPixel_RETURN_167)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.drawConditional$IF_END0		// goto IF_END0
	0;JMP
(Screen.drawConditional$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawPixel		// call Screen.drawPixel 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.drawPixel_RETURN_168
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawPixel_RETURN_168)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawConditional$IF_END0)		// label IF_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawLine)		// function Screen.drawLine 11
	@11
	D=A
	@R13
	M=D
(Screen.drawLine_INIT_LOCALS_LOOP)
	@Screen.drawLine_INIT_LOCALS_END
	D;JEQ
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R13
	MD=M-1
	@Screen.drawLine_INIT_LOCALS_LOOP
	0;JMP
(Screen.drawLine_INIT_LOCALS_END)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_68		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_68)
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_69		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_69)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_70		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_70)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_71		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_71)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawLine$IF_TRUE0
	D;JNE
	@Screen.drawLine$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawLine$IF_TRUE0)		// label IF_TRUE0
	@8		// push constant 8
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_169
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_169)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawLine$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 0 + sub
	A=M
	D=M
	@SP
	A=M-1
	M=M-D
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_170
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_170)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 1 + sub
	A=M+1
	D=M
	@SP
	A=M-1
	M=M-D
	@Math.abs		// call Math.abs 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Math.abs_RETURN_171
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.abs_RETURN_171)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_72		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_72)
	@LCL		// pop local 6
	D=M
	@6
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_73		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_73)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_74		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_74)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Screen.drawLine$IF_TRUE1
	D;JNE
	@Screen.drawLine$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Screen.drawLine$IF_TRUE1)		// label IF_TRUE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawLine$IF_FALSE1)		// label IF_FALSE1
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Screen.drawLine$IF_TRUE2
	D;JNE
	@Screen.drawLine$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Screen.drawLine$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 8
	D=M
	@8
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_75		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_75)
	@LCL		// pop local 7
	D=M
	@7
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawLine$IF_END2		// goto IF_END2
	0;JMP
(Screen.drawLine$IF_FALSE2)		// label IF_FALSE2
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 8
	D=M
	@8
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_76		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_76)
	@LCL		// pop local 7
	D=M
	@7
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawLine$IF_END2)		// label IF_END2
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_172
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_172)
	@LCL		// seq 2: push local 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// pop local 5
	D=M
	@5
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_173
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_173)
	@LCL		// pop local 9
	D=M
	@9
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_174
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_174)
	@LCL		// pop local 10
	D=M
	@10
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawConditional		// call Screen.drawConditional 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawConditional_RETURN_175
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawConditional_RETURN_175)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawLine$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_77		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_77)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.drawLine$WHILE_END0
	D;JNE
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_78		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_78)
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@Screen.drawLine$IF_TRUE3
	D;JNE
	@Screen.drawLine$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(Screen.drawLine$IF_TRUE3)		// label IF_TRUE3
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 9 + add
	D=M
	@9
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 5
	D=M
	@5
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawLine$IF_END3		// goto IF_END3
	0;JMP
(Screen.drawLine$IF_FALSE3)		// label IF_FALSE3
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 10 + add
	D=M
	@10
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 5
	D=M
	@5
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE4
	AM=M-1
	D=M
	@Screen.drawLine$IF_TRUE4
	D;JNE
	@Screen.drawLine$IF_FALSE4		// goto IF_FALSE4
	0;JMP
(Screen.drawLine$IF_TRUE4)		// label IF_TRUE4
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawLine$IF_END4		// goto IF_END4
	0;JMP
(Screen.drawLine$IF_FALSE4)		// label IF_FALSE4
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawLine$IF_END4)		// label IF_END4
(Screen.drawLine$IF_END3)		// label IF_END3
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawConditional		// call Screen.drawConditional 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawConditional_RETURN_176
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawConditional_RETURN_176)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.drawLine$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.drawLine$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawRectangle)		// function Screen.drawRectangle 9
	@9
	D=A
	@R13
	M=D
(Screen.drawRectangle_INIT_LOCALS_LOOP)
	@Screen.drawRectangle_INIT_LOCALS_END
	D;JEQ
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R13
	MD=M-1
	@Screen.drawRectangle_INIT_LOCALS_LOOP
	0;JMP
(Screen.drawRectangle_INIT_LOCALS_END)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_79		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_79)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_80		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_80)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_81		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_81)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_82		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_82)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_83		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_83)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_84		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_84)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawRectangle$IF_TRUE0
	D;JNE
	@Screen.drawRectangle$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawRectangle$IF_TRUE0)		// label IF_TRUE0
	@9		// push constant 9
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_177
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_177)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawRectangle$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_178
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_178)
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_179
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_179)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// pop local 7
	D=M
	@7
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_180
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_180)
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_181
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_181)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// pop local 8
	D=M
	@8
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 6
	D=M
	@6
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 5
	D=M
	@5
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_182
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_182)
	@LCL		// seq 2: push local 3 + add
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawRectangle$WHILE_EXP0)		// label WHILE_EXP0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_85		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_85)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.drawRectangle$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_86		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_86)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Screen.drawRectangle$IF_TRUE1
	D;JNE
	@Screen.drawRectangle$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Screen.drawRectangle$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_183
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_183)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.drawRectangle$IF_END1		// goto IF_END1
	0;JMP
(Screen.drawRectangle$IF_FALSE1)		// label IF_FALSE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_184
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_184)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawRectangle$WHILE_EXP1)		// label WHILE_EXP1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_87		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_87)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END1
	AM=M-1
	D=M
	@Screen.drawRectangle$WHILE_END1
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_185
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_185)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawRectangle$WHILE_EXP1		// goto WHILE_EXP1
	0;JMP
(Screen.drawRectangle$WHILE_END1)		// label WHILE_END1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_186
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_186)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawRectangle$IF_END1)		// label IF_END1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 32 + add
	A=M-1
	D=M
	@32
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// seq 2: push local 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawRectangle$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.drawRectangle$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawHorizontal)		// function Screen.drawHorizontal 11
	@11
	D=A
	@R13
	M=D
(Screen.drawHorizontal_INIT_LOCALS_LOOP)
	@Screen.drawHorizontal_INIT_LOCALS_END
	D;JEQ
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@R13
	MD=M-1
	@Screen.drawHorizontal_INIT_LOCALS_LOOP
	0;JMP
(Screen.drawHorizontal_INIT_LOCALS_END)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.min		// call Math.min 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.min_RETURN_187
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.min_RETURN_187)
	@LCL		// pop local 7
	D=M
	@7
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.max		// call Math.max 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.max_RETURN_188
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.max_RETURN_188)
	@LCL		// pop local 8
	D=M
	@8
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_88		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_88)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@256		// push constant 256
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_89		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_89)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@512		// push constant 512
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_90		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_90)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_91		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_91)
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawHorizontal$IF_TRUE0
	D;JNE
	@Screen.drawHorizontal$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawHorizontal$IF_TRUE0)		// label IF_TRUE0
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@Math.max		// call Math.max 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.max_RETURN_189
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.max_RETURN_189)
	@LCL		// pop local 7
	D=M
	@7
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.min		// call Math.min 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.min_RETURN_190
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.min_RETURN_190)
	@LCL		// pop local 8
	D=M
	@8
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_191
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_191)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 7
	D=M
	@7
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_192
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_192)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// pop local 9
	D=M
	@9
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_193
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_193)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 8
	D=M
	@8
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_194
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_194)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// pop local 10
	D=M
	@10
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 9
	D=M
	@9
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 5
	D=M
	@5
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 10
	D=M
	@10
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@Screen.0		// seq 2: push static 0 + add
	D=M
	@SP
	A=M-1
	M=D+M
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@32		// push constant 32
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_195
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_195)
	@LCL		// seq 2: push local 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 1 + sub
	A=M+1
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// pop local 6
	D=M
	@6
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 6 + add
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 6
	D=M
	@6
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_92		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_92)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Screen.drawHorizontal$IF_TRUE1
	D;JNE
	@Screen.drawHorizontal$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Screen.drawHorizontal$IF_TRUE1)		// label IF_TRUE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_196
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_196)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.drawHorizontal$IF_END1		// goto IF_END1
	0;JMP
(Screen.drawHorizontal$IF_FALSE1)		// label IF_FALSE1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 5
	D=M
	@5
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_197
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_197)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawHorizontal$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_93		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_93)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.drawHorizontal$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + neg
	A=M
	M=-1
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_198
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_198)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawHorizontal$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.drawHorizontal$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.updateLocation		// call Screen.updateLocation 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Screen.updateLocation_RETURN_199
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.updateLocation_RETURN_199)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawHorizontal$IF_END1)		// label IF_END1
(Screen.drawHorizontal$IF_FALSE0)		// label IF_FALSE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawSymetric)		// function Screen.drawSymetric 0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@Screen.drawHorizontal		// call Screen.drawHorizontal 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawHorizontal_RETURN_200
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawHorizontal_RETURN_200)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + add
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@Screen.drawHorizontal		// call Screen.drawHorizontal 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawHorizontal_RETURN_201
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawHorizontal_RETURN_201)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + add
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@Screen.drawHorizontal		// call Screen.drawHorizontal 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawHorizontal_RETURN_202
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawHorizontal_RETURN_202)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + sub
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M-D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 3 + add
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M-1
	M=M+D
	@Screen.drawHorizontal		// call Screen.drawHorizontal 3
	D=A
	@R13
	M=D
	@3
	D=A
	@R14
	M=D
	@Screen.drawHorizontal_RETURN_203
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawHorizontal_RETURN_203)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Screen.drawCircle)		// function Screen.drawCircle 3
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_94		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_94)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_95		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_95)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_96		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_96)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_97		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_97)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Screen.drawCircle$IF_TRUE0
	D;JNE
	@Screen.drawCircle$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Screen.drawCircle$IF_TRUE0)		// label IF_TRUE0
	@12		// push constant 12
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_204
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_204)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawCircle$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_98		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_98)
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@511		// push constant 511
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_99		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_99)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_100		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_100)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@255		// push constant 255
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_101		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_101)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@Screen.drawCircle$IF_TRUE1
	D;JNE
	@Screen.drawCircle$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(Screen.drawCircle$IF_TRUE1)		// label IF_TRUE1
	@13		// push constant 13
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_205
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_205)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawCircle$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@ARG		// seq 2: push argument 2 + sub
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M-D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawSymetric		// call Screen.drawSymetric 4
	D=A
	@R13
	M=D
	@4
	D=A
	@R14
	M=D
	@Screen.drawSymetric_RETURN_206
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawSymetric_RETURN_206)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Screen.drawCircle$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_102		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_102)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Screen.drawCircle$WHILE_END0
	D;JNE
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_103		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_103)
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@Screen.drawCircle$IF_TRUE2
	D;JNE
	@Screen.drawCircle$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(Screen.drawCircle$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_207
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_207)
	@SP		// add
	AM=M-1
	D=M
	A=A-1
	M=D+M
	@SP		// seq 2: push constant 3 + add
	A=M-1
	D=M
	@3
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Screen.drawCircle$IF_END2		// goto IF_END2
	0;JMP
(Screen.drawCircle$IF_FALSE2)		// label IF_FALSE2
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP
	A=M
	M=1
	M=M+1
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 1 + sub
	A=M+1
	D=M
	@SP
	A=M-1
	M=M-D
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_208
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_208)
	@SP		// add
	AM=M-1
	D=M
	A=A-1
	M=D+M
	@SP		// seq 2: push constant 5 + add
	A=M-1
	D=M
	@5
	D=D+A
	@SP
	A=M-1
	M=D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Screen.drawCircle$IF_END2)		// label IF_END2
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Screen.drawSymetric		// call Screen.drawSymetric 4
	D=A
	@R13
	M=D
	@4
	D=A
	@R14
	M=D
	@Screen.drawSymetric_RETURN_209
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.drawSymetric_RETURN_209)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.drawCircle$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Screen.drawCircle$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: String
// from file: String.vm
// ............................................

(String.new)		// function String.new 0
	@3		// push constant 3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.alloc		// call Memory.alloc 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Memory.alloc_RETURN_210
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.alloc_RETURN_210)
	@SP		// pop pointer 0
	AM=M-1
	D=M
	@R3
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_104		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_104)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.new$IF_TRUE0
	D;JNE
	@String.new$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.new$IF_TRUE0)		// label IF_TRUE0
	@14		// push constant 14
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_211
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_211)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.new$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_105		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_105)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@String.new$IF_TRUE1
	D;JNE
	@String.new$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(String.new$IF_TRUE1)		// label IF_TRUE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_212
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_212)
	@THIS		// pop this 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.new$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// pop this 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@R3		// push pointer 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.dispose)		// function String.dispose 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_106		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_106)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.dispose$IF_TRUE0
	D;JNE
	@String.dispose$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.dispose$IF_TRUE0)		// label IF_TRUE0
	@THIS		// push this 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_213
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_213)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.dispose$IF_FALSE0)		// label IF_FALSE0
	@R3		// push pointer 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Memory.deAlloc		// call Memory.deAlloc 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Memory.deAlloc_RETURN_214
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.deAlloc_RETURN_214)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.length)		// function String.length 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.charAt)		// function String.charAt 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_107		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_107)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_108		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_108)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_109		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_109)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.charAt$IF_TRUE0
	D;JNE
	@String.charAt$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.charAt$IF_TRUE0)		// label IF_TRUE0
	@15		// push constant 15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_215
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_215)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.charAt$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.setCharAt)		// function String.setCharAt 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_110		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_110)
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_111		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_111)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_112		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_112)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.setCharAt$IF_TRUE0
	D;JNE
	@String.setCharAt$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.setCharAt$IF_TRUE0)		// label IF_TRUE0
	@16		// push constant 16
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_216
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_216)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.setCharAt$IF_FALSE0)		// label IF_FALSE0
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.appendChar)		// function String.appendChar 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_113		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_113)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.appendChar$IF_TRUE0
	D;JNE
	@String.appendChar$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.appendChar$IF_TRUE0)		// label IF_TRUE0
	@17		// push constant 17
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_217
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_217)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.appendChar$IF_FALSE0)		// label IF_FALSE0
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@R3		// push pointer 0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.eraseLastChar)		// function String.eraseLastChar 0
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_114		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_114)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.eraseLastChar$IF_TRUE0
	D;JNE
	@String.eraseLastChar$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.eraseLastChar$IF_TRUE0)		// label IF_TRUE0
	@18		// push constant 18
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_218
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_218)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.eraseLastChar$IF_FALSE0)		// label IF_FALSE0
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.intValue)		// function String.intValue 5
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_115		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_115)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.intValue$IF_TRUE0
	D;JNE
	@String.intValue$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.intValue$IF_TRUE0)		// label IF_TRUE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.intValue$IF_FALSE0)		// label IF_FALSE0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@45		// push constant 45
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_116		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_116)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@String.intValue$IF_TRUE1
	D;JNE
	@String.intValue$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(String.intValue$IF_TRUE1)		// label IF_TRUE1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 4
	D=M
	@4
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.intValue$IF_FALSE1)		// label IF_FALSE1
(String.intValue$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_117		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_117)
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// and
	AM=M-1
	D=M
	A=A-1
	M=D&M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@String.intValue$WHILE_END0
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 48 + sub
	A=M-1
	D=M
	@48
	D=D-A
	@SP
	A=M-1
	M=D
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_118		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_118)
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@9		// push constant 9
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_119		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_119)
	@SP		// or
	AM=M-1
	D=M
	A=A-1
	M=D|M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@String.intValue$IF_TRUE2
	D;JNE
	@String.intValue$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(String.intValue$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@10		// push constant 10
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_219
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_219)
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.intValue$IF_FALSE2)		// label IF_FALSE2
	@String.intValue$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(String.intValue$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 4
	D=M
	@4
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@String.intValue$IF_TRUE3
	D;JNE
	@String.intValue$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(String.intValue$IF_TRUE3)		// label IF_TRUE3
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// neg
	A=M
	A=A-1
	M=-M
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.intValue$IF_FALSE3)		// label IF_FALSE3
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.setInt)		// function String.setInt 4
	@0
	D=A
	@SP
	A=M
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	A=A+1
	M=D
	D=A+1
	@SP
	M=D
	@ARG		// seq 2: push argument 0 + pop pointer 0
	A=M
	D=M
	@R3
	M=D
	@THIS		// push this 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_120		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_120)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@String.setInt$IF_TRUE0
	D;JNE
	@String.setInt$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(String.setInt$IF_TRUE0)		// label IF_TRUE0
	@19		// push constant 19
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_220
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_220)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.setInt$IF_FALSE0)		// label IF_FALSE0
	@6		// push constant 6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.new		// call Array.new 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.new_RETURN_221
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.new_RETURN_221)
	@LCL		// pop local 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_121		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_121)
	@SP		// if-goto IF_TRUE1
	AM=M-1
	D=M
	@String.setInt$IF_TRUE1
	D;JNE
	@String.setInt$IF_FALSE1		// goto IF_FALSE1
	0;JMP
(String.setInt$IF_TRUE1)		// label IF_TRUE1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@LCL		// pop local 3
	D=M
	@3
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// neg
	A=M
	A=A-1
	M=-M
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.setInt$IF_FALSE1)		// label IF_FALSE1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.setInt$WHILE_EXP0)		// label WHILE_EXP0
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_122		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_122)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@String.setInt$WHILE_END0
	D;JNE
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@10		// push constant 10
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.divide		// call Math.divide 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.divide_RETURN_222
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.divide_RETURN_222)
	@LCL		// pop local 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@10		// push constant 10
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Math.multiply		// call Math.multiply 2
	D=A
	@R13
	M=D
	@2
	D=A
	@R14
	M=D
	@Math.multiply_RETURN_223
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.multiply_RETURN_223)
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@SP		// add
	AM=M-1
	D=M
	A=A-1
	M=D+M
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@LCL		// push local 1
	A=M+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// pop argument 1
	D=M
	@1
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@String.setInt$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(String.setInt$WHILE_END0)		// label WHILE_END0
	@LCL		// push local 3
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// if-goto IF_TRUE2
	AM=M-1
	D=M
	@String.setInt$IF_TRUE2
	D;JNE
	@String.setInt$IF_FALSE2		// goto IF_FALSE2
	0;JMP
(String.setInt$IF_TRUE2)		// label IF_TRUE2
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@45		// push constant 45
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.setInt$IF_FALSE2)		// label IF_FALSE2
	@THIS		// push this 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_123		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_123)
	@SP		// if-goto IF_TRUE3
	AM=M-1
	D=M
	@String.setInt$IF_TRUE3
	D;JNE
	@String.setInt$IF_FALSE3		// goto IF_FALSE3
	0;JMP
(String.setInt$IF_TRUE3)		// label IF_TRUE3
	@19		// push constant 19
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_224
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_224)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(String.setInt$IF_FALSE3)		// label IF_FALSE3
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_EQ_RETURN_124		// eq
	D=A
	@GLOBAL_EQ
	0;JMP
(GLOBAL_EQ_RETURN_124)
	@SP		// if-goto IF_TRUE4
	AM=M-1
	D=M
	@String.setInt$IF_TRUE4
	D;JNE
	@String.setInt$IF_FALSE4		// goto IF_FALSE4
	0;JMP
(String.setInt$IF_TRUE4)		// label IF_TRUE4
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@48		// push constant 48
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@String.setInt$IF_END4		// goto IF_END4
	0;JMP
(String.setInt$IF_FALSE4)		// label IF_FALSE4
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(String.setInt$WHILE_EXP1)		// label WHILE_EXP1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_125		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_125)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END1
	AM=M-1
	D=M
	@String.setInt$WHILE_END1
	D;JNE
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// seq 2: push this 1 + add
	A=M+1
	D=M
	@SP
	A=M-1
	M=M+D
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@SP		// sub
	AM=M-1
	D=M
	A=A-1
	M=M-D
	@LCL		// seq 2: push local 2 + add
	A=M+1
	A=A+1
	D=M
	@SP
	A=M-1
	M=M+D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@THAT		// push that 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// pop pointer 1
	AM=M-1
	D=M
	@R4
	M=D
	@R5		// seq 2: push temp 0 + pop that 0
	D=M
	@THAT
	A=M
	M=D
	@THIS		// push this 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + add
	A=M-1
	D=M+1
	M=D
	@THIS		// pop this 2
	D=M
	@2
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@String.setInt$WHILE_EXP1		// goto WHILE_EXP1
	0;JMP
(String.setInt$WHILE_END1)		// label WHILE_END1
(String.setInt$IF_END4)		// label IF_END4
	@LCL		// push local 2
	A=M+1
	A=A+1
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Array.dispose		// call Array.dispose 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Array.dispose_RETURN_225
	D=A
	@GLOBAL_CALL
	0;JMP
(Array.dispose_RETURN_225)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.newLine)		// function String.newLine 0
	@128		// push constant 128
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.backSpace)		// function String.backSpace 0
	@129		// push constant 129
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(String.doubleQuote)		// function String.doubleQuote 0
	@34		// push constant 34
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

// ............................................
// module: Sys
// from file: Sys.vm
// ............................................

(Sys.init)		// function Sys.init 0
	@Memory.init		// call Memory.init 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Memory.init_RETURN_226
	D=A
	@GLOBAL_CALL
	0;JMP
(Memory.init_RETURN_226)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Math.init		// call Math.init 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Math.init_RETURN_227
	D=A
	@GLOBAL_CALL
	0;JMP
(Math.init_RETURN_227)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Screen.init		// call Screen.init 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Screen.init_RETURN_228
	D=A
	@GLOBAL_CALL
	0;JMP
(Screen.init_RETURN_228)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Output.init		// call Output.init 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Output.init_RETURN_229
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.init_RETURN_229)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Keyboard.init		// call Keyboard.init 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Keyboard.init_RETURN_230
	D=A
	@GLOBAL_CALL
	0;JMP
(Keyboard.init_RETURN_230)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Main.main		// call Main.main 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Main.main_RETURN_231
	D=A
	@GLOBAL_CALL
	0;JMP
(Main.main_RETURN_231)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Sys.halt		// call Sys.halt 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Sys.halt_RETURN_232
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.halt_RETURN_232)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Sys.halt)		// function Sys.halt 0
(Sys.halt$WHILE_EXP0)		// label WHILE_EXP0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Sys.halt$WHILE_END0
	D;JNE
	@Sys.halt$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Sys.halt$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Sys.wait)		// function Sys.wait 1
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_LT_RETURN_126		// lt
	D=A
	@GLOBAL_LT
	0;JMP
(GLOBAL_LT_RETURN_126)
	@SP		// if-goto IF_TRUE0
	AM=M-1
	D=M
	@Sys.wait$IF_TRUE0
	D;JNE
	@Sys.wait$IF_FALSE0		// goto IF_FALSE0
	0;JMP
(Sys.wait$IF_TRUE0)		// label IF_TRUE0
	@SP		// push constant 1
	A=M
	M=1
	@SP
	M=M+1
	@Sys.error		// call Sys.error 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Sys.error_RETURN_233
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.error_RETURN_233)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
(Sys.wait$IF_FALSE0)		// label IF_FALSE0
(Sys.wait$WHILE_EXP0)		// label WHILE_EXP0
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_127		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_127)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END0
	AM=M-1
	D=M
	@Sys.wait$WHILE_END0
	D;JNE
	@50		// push constant 50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
(Sys.wait$WHILE_EXP1)		// label WHILE_EXP1
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_GT_RETURN_128		// gt
	D=A
	@GLOBAL_GT
	0;JMP
(GLOBAL_GT_RETURN_128)
	@SP		// not
	A=M
	A=A-1
	M=!M
	@SP		// if-goto WHILE_END1
	AM=M-1
	D=M
	@Sys.wait$WHILE_END1
	D;JNE
	@LCL		// push local 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@LCL		// pop local 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Sys.wait$WHILE_EXP1		// goto WHILE_EXP1
	0;JMP
(Sys.wait$WHILE_END1)		// label WHILE_END1
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@SP		// seq 2: push constant 1 + sub
	A=M-1
	D=M-1
	M=D
	@ARG		// pop argument 0
	D=M
	@0
	D=D+A
	@R13
	M=D
	@SP
	AM=M-1
	D=M
	@R13
	A=M
	M=D
	@Sys.wait$WHILE_EXP0		// goto WHILE_EXP0
	0;JMP
(Sys.wait$WHILE_END0)		// label WHILE_END0
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP
(Sys.error)		// function Sys.error 0
	@69		// push constant 69
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_234
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_234)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@82		// push constant 82
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_235
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_235)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@82		// push constant 82
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printChar		// call Output.printChar 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printChar_RETURN_236
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printChar_RETURN_236)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@ARG		// push argument 0
	A=M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	@Output.printInt		// call Output.printInt 1
	D=A
	@R13
	M=D
	@1
	D=A
	@R14
	M=D
	@Output.printInt_RETURN_237
	D=A
	@GLOBAL_CALL
	0;JMP
(Output.printInt_RETURN_237)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@Sys.halt		// call Sys.halt 0
	D=A
	@R13
	M=D
	@0
	D=A
	@R14
	M=D
	@Sys.halt_RETURN_238
	D=A
	@GLOBAL_CALL
	0;JMP
(Sys.halt_RETURN_238)
	@SP		// pop temp 0
	AM=M-1
	D=M
	@R5
	M=D
	@SP		// push constant 0
	A=M
	M=0
	@SP
	M=M+1
	@GLOBAL_RETURN		// return
	0;JMP

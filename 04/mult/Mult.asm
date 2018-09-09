// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
	@total
	M=0 // set the total amount to 0
	@R0
	D=M 
	@i
	M=D // set the current loop iteration to RAM[0]
(LOOP)
	@i
	D=M // get the current loop iteration
	@END
	D;JEQ // if that was the last loop, exit the loop
	@R1
	D=M // get the value in RAM[1]
	@total
	M=D+M // add RAM[1] to the current total
	@i
	M=M-1 // decrement the loop iteration
	@LOOP
	0;JMP // begin the loop again
(END)
	@total
	D=M // get the total amount
	@R2
	M=D // put the total amount in RAM[2]
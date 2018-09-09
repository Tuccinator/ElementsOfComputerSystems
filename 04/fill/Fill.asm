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

// Put your code here.
	@8192
	D=A
	@pixels 
	M=D // set the number of pixels to 8192
(LOOP)
	@filled
	M=0 // set the amount of filled pixels to 0

	(FILL)
		@KBD 
		D=M // check the keyboard input
		@LIGHTEN 
		D;JEQ // when there is no keyboard input, lighten the screen
	(DARKEN)
		@filled
		D=M // get the filled pixel count
		@SCREEN
		A=A+D // get the address that should be filled
		M=-1 // use -1 to convert all 0s to 1s
		@END
		0;JMP // jump to the end
	(LIGHTEN)
		@filled
		D=M // get the filled pixel count
		@SCREEN
		A=A+D // get the address that be filled with white
		M=0 // make everything white in that row
	(END)
		@filled
		MD = M+1 // increase the filled pixel count
		@pixels
		D=D-M // check if all pixels have been filled
		@LOOP
		D;JEQ // if all pixels have been filled, loop again
		@FILL
		0;JMP // continue filling
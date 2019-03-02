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

(INIT)
    @8192 // The screen is 32 * 256 blocks of 16 pixels
    D=A
    @i
    M=D // Initialize Variable i to the screen size

(LOOP)
    @i // Since we're starting at the end of the screen, start counting back
    M=M-1 
    D=M 
    @INIT
    D;JLT // If our index is less than 0, re-initialize it
    @KBD // get Value from keyboard
    D=M
    @WHITE
    D;JEQ // If D = 0, no key is pressed, so paint white
    @BLACK
    0;JMP // Otherwise, a key must be pressed, so paint black

(WHITE)
    @SCREEN
    D=A // Set D register to the Screen starting location
    @i
    A=D+M // Add the starting location to the current index
    M=0 // Write the value 0 to all 16 pixels
    @LOOP
    0;JMP // Go back to the loop to count backwards

(BLACK)
    @SCREEN
    D=A // Again, set the D register to starting location
    @i
    A=D+M // Add the starting location to the current index value
    M=-1 // Write the value to 1 for all 16 pixels 
    @LOOP
    0;JMP // Again, back to loop to continue counting backwards

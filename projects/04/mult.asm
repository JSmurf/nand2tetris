// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R2
    M=0 // Set R2 = 0

    @R0
    D=M // Set M = R0
    @END
    D;JEQ // If R0 = 0, end

    @R1
    D=M // Set M = R1
    @END
    D;JEQ // If R1 = 0, end

(LOOP)
    @R1
    D=M // D = R1
    @END
    D;JEQ // Jump to end if R1 = 0
    @R0
    D=M // D = R0
    @R2
    M=M+D // output=output+R0
    @R1
    M=M-1 // Subtract 1 from R1

    @LOOP
    0;JMP // Go back to LOOP

(END)
    @END
    0;JMP

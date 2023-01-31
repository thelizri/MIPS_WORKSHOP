	.text
	la $a0, string #Loads address of string into $a0
	jal PrintString #Print string located at address $a0
	nop
	lw $a0, number #Loads address of number into $a0
	jal PrintInteger #Print integer stored in $a0
	nop
	jal Exit #Exits the program
	nop
	
	.data
number: .word 69
string: .asciiz "Number: "
	
	.include "utils.asm" #Imports functions from our utils.asm file. Make sure to put at the end.

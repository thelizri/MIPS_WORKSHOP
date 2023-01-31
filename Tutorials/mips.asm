.macro Exit 		#Name of macro
#Define macro here
li $v0,10
syscall
#Define macro here
.end_macro	
.macro PrintHello 	#Name of macro.
la $a0, hello
li $v0, 4
syscall
.end_macro
.text
PrintHello
la $a0, string
jal PrintString #Print string located at address $a0
nop
lw $a0, number
jal PrintInteger #Print integer stored in $a0
nop
Exit #call macro. Code that exists in macro will replace the label. 
.data
number: .word 69
string: .asciiz "Number: "
hello: .asciiz "Hello user. Welcome! \n"
.include "utils.asm" #Imports functions from our utils.asm file. Make sure to put at the end. 

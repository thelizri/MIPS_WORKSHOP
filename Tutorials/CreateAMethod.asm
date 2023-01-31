	.text
main:
	jal writeFunction 		#calls our print function. loads next line into $ra register
	nop
exit:
    li $v0, 10
    syscall
writeFunction:
    li $v0, 4 				# System call code for print_str
	la $a0, output			# Load address of string into $a0
	syscall
	jr $ra 					#jumps back to the loaded address
	nop
	
	.data
output: .asciiz "Hello World\n"
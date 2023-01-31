	.text
main:
	li $t0, 1 # Initialize $t0 to 1
loop:
	# Print $t0
	li $v0, 1 # System call code for print_int
	move $a0, $t0 # Load $t0 into $a0
	syscall # Invoke print_int
	
	# Print a newline
	li $v0, 4 # System call code for print_str
	la $a0, newline # Load address of newline string into $a0
	syscall # Invoke print_str
	
	addi $t0, $t0, 1 # Increment $t0
	slti $t1, $t0, 101 # Set $t1 to 1 if $t0 < 101, 0 otherwise
	bne $t1, $zero, loop # Repeat loop if $t0 < 101. Branch to loop if $t1 != 0
	li $v0, 10 # System call code for exit
	syscall # Exit program
	
	.data
newline: .asciiz "\n"

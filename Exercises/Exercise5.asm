	.macro Exit
	li $v0, 10
	syscall
	.end_macro
	.macro PrintInt
	li $v0, 1 # System call code for print_int
	syscall # Invoke print_int
	.end_macro
	.macro NewLine
	li $v0, 4 # System call code for print_str
	la $a0, newline # Load address of output string into $a0
	syscall # Invoke print_str# Invoke print_int
	.end_macro
	.macro PrintString
	li $v0, 4 # System call code for print_str
	syscall # Invoke print_str# Invoke print_int
	.end_macro
	
	.text
main:
	li $t0, 0 # Initialize first Fibonacci number to 0
	li $t1, 1 # Initialize second Fibonacci number to 1
	li $t2, 4000000 #Set max value of Fibonacci
	add $t4, $zero, $zero #We will store sum in $t4 of even Fibonacci numbers.
	
loop:
	#Calculate next Fibonacci number
	add $t3, $t0, $t1 # $t3 = $t0 + $t1
	move $t0, $t1 # $t0 = $t1
	move $t1, $t3 # $t1 = $t3
	
	#Check if fibonacci is even
	rem $t5, $t3, 2
	beq $t5, 1, loop
	nop
	
	#Exit loop if $t3 > 4000000
	bgt $t3, $t2, result
	nop
	
	#Add fibonacci to sum
	add $t4, $t4, $t3
	j loop
	nop
	
result:
	#Print sum of fibonacci numbers
	la $a0, string
	PrintString
	move $a0, $t4
	PrintInt
	
	#Exit program
	Exit
	
	.data
string: .asciiz "Total sum: "
newline: .asciiz "\n"

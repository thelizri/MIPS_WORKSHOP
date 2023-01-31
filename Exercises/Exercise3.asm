.macro Exit
    li $v0, 10
    syscall
.end_macro
.macro PrintInt
    li      $v0, 1      # System call code for print_int
    syscall             # Invoke print_int
.end_macro
.macro NewLine
    li      $v0, 4        # System call code for print_str
    la      $a0, newline  # Load address of output string into $a0
    syscall               # Invoke print_str# Invoke print_int
.end_macro
.macro PrintString
    li      $v0, 4        # System call code for print_str
    syscall               # Invoke print_str# Invoke print_int
.end_macro
	.text
main:
    li $t0, 0 # Initialize first Fibonacci number to 0
    li $t1, 1 # Initialize second Fibonacci number to 1
    li $t2, 20 # Initialize loop counter to 20

loop:
    #Print current Fibonacci number
    la $a0, fibString
    PrintString
    move $a0, $t0 # Load current Fibonacci number into $a0
    PrintInt
    NewLine

    #Calculate next Fibonacci number
    add $t3, $t0, $t1 # $t3 = $t0 + $t1
    move $t0, $t1 # $t0 = $t1
    move $t1, $t3 # $t1 = $t3

    #Increment loop counter
    addi $t2, $t2, -1 # $t2 = $t2 - 1

    #Repeat loop if $t2 > 0
    bgtz $t2, loop # Branch to loop if $t2 > 0

#Exit program
Exit

	.data
fibString: .asciiz "Fibonacci Number: "
newline: .asciiz "\n"
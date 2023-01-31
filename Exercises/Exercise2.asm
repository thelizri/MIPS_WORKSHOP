.macro Exit
    li $v0, 10
    syscall
.end_macro
.macro PrintInt
    li      $v0, 1      # System call code for print_int
    syscall         # Invoke print_int
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
    la      $a0, prompt # Load address of prompt string into $a0
    PrintString

    li      $v0, 5      # System call code for read_int
    syscall             # Read integer from user and store in $v0

    move    $t0, $v0    # Copy user input into $t0
    
    li      $v0, 41     # System call code for random int
    syscall             # Generate random number and store in $v0
    
    move    $t1, $a0    # Copy random number into $t1
    
    la $a0, random
    PrintString
    move $a0, $t1 #Copy random number into $a0 för printing
    PrintInt
    NewLine

    mul     $t2, $t0, $t1    # Multiply user input by random number and store result in $t2

    la      $a0, output # Load address of output string into $a0
    PrintString

    move    $a0, $t2    # Load result into $a0
    PrintInt

    li      $v0, 10     # System call code for exit
    syscall             # Exit program

    .data
newline: .asciiz "\n"
random: .asciiz "Your random number is: "
prompt: .asciiz "Enter a number: "
output: .asciiz "The result is: "
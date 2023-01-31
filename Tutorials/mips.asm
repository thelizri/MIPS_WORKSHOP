#Since we don't know how big the string the user is gonna enter is, we need to allocate some dynamic memory.
.text
main:
la $a0, prompt1 # Read and print first string
li $a1, 80      #Number of bytes to allocate in memory
jal PromptString
nop
move $a0, $v0
jal PrintString
nop
la $a0, prompt2 # Read and print second string
li $a1, 80      #Number of bytes to allocate in memory
jal PromptString
nop
move $a0, $v0
jal PrintString
nop
jal Exit
nop
.data
prompt1: .asciiz "Enter the first string: "
prompt2: .asciiz "Enter the second string: "
.text
PromptString:
addi $sp, $sp, -12 # Push stack
sw $ra, 0($sp)
sw $a1, 4($sp)
sw $s0, 8($sp)
li $v0, 4          # Print the prompt
syscall

li $v0, 9          #Syscall for allocating memory. $a0 = number of bytes to allocate.
lw $a0, 4($sp)     #Load the number 80 into $a0. 
syscall
move $s0, $v0      # Move the address of the allocated memory to $s0
move $a0, $s0      # Read the string. Move memory address to $a0. 

li $v0, 8	   # Syscall for reading a string. $a0 = address of input buffer	
lw $a1, 4($sp)     # $a1 = maximum number of characters to read. We're loading the number 80 into $a1.
syscall

move $v0, $s0     # Save string address to return
lw $ra, 0($sp)    # Pop stack
lw $s0, 8($sp)
addi $sp, $sp, 12
jr $ra
nop

.include "utils.asm"
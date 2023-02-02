	.data
string: .asciiz "Hello world\n"
.eqv SYS_EXIT 10
.eqv LOOP_COUNTER $t0
	.text
	li LOOP_COUNTER, 0 #We intialize our loop counter to zero. i=0
forLoop: #Create a label for the for loop.
	#Place code between here
	#This code prints 'Hello world\n'. Replace with your code.
	la $a0, string
	li $v0, 4
	syscall
	#Place code between here
	addi LOOP_COUNTER, LOOP_COUNTER, 1 #Increment our loop counter by 1 
	blt LOOP_COUNTER, 10, forLoop #go to forLoop if i<10
	
	li $v0, SYS_EXIT #Syscall to exit
	syscall



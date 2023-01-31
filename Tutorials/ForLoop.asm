	.text
li $t0, 0 			#We intialize our loop counter to zero. i=0
forLoop:			#Create a label for the for loop. 
	#Place code between here
	#This code prints 'Hello world\n'. Replace with your code. 
	la $a0, string
	li $v0, 4
	syscall
	#Place code between here
	addi $t0, $t0, 1  		#i++
	slti $t1, $t0, 10 		#$t1 = 1 if i<10
	bne $t1, $zero, forLoop		#go to forLoop if i<10

li $v0, 10			#Syscall to exit
syscall

	.data
string: .asciiz "Hello world\n"
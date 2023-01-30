.text				#This directive indicates the start of your code
la $a0, string 		#Loads the address of our label, where our string resides.
li $v0, 4			#Load the service number 4 into register $v0. Service number 4 is for printing strings.
syscall

li $v0, 10			#Syscall to exit
syscall
.data 				#Subsequent items are stored in a data segment
string: .asciiz "Hello world\n"
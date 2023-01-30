.data
    output: .asciiz "Hello World\n"
.text
    main:
	jal writeFunction 		#calls our print function. loads next line into ra register
	nop
    exit:
    li $v0, 10
    syscall
    writeFunction:
    li $v0, 4
	la $a0, output
	syscall
	jr $ra 					#jumps back to the loaded address
	nop

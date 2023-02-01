	.text
	# if (num > 0 )
	lw $t0, num
sgt $t1, $t0, $zero #Boolean: (num > 0). If $t0 is greater than $zero, $t1 is set to 1. If it's not, it is set to 0.
	beqz $t1, end_if #Will branch if $t1 equals zero.
if:
	la $a0, PositiveNumber
	jal PrintString
	nop
end_if:
	jal Exit
	nop
	
	.data
num: .word -9
PositiveNumber: .asciiz "Number is positive"
	
	.include "utils.asm" #Imports functions from our utils.asm file

	.text
	lw $t0, num
sgt $t1, $t0, $zero #Boolean: (num > 0). If $t0 is greater than $zero, $t1 is set to 1. If it's not, it is set to 0.
	beqz $t1, else #Will branch if $t1 equals zero.
if: #if block
	la $a0, PositiveNumber
	jal PrintString
	nop
	j end_if #We must jump here, otherwise the else block will also execute
	#else block
else:
	la $a0, NegativeNumber
	jal PrintString
	nop
end_if:
	jal Exit
	nop
	
	.data
num: .word -5
PositiveNumber: .asciiz "Number is positive"
NegativeNumber: .asciiz "Number is negative"
	
	.include "utils.asm"

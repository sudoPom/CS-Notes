.data
 newline: .asciiz "\n"
.text

li $v0, 5
syscall
#t0 is current val, t1 holds last digit (odd or even)
move $t0, $v0
li $t2, 3
li $t3, 1

top:
#print value
li $v0, 1 
move $a0, $t0
syscall 

#print newline
li $v0, 4       
la $a0, newline       
syscall

#branch if number is equal to 1
beq $t0, 1, end

#determine if odd or even
and $t1 $t0 $t3
beqz $t1 even
mul $t0 $t2 $t0
addi $t0, $t0, 1
b top

even:
srl $t0, $t0, 1
b top

end:

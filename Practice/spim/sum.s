.data
str: .asciiz "\n"
msg: .asciiz "Sum="


.text
.globl main
main: li $t1,0
loop: li $v0, 5;syscall
beq $v0,$0,end

move $t2,$v0;
li $v0,4;la $a0, msg;syscall
add $a0, $t2, $t1;add $t1, $t2, $t1

li $v0, 1;syscall
li $v0,4;la $a0, str;syscall
j loop
end: jr $ra

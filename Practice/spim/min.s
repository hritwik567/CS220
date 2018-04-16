.data
str: .asciiz "\n"

.text
.globl main
main:
li $t1,0
li $v0, 5;syscall
add $t1, $v0, $t1;add $t2,$v0,$0;

li $v0, 5;syscall
add $t1, $v0, $t1;
slt $t3,$t2,$v0;bne $t3,$0,skip1
  move $t2,$v0;

skip1:
li $v0, 5;syscall
add $t1, $v0, $t1
slt $t3,$t2,$v0;bne $t3,$0,skip2
  move $t2,$v0;
skip2:
sub $a0,$t1,$t2;
li $v0, 1;syscall
li $v0,4;la $a0, str;syscall;
end: jr $ra

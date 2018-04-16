.data
end: .asciiz "\n"
msg: .asciiz "Invalid\n"
sp: .asciiz " "
o0: .asciiz "Zero"
o1: .asciiz "One"
o2: .asciiz "Two"
o3: .asciiz "Three"
o4: .asciiz "Four"
o5: .asciiz "Five"
o6: .asciiz "Six"
o7: .asciiz "Seven"
o8: .asciiz "Eight"
o9: .asciiz "Nine"

.text
.globl main
main:
li $v0, 5;syscall;move $t4,$v0;

slt $t0,$t4,$0;beq $t0,$0,skip1
  li $v0,4;la $a0,msg;syscall;
  j return
skip1:

li $t0,1;

loop1:
slt $t1,$t0,$t4;beq $t1,$0,done1;
li $t1,10;mult $t0,$t1;mflo $t0;
j loop1;
done1:

# li $v0,4;la $a0,o1; syscall;
# li $v0,1;move $a0,$t4;syscall;
# li $v0,4;la $a0,end; syscall;

li $t3,10;div $t0,$t3;mflo $t0;

loop2:
slt $t1,$0,$t0;beq $t1,$0,done2;
div $t4,$t0;mflo $t1;mfhi $t2;

# li $v0,1;move $a0,$t1;syscall;

  ploop:
    li $t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c0;
      li $v0,4;la $a0,o1;syscall;
      j pdone;
    c0:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c1;
      li $v0,4;la $a0,o1;syscall;
      j pdone;
    c1:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c2;
      li $v0,4;la $a0,o2;syscall;
      j pdone;
    c2:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c3;
      li $v0,4;la $a0,o3;syscall;
      j pdone;
    c3:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c4;
      li $v0,4;la $a0,o4;syscall;
      j pdone;
    c4:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c5;
      li $v0,4;la $a0,o5;syscall;
      j pdone;
    c5:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c6;
      li $v0,4;la $a0,o6;syscall;
      j pdone;
    c6:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c7;
      li $v0,4;la $a0,o7;syscall;
      j pdone;
    c7:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c8;
      li $v0,4;la $a0,o8;syscall;
      j pdone;
    c8:addi $t5,$t5,1;
    slt $t3,$t1,$t5;beq $t3,$0,c9;
      li $v0,4;la $a0,o9;syscall;
      j pdone;
    c9:
  pdone:

li $v0,4;la $a0,sp; syscall;

mult $t1,$t0;mflo $t3;
sub $t4,$t4,$t3;

li $t3,10;div $t0,$t3;mflo $t0;
j loop2;
done2:

return: jr $ra

# load "dig.s"
# run
# int t0=1;
# while(t0<a)t0*=10;

# while(t>1)cout<<(a)/t,a-=t*(a/t),#t/=10;

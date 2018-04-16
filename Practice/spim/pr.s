.data
end: .asciiz "<-Prime\n"
msg: .asciiz "Loop1: "
msg2: .asciiz "In function.\n"
val: .asciiz "Mod is :"
l: .asciiz "\n"
fnd: .asciiz "not prime\n"

.text
.globl main
main:
add $t0,$0,$0;li $t1,2;
loop:
slti $t2,$t0,10;beq $t2,$0,done

  addi $sp,$sp,-8;
  sw $t0,0($sp);sw $ra,4($sp);

  add $a0,$t1,$0;jal prime;

  lw $t0,0($sp);lw $ra,4($sp);
  addi $sp,$sp,8;

  beq $v0,$0,notprime
    addi $t0,$t0,1;
    li $v0,1;move $a0,$t1;syscall;
    li $v0,4;la $a0, end;syscall;
  notprime:

  addi $t1,$t1,1;
  j loop
done:
return: jr $ra


prime:
  move $t1,$a0;li $t0,2;
  li $t3,1;

  loopa:
  slt $t2,$t0,$t1;beq $t2,$0,donea
      div $t1,$t0;mfhi $t2;

      bne $t2,$0,primea
        li $t3,0;j endp;
      primea:

      addi $t0,$t0,1;
      j loopa
  donea:

endp:  move $v0,$t3;
jr $ra

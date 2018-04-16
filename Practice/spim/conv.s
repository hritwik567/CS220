.data
str: .asciiz "\n"
msg: .asciiz "Done\n"
aa: .word 1 , 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15;
bb: .word 1 , 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15;


.text
.globl main
main:
li $v0,5;syscall;
move $t0,$v0;

li $v0,4;la $a0, msg;syscall;

li $t1,0;

loop1:
slt $t2,$t1,$t0;beq $t2,$0,done1

  li $v0,6;syscall;#cin
  mov.s $f1,$f0;

  la $t3,aa;move $t4, $t1;
  sll $t4,$t4,2;add $t3, $t4, $t3;s.s $f1, 0($t3);#store

  addi $t1,$t1,1;
j loop1
done1:

li $v0,4;la $a0, msg;syscall;

li $t1,0;

loop2:
slt $t2,$t1,$t0;beq $t2,$0,done2

  li $v0,6;syscall;#cin
  mov.s $f1,$f0;

  la $t3,bb;move $t4, $t1;
  sll $t4,$t4,2;add $t3, $t4, $t3;s.s $f1, 0($t3);#store

  addi $t1,$t1,1;
j loop2
done2:

li $v0,4;la $a0, msg;syscall;

li $t1,0;mtc1 $0,$f5;

loop3:
slt $t2,$t1,$t0;beq $t2,$0,done3
  la $t3,aa;move $t4,$t1;#load
  sll $t4,$t4,2;add $t3, $t4, $t3;l.s $f6, 0($t3);

  la $t3,bb;move $t4,$t1;#load
  sll $t4,$t4,2;add $t3, $t4, $t3;l.s $f7, 0($t3);

  mul.s $f6,$f6,$f7;
  add.s $f5,$f5,$f6;

  addi $t1,$t1,1;
j loop3
done3:

li $v0,4;la $a0, msg;syscall;

mov.s $f12,$f5;
li $v0,2;syscall;#print


#
# li $v0,6;syscall;#cin
# mov.s $f1,$f0;
#
# la $t3,aa;li $t4, $t1;
# sll $t4,$t4,2;add $t3, $t4, $t3;s.s $f1, 0($t3);#store
#
# la $t3,aa;li $t4,$t1;#print
# sll $t4,$t4,2;add $t3, $t4, $t3;l.s $f12, 0($t1);

end: jr $ra


# cin >> n;
# i=0;
# while(i<n){
#   cin>>a[i];
#   i++;
# }
#
# i=0;
# while(i<n){
#   cin>>b[i];
#   i++;
# }

# sum=0;i=0;
# while(i<n){
#   sum+=a[i]*b[i];
#   i++;
# }

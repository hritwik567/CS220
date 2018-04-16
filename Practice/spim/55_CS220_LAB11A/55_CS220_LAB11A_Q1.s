.data
msg1: .asciiz "Enter a number: "
comma: .asciiz ","

.text
.globl main
main:
#input a non-negative number
la $a0, msg1
li $v0,4
syscall

li $v0, 5    #Read the number(n)
syscall

move $t2, $v0    # n to $t2
blez $t2, end

#loop start i=$t3
li $t3, 1

move $a0, $t3
move $v0, $t3
jal fib          #call fib (1)
move $t4, $v0

move $a0, $t4    #Print the answer
li $v0, 1
syscall

addi $t3, $t3, 1 #i = 2
slt $t6, $t2, $t3 #i>n
bne $t6, $0, end

# Call function to get fibonnacci #n
start:
move $a0, $t3
move $v0, $t3
jal fib          #call fib (i)
move $t4, $v0    #result is in $t4

la $a0, comma    #Print comma
li $v0, 4
syscall

move $a0, $t4    #Print the answer
li $v0, 1
syscall

addi $t3, $t3, 1 #i++
slt $t6, $t2, $t3 #i>n
beq $t6, $0, start


# End program
end:
li $v0,10
syscall

fib:
# Compute and return fibonacci number
beqz $a0, zero   #if n=0 return 0
beq $a0, 1, one   #if n=1 return 1

#Calling fib(n-1)
addi $sp, $sp, -4   #storing return address on stack
sw $ra, 0($sp)

addi $a0, $a0, -1   #n-1
jal fib     #fib(n-1)
addi $a0, $a0, 1

lw $ra, 0($sp)   #restoring return address from stack
addi $sp, $sp, 4

addi $sp, $sp, -4   #Push return value to stack
sw $v0, 0($sp)

#Calling fib(n-2)
addi $sp, $sp, -4   #storing return address on stack
sw $ra, 0($sp)

addi $a0, $a0, -2   #n-2
jal fib     #fib(n-2)
addi $a0, $a0, 2

lw $ra, 0($sp)   #restoring return address from stack
addi $sp, $sp, 4

#---------------
lw $s7, 0($sp)   #Pop return value from stack
addi $sp, $sp, 4

add $v0, $v0, $s7 #fib(n-2)+fib(n-1)
jr $ra # decrement/next in stack

zero:
li $v0,0
jr $ra
one:
li $v0,1
jr $ra

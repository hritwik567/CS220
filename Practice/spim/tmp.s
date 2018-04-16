.globl main
.data
    hello: .asciiz "Hello, the string is:\n"
    names:
        .ascii "MIPS"
        .ascii "IS"
        .asciiz "CRAZY"

.text
main:
    la $a0, hello
    li $v0, 4
    syscall

    #print the first member of the names array
    la $t0, names
    la $a0, 5($t0)
    li $v0, 4
    syscall

    #exit
    li $v0, 10
    syscall

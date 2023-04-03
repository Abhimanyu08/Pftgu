#A program to calculate factorial recursively
.section .data
.section .text
.globl _start
_start:

pushl $4

call factorial

movl %eax,%ebx
movl $1,%eax
int $0x80



.type factorial,@function
factorial:

pushl %ebp
movl %esp,%ebp

movl 8 (%ebp), %ebx

cmpl $1,%ebx
je end_factorial

decl %ebx
pushl %ebx
call factorial
addl $4,%esp

movl %eax,%ebx
imull 8 (%ebp), %ebx

end_factorial:
movl %ebx, %eax
movl %ebp,%esp
popl %ebp

ret


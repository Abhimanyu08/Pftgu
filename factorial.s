.section .data
.section .text
.globl _start
_start:

pushl $5
call factorial
addl $4, %esp


movl %eax, %ebx

movl $1, %eax
int $0x80


.type factorial,@function
factorial:

#store the base pointer right now at top of stack
pushl %ebp
# store the current stack pointer in ebp so that we can reference parameters easily
# we do so because ebp is optimiser for base pointer addressing method.
movl %esp, %ebp
subl $4, %esp

#get the first parameter and put it into ebx
movl 8 (%ebp), %eax



cmpl $1,%eax
je end_factorial

decl %eax
pushl %eax
call factorial
addl $4, %esp

imull 8 (%ebp), %eax

end_factorial:
#discard all the local variables 
movl %ebp, %esp
popl %ebp #restore the old ebp
#%esp is now pointing towards return address
ret



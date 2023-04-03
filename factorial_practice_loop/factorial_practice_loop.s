.section .data
.section .text
.globl _start
_start:

pushl $4

call factorial

addl $4, %esp

movl %eax, %ebx
movl $1, %eax
int $0x80

.type factorial,@function
factorial:

pushl %ebp
movl %esp, %ebp

movl 8 (%ebp), %ebx
movl %ebx, %eax

start_loop:

cmpl $1, %ebx
je end_factorial

decl %ebx
imull %ebx, %eax

jmp start_loop

end_factorial:
movl %ebp,%esp
popl %ebp

ret


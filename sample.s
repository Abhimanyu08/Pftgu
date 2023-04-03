
.section .data
.section .text
.globl _start
_start:

pushl $2
popl %ebx

movl $1, %eax
int $0x80


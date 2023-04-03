.section .data

data_items:
.long 5,3,6,8,2

answers:
.long 25,9,36,64,4

.section .text
.globl _start
_start:

# to test the square function, let's push multiple values on the stack and calculate their squares

movl $0, %ecx
start_loop:

cmpl $5, %ecx
je end_loop

pushl data_items(,%ecx,4)
call square
addl $4, %esp

cmpl answers(,%ecx,4), %eax
jl end_loop_failed
jg end_loop_failed

incl %ecx
jmp start_loop

end_loop:
movl $1, %eax
movl $0, %ebx
int $0x80

end_loop_failed:
movl %eax, %ebx
movl $1, %eax
int $0x80



.type square, @function
square:


movl 4 (%esp), %eax

imull %eax, %eax

ret


.section .data
data_items:
.long 1,4,2,3,1,10,9,0
.section .text
.globl _start
_start:

movl $0, %eax
movl data_items(,%eax,4), %ecx
movl %ecx, %ebx

start_loop:

cmpl $0,%ecx
je end_loop


incl %eax
movl data_items(,%eax,4), %ecx

cmpl %ebx,%ecx
jle start_loop

movl %ecx,%ebx
jmp start_loop

end_loop:
movl $1, %eax
int $0x80




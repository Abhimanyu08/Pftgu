# This is a assembly program to find the maximum of a list of numbers

# We'd need a list to store all the numbers
# We'd need a variable to store the current maximum number seen
# We'd need to know while scaning the list, where we are in the list.
# We should have a way to know that we have reached the end of the list, and it's time to stop.

.section .data
data_items:
.long 3,2,1,22,40,13,14,15,9,10,30,0


# we don't have .globl declaration for data_items since data_items is only accessed by the below program. No other program needs to know the address of the data_items.

#below we are defining a label named data_items. labels are variables basically.
.section .text
.globl _start
_start:

# We will keep the current index in register %edi
# We will keep the current data item in register %eax
# We'll keep the largest number seen in register %ebx
# l in movl cmpl stands for long, since we are moving comparing, incrementing longs.

movl $0, %edi #edi is 0 at the start
movl data_items(,%edi,4), %eax # we get the first element in data_items using indexed addressing method, index being %edi and multiplier being 4
movl %eax,%ebx #first element is the largest we have seen till now.

start_loop: #here we are defining another label which we'll need later
#je means jump if equal i.e jump equal
#the result of cmpl is stored in %eflags register.
cmpl $0, %eax
je loop_exit 

incl %edi
movl data_items(,%edi,4), %eax


cmpl %ebx,%eax 
jle start_loop #jle means jump if operand 2 less than or equal to operand 1 i.e jump less equal


movl %eax, %ebx
jmp start_loop

loop_exit:
movl $1,%eax
int $0x80

#immediate addressing -> movl $0,%eax $immediate addressing is being done atthe source operand.
#direct addressing -> movl 0, %eax -> move the data at location 0 into %eax.
#indexed addressing -> data_items(,%ebx,4) , %eax . this loads the register with data at data_items + 4*%ebx

#indirect addressing -> movl (%eax), %ebx -> go to the address which is storedin register %eax, take the data there and put it in $ebx
# base pointer addressing -> movl 4 (%eax), %ebx -> add 4 bytes to the address location stored in %eax, go to that location and load the data there into%ebx




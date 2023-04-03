#Anything starting with a .(period) won't be translated into machine instructions. It's just an instruction to the assembler. 

# .section command is used to break program into sections.
# .section .data command is the start of data section where we can list any memory storage we will need. In the below case we don't need any.

# .section .text is start of text section. this is where the instructions live.

# _start is a symbol. symbols are like variables from what I gather right now.

# _start: is a label. A label = symbol + colon. label tells the assembler to make the symbol's value wherever the next instruction or data element will be.

# movl $1, %eax -> movl is a instruction, which has two operands viz. source and destination. Here we are saying that move the literal value 1 in the general-purpose register named %eax. If we don't use the dollar sign then data at memory address 1 will be loaded in the register. movl $1, %eax is immediate addressing mode.

# movl $0, %ebc -> same explanation as above. 
# int $0x80 -> int stands for interrupt. By interrupting the program we are requesting a system call. 0x80 is the interrupt number to use. We interrupt the program this way, we are requesting a system call from linux kernel. System calls are labelled by numbers. How does linux know what system call to use? It reads the number stores in %eax register. We had stored value 1 in %eax register, therefore system call corresponding to number 1, which is the exit system call will be called. This system call requires exit code for the program to be stored in the %ebx register, which we have intialized to 0. 

.section .data
.section .text
.globl _start
_start:
movl $1, %eax
movl $0, %ebx
int $0x80

#! /bin/bash

touch $1.s

echo ".section .data" >> $1.s
echo ".section .text" >> $1.s
echo ".globl _start" >> $1.s
echo "_start:" >> $1.s

vi $1.s

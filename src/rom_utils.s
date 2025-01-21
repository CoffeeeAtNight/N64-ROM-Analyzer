  .section .text
  
  .globl _start
    
  _start: 
          li $v0, 4001
          li $a0, 13
          syscall

.section .data

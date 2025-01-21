.section .text
  
.globl __start
    
__start:
	# Print start text into stdout
	li $v0, 4004		# Put syscall number for write into v0
	li $a0, 1		# Put stdout fd into a0
	la $a1, start_text 	# Load the address of start_text into a1
	li $a2, 100		# Put size of 101 into a1
	syscall

	# Read user input from stdin into rom_path
	li $v0, 4003		# Put syscall number for read into v0
	li $a0, 0		# Put stdin fd into a0
	la $a1, rom_path	# Load address of the rom path buffer into a1
	li $a2, 1025		# Put the size of 1025 into a2
	syscall			# Syscall

	# Check how many bytes were read
	move $t0, $v0		# Store the number of bytes read in t0
	addi $t0, $t0, -1	# Point to the last character read
	lb $t1, rom_path($t0)	# Load that char into t0
	li $t2, 10 		# ASCII value for newline
	bne $t1, $t2, no_newl 	# If not a new line, skip
	sb $zero, rom_path($t0) # Replace newline with null terminator
	
	# Open rom on provided path
  	li $v0, 4005		# Put syscall number for open in v0 
  	la $a0, rom_path 	# Load asci zero terminated string into a0
	li $a1, 0		# Load flag 0 into a1
	li $a2, 0		# Load mode 0 into a2
	syscall			# Syscall

	# Check if file descriptor is valid
	li $t1, -1
	beq $v0, $t1, error_fd
	
	# Read file from file descriptor
	move $v1, $v0		# Move file descriptor result into v1
	li $v0, 4003		# Put syscall number for read into v0
	move $a0, $v1		# Move file descriptor into a0
	la $a1, rom_header	# Load address of rom header buffer into a1
	li $a2, 64		# Put size of 64 byte in a2
	syscall			# Syscall
	
	# Write rom header to stdout
	li $v0, 4004		# Put syscall number for write into v0
	li $a0, 1		# Put stdout fd into a0
	la $a1, rom_header	# Load rom_header address into a1
	li $a2, 64		# Put size of 64 into a1
	syscall			# Syscall
	
	# Exit
	li $v0, 4001		# Put syscall number for exit in v0
	move $a0, $v1		# Move file descriptor into a0 to log it
  	syscall			# Syscall

	
	error_fd:
		li $v0, 4004
		li $a0, 1
		li $a1, error_fd_txt
		li $a2, 68
		syscall

	no_newl:
		li $v0, 4004
		li $a0, 1
		li $a1, error_no_newl 
		li $a2, 28
		syscall

.section .data
	start_text:
	.asciz "||| N64 ROM Analyzer by Luna ||| \nPlease provide the absolute path to the ROM you want to analyze: "

	error_fd_txt:
	.asciz "Error ocurred while trying open the ROM file with given file path\n"

	error_no_newl:
	.asciz "Error: No new line detected"

	rom_path:
	.space 1024

	rom_header:
	.space 65		# 64 byte ROM header

	rom_name:
	.space 20		# Name of the ROM

	rom_country_code:
	.space 1		# Mapping

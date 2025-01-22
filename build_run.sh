#!/bin/bash

mkdir -p build

# Link the assembly file to an object file 
mips-linux-gnu-as src/rom_utils.s -o build/rom_utils.o

# Comile C program
mips-linux-gnu-gcc -c src/main.c -o build/main.o -static

# Compile and build the static elf without std lib runtime linking 
mips-linux-gnu-gcc build/main.o build/rom_utils.o -o build/rom_utils -static

# Run the file in qemu mips emulator
qemu-mips ./build/rom_utils

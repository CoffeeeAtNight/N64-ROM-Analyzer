#!/bin/bash

# Link the assembly file to an object file 
mips-linux-gnu-as src/rom_utils.s -o build/rom_utils.o

# Compile and build the static elf without std lib runtime linking 
mips-linux-gnu-gcc build/rom_utils.o -o build/rom_utils -nostdlib -static

# Run the file in qemu mips emulator
qemu-mips ./build/rom_utils

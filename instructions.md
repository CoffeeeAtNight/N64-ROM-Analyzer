# N64 ROM Analyzer

## Project Overview
This project involves creating a program that parses and analyzes Nintendo 64 (N64) ROM files. The program will:
- Extract metadata from the ROM header (e.g., game title, region, ROM size).
- Combine C and MIPS assembly for low-level file parsing and binary data manipulation.
- Provide a tangible and retro-cool application for learning.

### Tools
1. **GCC (or Clang)**
   - Install via your system’s package manager:
     ```bash
     sudo apt install gcc # Linux
     brew install gcc     # macOS
     ```

2. **GNU Assembler for MIPS (or MIPS Cross-Compiler)**
   - Install a MIPS toolchain:
     ```bash
     sudo apt install binutils-mips-linux-gnu gcc-mips-linux-gnu
     ```
   - Alternatively, download a prebuilt toolchain: [mips64-toolchain](https://github.com/archlinux/svntogit-community/tree/packages/mips64-toolchain/trunk).

3. **Hex Editor** (Optional, but helpful)
   - Linux: `hexedit`
   - macOS: `Hex Fiend`

4. **N64 ROM File**
   - Use a legally acquired or homebrew N64 ROM (e.g., tech demos or open-source games).

5. **Text Editor/IDE**
   - Use any editor you’re comfortable with (e.g., VS Code, Vim).

### Knowledge
1. **C Programming**:
   - Understand functions, file I/O, and pointers.
   - Resource: [Learn C Programming](https://www.learn-c.org/).

2. **MIPS Assembly Basics**:
   - Understand registers, memory operations, and control flow.
   - Resource: [MIPS Assembly Language Programming](https://chortle.ccsu.edu/AssemblyTutorial/index.html).

3. **N64 ROM Structure**:
   - Familiarize yourself with the iNES header and N64-specific format.
   - Resource: [N64 ROM Format](http://n64devkit.square7.ch/articles.htm).

## Project Steps

### Step 1: Set Up the Environment
1. Install the tools listed above (GCC, MIPS assembler, and optionally a hex editor).
2. Verify the tools are working:
   ```bash
   gcc --version
   mips-linux-gnu-as --version
   ```

### Step 2: Parse ROM Metadata in Assembly
1. Write MIPS assembly functions to:
   - Extract the ROM size (offset 0x18).
   - Extract the game title (offset 0x20, 20 bytes).
   - Parse the region code (offset 0x3C).
2. Save the assembly code in a file, e.g., `rom_utils.s`.

### Step 3: Compile and Run
1. Compile the assembly code:
   ```bash
   mips-linux-gnu-as -o rom_utils.o rom_utils.s
   ```
2. Compile and link the C program:
   ```bash
   gcc -o rom_parser rom_parser.c rom_utils.o
   ```
3. Run the program:
   ```bash
   ./rom_parser
   ```

### Step 4: Test with N64 ROMs
1. Test with a legal or homebrew ROM file (e.g., `game.n64`).
2. Validate the extracted metadata.

### Optional: Add More Features
- Extract and display other fields from the ROM header.
- Visualize ROM data (e.g., ASCII art for textures).

## Additional Resources
- **MIPS Instruction Reference**: [MIPS Green Sheet](https://inst.eecs.berkeley.edu/~cs61c/fa17/img/mips-green-sheet.pdf).
- **N64 Development Wiki**: [N64 Dev Resources](https://n64devkit.square7.ch/).
- **Hex Editors**:
  - Linux: [hexedit](https://linux.die.net/man/1/hexedit).
  - macOS: [Hex Fiend](https://ridiculousfish.com/hexfiend/).
- **Cross Compilation**:
  - [GCC Cross-Compilation Guide](https://preshing.com/20141119/how-to-build-a-gcc-cross-compiler/).

## Timeline
1. **Evening 1**: Set up tools, write the assembly function for ROM size extraction.
2. **Evening 2**: Write C integration and test ROM size parsing.
3. **Evening 3**: Add more metadata extraction (e.g., title, region).

## Expected Output
For a sample ROM:
```
Game Title: THE LEGEND OF ZELDA
ROM Size: 32 MB
Region: USA
```

Enjoy exploring the world of N64 ROMs!

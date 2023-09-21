# x86-64 Assembly

Example of x86-64 assembly language programs.

These programs are solutions to many of the suggested projects in the book "x86-64 Assembly Language Programming with Ubuntu" by Ed Jorgensen. Only problems that I felt contributed to my understanding of the material are included. The code is not perfectly written nor well commented, however all solutions give the correct result when viewed through a debugger.

Please click the ☆ button on GitHub if this repository is useful or interesting. Thank you!

## Instructions

1. Download the source code.
2. `cd example-x86-64`
3. `yasm -g dwarf2 -f elf64 -o <object_file_name>.o <assembly_file_name>.s`
4. `ld -g -o <executable_file_name> <object_file_name>.o`
5. `gdb <executable_file_name>`

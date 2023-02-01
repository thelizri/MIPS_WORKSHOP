# Tutorials
1. Print Hello World  
2. Use of simple control structures. **if** statements, **if-else** statements
2. How to create a **For Loop**  
3. How to create a **Method/Function**  
4. How to create a **Macro**
5. How to access/manage memory
6. How to access methods from another file
7. How to look up syscalls and instructions


## MARS Simulator Tips
The mars simulator has a list of instructions, pseudo-instructions, and syscalls.  
You can either press F1, or press help in the navigation bar.

## Syscalls
Step 1. Load the service number in register $v0.  
Step 2. Load argument values, if any, in $a0, $a1, $a2, or $f12 as specified.  
Step 3. Issue the SYSCALL instruction.  
Step 4. Retrieve return values, if any, from result registers as specified.  

## Important Registers  
$gp - is a pointer to the global memory. Used with heap allocations.  
$sp - is the stack pointer. Used to keep track of the beginning of the data for this method.  
$ra - return address: a pointer to the address to use when returning from a method/function.  

## Calling subprograms  
**jal Label** will jump to specified label, and add the address of the next row to the **$ra** register.  
At then end of our subprogram we write: **jr $ra**. It will transfer us back to our return address.

## Types of Memory
- **Reserved** - This is memory which is reserved for the MIPS platform. Memory at these  
addresses is not useable by a program.  
- **Program text** - (Addresses 0x0040 0000 - 0x1000 00000) This is where the machine  
code representation of the program is stored. Each instruction is stored as a word (32 bits  
or 4 byte) in this memory. All instructions fall on a word boundary, which is a multiple  
of 4 (0x0040 0000, 0x0040 0004, 0x0040 0080, 0x0040 00B0, etc).  
- **Static data** - (Addresses 0x1001 0000 - 0x1004 0000) Static data is defined using   
the .data assembler directive. The size of the elements in this section are assigned   
when the program is created (assembled and linked), and cannot change during the   
execution of the program.   
- **Heap** - (Addresses 0x1004 0000 - until stack data is reached, grows upward) Heap is  
dynamic data which is allocated on an as-needed basis at run time. How this memory is allocated  
and reclaimed is language specific. Data in heap is always globally available.  
- **Stack** – (Addresses 0x7fff fe00 - until heap data is reached, grows downward) The  
program stack is dynamic data allocated for subprograms via push and pop operations.  
All method local variables are stored here. Because of the nature of the push and pop  
operations, the size of the stack record to create must be known when the program is  
assembled.
- **Kernel** - (Addresses 0x9000 0000 - 0xffff 0000) - Kernel memory is used by the  
operating system, and so is not accessible to the user.


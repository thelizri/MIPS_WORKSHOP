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

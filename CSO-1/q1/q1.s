.text
.global divide
.global rem

divide:
    cmpq $0, %rdi
    jl .negative1
    
.L:
    cmpq $0, %rsi
    jl .negative2

.L0:
    movq $0, %rax       # assigning 0 to a register
    cmpq %rax, %rsi     # comparing that register with 2nd argument   
    je .enddiv          # jumping to enddiv loop if they are equal
    movq %rsi, %rbx     # moving 2nd argument to a register
    cmpq %rbx, %rdi     # comparing that register with 1st argument
    jge .L1             # jumping to the loop L1 if they are greater than or equal to
    ret
.L1:
    subq %rbx, %rdi     # subtracting a with b and storing in a
    incq %rax           # incrementing q
    cmpq %rbx, %rdi     # checking condition
    jge .L1             # going to loop if condition satisfied
    ret

.enddiv:
    movq $(-1), %rax      # returning -1 if 2nd argument is 0
    ret

.negative1:
    imulq $(-1), %rdi
    cmpq $0, %rdi
    jg .L

.negative2:
    imulq $(-1), %rsi
    cmpq $0, %rsi
    jg .L0


rem:
    cmpq $0, %rsi       # comparing 0 with 2nd argument
    je .endrem          # going to endrem loop if equal
    movq %rsi, %rbx     # moving 2nd argument to a register a
    movq %rdi, %rax     # moving 1st argument to a register b
    cmpq %rbx, %rax     # comparing those two variables
    jge .L2             # jumping to loop L2 if greater than or equal to
    ret
    
.L2:
    subq %rbx, %rax     # subtracting a with b and storing in a
    cmpq %rbx, %rax     # comparing
    jge .L2             # going to loop if greater than or equal to
    ret

.endrem:
    movq $(-1), %rax      # returning -1 if not giving expected inputs
    ret


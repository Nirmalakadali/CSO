.global primecheck
primecheck:
    movq $2, %rbx       #initalising i as 2
    cmpq $2, %rdi       #compare n and 2
    je .L5              #if equal jump to .L5
    cmpq $1, %rdi       #compare 1 and n
    jle .L3             #if less than or equal jump to .L3
.L2:
    movq %rdi, %rax     #copying n to a variable
    cqto                #Sign-extend to upper 8 bytes of dividend
    idivq %rbx          #division of n and i
    movq %rax, %r10     #quotient is stored in %rax which is copied to %r10
    movq %rdx, %r11     #remainder is stored in %rdx which is copied to %r11
    cmpq $0, %r11       #if remainder is equal to 0, return 0
    je .L4              #used jump statement to return 0
    movq $1, %rax       #copying 1 onto %rax
    incq %rbx           #increment of i
    cmpq %rbx, %rdi     #compare i and n
    jg .L2              #if n greater than i continue loop
    rep; ret            #repeat and return 1 here is not interuppted between
.L3:
    movq $-1, %rax      #copies -1 to %rax
    ret                 #returns %rax
.L4:
    movq $0, %rax       #copies 0 to %rax
    ret                 #returns 0 
.L5:
    movq $1, %rax       #copies 1 to %rax
    ret                 #returns %rax

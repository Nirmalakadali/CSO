.global Next_Greatest_element
Next_Greatest_element:
    movq    $0,%r8                          # initialise stack size to 0
    movq    $0, %rax                        #initialise rax register with 0
    pushq   %rax                            #pushing first eleemnt into the stack
    incq    %r8                              #i++
    movq    $1,%rcx                          # %rcx = i 

.Loop:
    cmpq     %rdx,%rcx                       # if i<n
    jl      .L1                              # jump to L1 
    jmp     .L6							     # jump to l6 if i>n

.L1:
    cmpq    $0,%r8                           #comparing i with 0
    jg      .L2                              #if i greater than 0 it jumps to L2
    jmp     .L4                              #jumps to L4 if i is less than 0

.L2:
    movq    (%rsp),%r9                      #temp = %r9
    movq    (%rdi, %rcx, 8),%r10            #a[i] = %r10
    cmpq     %r10, (%rdi, %r9, 8)			#compare a[stk.top()] : a[i]
    jl      .L3                             #jumps to L3  if a[stk.top()] < a[i]
    jmp     .L4                             #jumps to L4  if a[stk.top()] >a[i]


.L3:
    movq    %rcx,(%rsi,%r9,8)               #moving a[i] into the ans[stk.top()] ==> ans[stk.top()]=a[i]
    popq    %r11                            #poping the element which was present in the top of the stack
    decq    %r8                             #going down to the stack by popping smallest element and setting greatest eleemtn at their indexes
    jmp     .L1                             #jumps to L1 

.L4:
    pushq   %rcx                            #pushing index of the element into stack
    incq    %r8                             #incrementing i++
    incq    %rcx                            #increasing the index of the stack
    jmp     .Loop                           #jumps to loop

.L6:
    cmpq    $0,%r8                           #comparing i with 0
    jg      .L7                              #jumps to L7 if i>0
    jmp     .L10                             #jumps to L10 if i<0 or i>=n

.L7:
    movq    (%rsp),%r9                       #temp=%9
    movq    $-1,(%rsi,%r9,8)                 #a[i]=-1
    popq    %r11                             #removing the greater element after assigning -1 to it
    decq    %r8                              #going down to the stack
    jmp     .L6                               #jumps to L6

.L10:
    ret                                       #exiting the function

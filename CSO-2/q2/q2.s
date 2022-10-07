.global Answer                # declaring the function name 
Answer:                       # opening the function to write code
  pushq %rbp                  # stack frame pointer so it can be returned to the end of the function
  movq %rsp, %rbp             # moves the current stack position into the rsp so the value of esp never changes
  pushq %rbx                  
  subq $24, %rsp              #allocating 24 bytes to stack
  movl %edi, -20(%rbp)        #int F
  movl %esi, -24(%rbp)        #int S
  movl -24(%rbp), %eax        #moving S into eax register
  cltd                        #converting s into double long  
  movl %edx, %eax             #moving converted s into the another register
  xorl -24(%rbp),%eax         #set eax to the most significant bit of S
  subl %edx,%eax              #eax=eax-edx
  cmpl -20(%rbp), %eax        #comparing F and S
  jle .L2                     #if s is less than or equal to f then go to the next if condition
  movl $0, %eax               #returning 0
  jmp .L3                     #jumping to end of the function
.L2:                          #if condition
  cmpl $1, -20(%rbp)          #checking if F==1
  jne .L4                     #if F!=1 then jumps to the next if condition
  cmpl $0, -24(%rbp)          #cheking S==0 or not
  jne .L4                     #if S!=0 then jumps to the next if condition
  movl $2, %eax               #moving 2 into the final register
  jmp .L3                     #jumping to end of the function
.L4:                          #third if condition
  cmpl $1, -20(%rbp)          #checking f==1 or not
  jne .L5                     #if not equal to 1 then jumps to final return value               
  movl -24(%rbp),%eax         #moving S into eax register
  cltd                        #converting s into double long 
  movl %edx, %eax             #moving converted s into the another register
  xorl -24(%rbp),%eax         #set eax to the most significant bit of S
  subl %edx,%eax              #eax=eax-edx
  cmpl $1, %eax               #checking S ==1 or not          
  jne .L5                     #if S!=1 then jumps to final return value 
  movl $1, %eax               #if S==1 and F==1 then retuens the value i.e., it storing 1 into final register that means true
  jmp .L3                     #jumping to L3 to exiting the function
.L5:                          #final recursive condition
  movl -24(%rbp), %eax        #stores the value in accumalate registor into the base pointer with allocating memory for four bits
  leal 1(%rax), %edx          #loads effective address of edx and stores address in rax and adds the value in that address with one
  movl -20(%rbp), %eax        #also moving s into base pointer with decreasing available memory
  subl $1, %eax               #subtracting a from f
  movl %edx, %esi             #here moving s-1 into the function's second parameter
  movl %eax, %edi             #here moving F+1 into the function's first parameter
  call Answer                 #call answer function after allocating first and second parameter
  movl %eax, %ebx             
  movl -20(%rbp), %eax       #moving present value in register into the base pointer
  leal -1(%rax), %edx        #loads effective address from edx means F and subtracts with -1
  movl -24(%rbp), %eax       #moving presnt value at the top of the base pointer  that means s
  movl %eax, %esi            #moving second parameter s from esi 
  movl %edx, %edi            #moving first parameter f from edi register
  call Answer                #calling answer function recursively with allocating first and second parameter
  addl %eax, %ebx            #adding both values one is present in base pointer and another is just runned without going into the base pointer
  movl -24(%rbp), %eax       #just calling the past value which is in place of second parameter and moving it into the base pointer
  leal -1(%rax), %edx        #subtracting the -1 from second paramater value which was in base pointer
  movl -20(%rbp), %eax       #now moving the past value which was satisifying the first paramter position and moving into above the base pointer
  subl $1, %eax              #f-1
  movl %edx, %esi            #s value
  movl %eax, %edi            #f value
  call Answer                #calling answer function recursively with allocating s and f values
  addl %eax, %ebx            #adding the past two recursive function value with present recursive function value
  movl -20(%rbp), %eax       #moving present value in register into the base pointer
  leal -1(%rax), %edx        #loads effective address from edx means F and subtracts with -1
  movl -24(%rbp), %eax       #moving presnt value at the top of the base pointer  that means s
  movl %eax, %esi            #moving second parameter s from esi 
  movl %edx, %edi            #moving first parameter f from edi register
  call Answer                #calling answer function recursively with allocating first and second parameter
  addl %ebx, %eax            #adding all the values obtained using recursive answer function
  movl %eax, res(%rip)       #allocating memory what does we give for res in initialization
  movl res(%rip), %eax       #storing the result
.L3:
  addq $24, %rsp
  popq %rbx
  popq %rbp                    #closing the function
  ret                          

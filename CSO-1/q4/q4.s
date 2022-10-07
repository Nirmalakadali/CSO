.text
.global lpf

lpf:
    cmpq $1, %rdi       # comparing N with 1
    je .one             # jump to loop one if equal to
    jl .error           # jump to loop error if less than
    movq $2, %r10       # moving 2 to a register (variable div)
    cmpq $0, %rdi       # comparing N with 0
    jne .L1             # jump to loop L1 if not equal to

.L1:
    movq %rdi, %rax     # moving N to rax register
    cqto                # sign extend to upper 8 bytes of dividend
    idivq %r10          # dividing with variable div
    cmpq $0, %rdx       # comparing remainder we got with 0
    jne .L2             # jump to loop L2 if not equal to
    movq %rdi, %r11     # move N to a register r11 (M = N)
    movq %rdi, %rax     # move N to the rax register
    cqto                # sign extend to upper 8 bytes of dividend
    idivq %r10          # dividing N with variable div
    movq %rax, %rdi     # moving N to rax register
    cmpq $1, %rdi       # comparing N with 1
    je .L3              # jump to loop L3 if equal to
    cmpq $0, %rdi       # comparing N with remainder after dividing N with variable div
    jne .L1             # jump to loop L1 if not equal to

.L2:
    incq %r10           # incrementing variable div
    jmp .L1             # jump to loop L1

.L3:
    movq %r11, %rax     # returning M (r11 register)
    ret 

.one:
    movq $1, %rax       # returning 1 if N is 1 initially
    ret

.error:
    movq $-1, %rax      # returning -1 if not giving expected inputs
    ret

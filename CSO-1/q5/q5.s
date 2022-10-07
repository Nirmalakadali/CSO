# sum in %rax, N in %rdi 

.global sumofsquares

sumofsquares:
 cmpq $0, %rdi
			jl .L1
            movq %rdi, %rax 	# Here sum is being assigned the value N ,i.e; sum = N
            addq $1, %rax 		# sum = sum + 1
			movq %rax, %rdx 	# tempvar = sum
			addq %rdi, %rax 	# sum = sum + N
			imulq %rdi, %rax 	# sum = sum*N
			imulq %rdx, %rax 	# sum = sum*(tempvar)
			cqto 				# sign extend rax to rdx:rax
			movq $6, %rsi 
			idivq %rsi 			# sum = sum/6
			ret 				# value returned will be N*(N+1)*(2*N+1)/6
			
			
.L1:
   movq $-1,%rax
   ret		

.global GCD
/*
 %rdi contains the value of M
 %rsi contains the value of N
 %r8 and %r9 are helper registers */

GCD:
	/* Case - 1: If M = 0, then returning N, if N > 0, else -N */
	cmp $0, %rdi 			/* Comparing 0 with M */
	cmove %rsi, %r8			/* Moving N into a helper register */
	je .l1					/* If M  is equal to 0, then storing the absolute value of N */			

	/* Case - 2: If N = 0, then returning M, if M > 0, else -M */
	cmp $0, %rsi			/* Comparing 0 with N */
	cmove %rdi, %r8			/* Moving M into a helper register */
	je .l1					/* If N is equal to 0, then storing the absolute value of M */

	cmp %rsi, %rdi			/* Comparing M and N */
	
	/* Case - 3: If M >= N */
	cmovge %rdi, %rax		/* If M is greater than or equal to N, then move M into the accumulate the register for division purposes later on */
	cmovge %rsi, %r9		/* And move N into a helper register */
	
	/* Case - 4: If M < N, sending values after swapping M and N */
	cmovl %rsi, %rax		/* If M is less than N, then move N into the accumulate register for division purposes later on */
	cmovl %rdi, %r9			/* And move M into a helper register */
	
	jmp .l2					/* Start finding the GCD */

/* Returning the absolute value */
.l1:
	cmp $0, %r8				/* Comparing 0 with the value in the helper register */
	jl .l11					/* If the value is less than 0, then negate it */
	jge .l12				/* Else return the value */

.l11:
	imul $(-1), %r8			/* Multiplying -1 with the value in the helper register */
	jmp .l12				/* Return this value */

.l12:
	mov %r8, %rax			/* Move the value in helper register to the accumulate register for returniong purposes */
	ret						/* Return the value */

/* Finding the GCD using Euclid's algorithm */
.l2:
	cqto					/* Converting the quad word into octo word */
	idivq %r9				/* Performing division; the quotient is stored in the accumulate register and the remainder in the data register */
	mov %r9, %rax			/* Move the value in the helper register into the accumulate register */
	mov %rdx, %r9			/* Move the remainder into the helper register */
	cmp $0, %r9				/* Comparing 0 with the value in the helper register */
	jne .l2					/* Loop again if they are not equal */
	cmove %rax, %r8			/* If they are equal, move the value in the accumulate register into another helper register for returning the absolute value */
	je .l1					/* If they are equal, return the absolute value */


    
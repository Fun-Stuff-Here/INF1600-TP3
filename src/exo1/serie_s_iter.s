.text
.globl serie_s_iter

serie_s_iter:
	# Prologue
	pushl  	%ebp
	movl   	%esp, %ebp
	pushl 	%ebx

	# premieres 2 conditions
	movl 	0x8(%ebp), %ecx	# fetch le parametre 
	cmp 	$0, %ecx		# if (n == 0)  
	je 		N0
	cmp 	$1, %ecx		# if (n == 1) 
	je 		N1

	# init
	movl 	$0, %eax		# t
	movl 	$1, %ebx		# p = 1
	movl 	$2, %edx		# c = 2
	dec 	%ecx			# met le bon nombre d'iteration de la loop

FOR:
	movl 	%edx, %eax		# t = c
	inc 	%edx			# c = 1 + ...
	addl 	%ebx, %edx		# c + p
	movl 	%eax, %ebx		# p = t
	loop 	FOR				# loopy loop
	
	movl 	%edx, %eax		# return c
	jmp 	Retour			

N0:
	movl   $1, %eax			# return 1
	jmp    Retour     

N1:
	movl   $2, %eax			# return 2
	jmp    Retour   

Retour:   
	pop    %ebx
	leave
	ret

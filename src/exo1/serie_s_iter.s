.text
.globl serie_s_iter
serie_s_iter:
	pushl  %ebp
	movl   %esp, %ebp
	pushl %ebx

	# completer

	movl 8(%ebp), %ecx			# fetch le parametre 

	cmp $0, %ecx					# if n ==1 
	je N0

	cmp $1, %ecx					# if n ==1 
	je N1

	subl $1, %ecx					# met le bon nombre d'iteration de la loop

	movl $0, %eax					# t;
	movl $1, %ebx					# p=1;
	movl $2, %edx					# c=2;

FORLOOP:
	movl %edx, %eax				# t=c;
	addl $1, %edx					# c= 1 + ...
	addl %ebx, %edx				# c+p;
	movl %eax, %ebx				# p=t;
	loop FORLOOP					# loopy loop
	movl %edx, %eax				# return c
	jmp Retour						# //

	# code founie
N0:
	movl   $1, %eax
	jmp    Retour     

N1:
	movl   $2, %eax
	jmp    Retour   

Retour:   
	pop    %ebx
	leave
	ret

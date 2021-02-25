.text
.globl serie_s_rec
serie_s_rec:
   pushl  %ebp
   movl   %esp, %ebp
	pushl %ebx
   
   movl 8(%ebp), %ebx				# parameter n

	cmp $0, %ebx						# if n==0
	je N0

	cmp $1, %ebx						# if n==1
	je N1

	dec %ebx								# n-1
	pushl %ebx							# parametre n-1
	call serie_s_rec 					# reserie_s_rec(n-1)
	addl $4, %esp						# remet esp avant les parametre

	addl $1, %eax						# 1 + reserie_s_rec(n-1) +...
	pushl %eax							# sauvegarde le resultat intermediaire

	dec %ebx								# n-2
	pushl %ebx							# parametre n-2
	call serie_s_rec 					# reserie_s_rec(n-2)
	addl $4, %esp						# remet esp avant les parametre

	popl %edx							# met le resultat intermediaire dans edx
	addl %edx, %eax					# 1 + reserie_s_rec(n-1) + reserie_s_rec(n-2)
	jmp Retour							# fin
   
N0:
   movl   $1, %eax
   jmp    Retour     
   
N1:
   movl   $2, %eax
   jmp    Retour   
   
Retour:
	popl %ebx
   leave
   ret


.data
        factor: .float 10.0   		# utiliser pour diviser par 10

.text
.globl	_ZN8Etudiant10moyenneasmEv

_ZN8Etudiant10moyenneasmEv :
	# Prologue
	pushl %ebp					
	movl %esp, %ebp				
	
	# init
	pushl %ebx
	movl 0x8(%ebp), %ebx		# met this dans ebx
	movl $10, %ecx				# i= 10, nombre d'iteration
	fldz						# som =0; 

FOR:
	fadd (%ebx,%ecx,4) 			# som += tabnotes[i]
	loop FOR

	fdiv factor					# som/10
		
RETOUR:
	popl %ebx
	leave						
	ret							

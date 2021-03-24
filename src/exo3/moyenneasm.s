.data
        factor: .float 10.0 /* utilisez ca pour diviser par 10*/

.text
.globl	_ZN8Etudiant10moyenneasmEv

_ZN8Etudiant10moyenneasmEv :
	pushl %ebp				
	movl %esp, %ebp					
	pushl %ebx
	
	movl 8(%ebp), %ebx				# met this dans ebx
	movl $10, %ecx					# i = 10, nombre d'iteration
	fldz							# som = 0; 

FORLOOP:
	fadd (%ebx,%ecx,4) 				# som += tabnotes[i]
	loop FORLOOP

	fdiv factor						# som / 10
		
RETOUR:
		popl %ebx
		leave						
		ret						




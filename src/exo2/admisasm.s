.data
        factor: .float 2.0 			# pour diviser par 2

.text
.globl	_ZN8Etudiant8admisasmEv

_ZN8Etudiant8admisasmEv:
	# Prologue
	push %ebp      				
	mov %esp, %ebp 				

	# init
	movl 8(%ebp), %eax				# met this dans eax

	# trouve la moyenne
	pushl %eax						# envoie this en parametre
	call _ZN8Etudiant10moyenneasmEv # appel moyennecpp() 

	# compare la moyenne
	pushl $10
	fild (%esp)
	fcomi %st(1)					# if (moyenne >=10)
	ja REFUS

ADMIS:
	movl $1, %eax					# return 1
	jmp FIN

REFUS:
	movl $0, %eax					# return 0
	
FIN:
	leave					
	ret
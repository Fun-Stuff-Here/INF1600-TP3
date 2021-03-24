
.text
.globl	_ZN18EtudiantEnMaitrise8admisasmEv

_ZN18EtudiantEnMaitrise8admisasmEv:
	# Prologue
	push %ebp      
	mov %esp, %ebp 
	pushl %ebx

	# init
	movl 8(%ebp), %ebx				# met this dans ebx

	# trouve la moyenne
	pushl %ebx						# envoie this en parametre
	call _ZN8Etudiant10moyenneasmEv # appel moyennecpp() 

	# compare la moyenne
	pushl $10
	fild (%esp)
	fcomi %st(1)					# if (moyenne >=10)
	ja REFUS

	# compare la note_memoire
	movl $36, %eax					# size of etudiant
	fld (%ebx,%eax,4)				# load attribut de EtudiantMaitrise
	fcomi %st(1)	 				# if (note_memoire >=10)
	jb REFUS


ADMIS:
	movl $1, %eax					# return 1
	jmp FIN

REFUS:
	movl $0, %eax					# return 0
FIN:
	popl %ebx
	leave
	ret					


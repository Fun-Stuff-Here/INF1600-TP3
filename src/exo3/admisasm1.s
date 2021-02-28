
.text
.globl	_ZN18EtudiantEnMaitrise8admisasmEv

_ZN18EtudiantEnMaitrise8admisasmEv:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	pushl %ebx

	movl 8(%ebp), %ebx			# met this dans ebx

	pushl %ebx				# envoie this en parametre
	call _ZN8Etudiant10moyenneasmEv 	# appel moyennecpp() 

	pushl $10
	fild (%esp)
	fcomi %st(1)				# if (moyenne >=10)
	ja REFUS

	# movl (%ebx), %ecx 
	# cmp $10, %ecx	 			# if ((note_memoire >=10))
	# jb REFUS

ADMIS:
	movl $1, %eax				# return 1
	jmp FIN

REFUS:
	movl $0, %eax				# return 0
FIN:
	popl %ebx
	leave					/* restore ebp and esp */
	ret					/* return to the caller */


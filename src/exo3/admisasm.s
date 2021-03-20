.data
        factor: .float 2.0 /* use this to divide by two */

.text
.globl	_ZN8Etudiant8admisasmEv

_ZN8Etudiant8admisasmEv:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */

	movl 8(%ebp), %eax			# met this dans eax

	pushl %eax				# envoie this en parametre
	call _ZN8Etudiant10moyenneasmEv 	# appel moyennecpp() 

	pushl $10
	fild (%esp)
	fcomi %st(1)				# if (moyenne >=10)
	ja REFUS
ADMIS:
	movl $1, %eax				# return 1
	jmp FIN

REFUS:
	movl $0, %eax				# return 0
FIN:
	leave					/* restore ebp and esp */
	ret					/* return to the caller */

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

	movl $10, %edx	# comparaison icitte a faire marche
	fld %edx
	fucomp %st(1)				# if (moyenne >=10)
	jb REFUS
ADMIS:
        movl $1, %eax				# return 1
        jmp FIN

REFUS:
        movl $0, %eax				# return 0
FIN:    
	movl %edx, %eax
        leave					/* restore ebp and esp */
        ret					/* return to the caller */

.text
.globl serie_s_iter
serie_s_iter:
   pushl  %ebp
   movl   %esp, %ebp
   
   # completer
   # ici
   # making sure pull request works well
   
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


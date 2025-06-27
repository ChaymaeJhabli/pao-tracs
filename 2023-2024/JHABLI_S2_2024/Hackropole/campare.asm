; On compare R5 et R6                                                       
CMP R5, R6
; La comparaison a positionné le drapeau Z que l’on teste
; Si Z vrai, on saute à la branche r5_r6_different
; sinon on saute à la branche r5_r6_equal
JZA r5_r6_different
JNZA r5_r6_equal
  
r5_r6_different:
   ; on arrive ici si drapeau Z vrai
   ; on colle 0 dans R0 et on s'en va à la fin
   MOV R0, #0
   JZA end
  
r5_r6_equal:
   ; on arrive ici si drapeau Z faux
   ; on colle 1 dans R0 et on s'en va à la fin
   MOV R0, #1
   JZA end
  
end:
   ; Arrêt du programme
   STP
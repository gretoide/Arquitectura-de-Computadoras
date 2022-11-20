.data
cadena: .asciiz "cadena"
result: .word 0

.code
daddi $t1,$zero,cadena
daddi $t2,$zero,10
loop: lbu $t3,0($t1)
daddi $t2,$t2,-1
bnez $t3,loop
daddi $t1,$t1,1
sd $t2,result($zero)
halt
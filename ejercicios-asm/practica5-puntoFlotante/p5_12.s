;12)El siguiente programa espera usar una subrutina que calcule en forma recursiva el factorial de un número entero: 

.data
valor: .word 3	
result: .word 0

.code	
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila	
ld $a0, valor($zero)
ld $a1, valor($zero)
jal factorial	
sd $v0, result($zero)	
halt	
	
factorial: daddi $a1,$a1,-1
	beqz $a1,fin
	dmul $a0,$a0,$a1 ;3*2*1 = 6
    j factorial
fin: sd $v0,0($a0)
jr $ra	

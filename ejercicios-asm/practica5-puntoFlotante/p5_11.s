;11)Escribir una subrutina que reciba como argumento una tabla de números terminada en 0. La subrutina debe contar la 
;cantidad de números que son impares en la tabla. Ésta condición se debe verificar usando la subrutina ES_IMPAR. La 
;subrutina ES_IMPAR debe devolver 1 si el número es impar y 0 si no lo es. 
.data
tabla: .word 1,2,2,2,3,0
resultado: .word 0
.text
daddi $sp,$zero,0x400 ;puntero de tope de pila
daddi $a0, $zero, tabla ;argumento de tabla

jal subContar ; 
sd $v0,resultado($zero)
halt

;subrutina
subContar: daddi $sp,$sp,-8 ;reservamos valor en la pila
	sd $ra,0($sp) ;guardamos la direccion de retorno de la subrutina
	
    loop: lbu $a1,0($a0) ;nos quedamos con el numero
    beqz $a1,fin ;comparamos si llegamos a 0
    jal esImpar ;llama a la subrutina
    beqz $v1,sumo ;si no es 0, es impar
    daddi $a0,$a0,8 ;avanzo
    j loop ;vuelvo al loop
    
    sumo: daddi $v0,$v0,1 ;sumamos uno al contador de numeros pares
    daddi $a0,$a0,8 ;avanzo 
    j loop
    
    fin: ld $ra,0($sp) ;desapilamos
    daddi $sp,$sp,8
    jr $ra
    
;subrutina2
esImpar: dadd $v1,$zero,$zero ;reinicio flag
		daddi $t0,$zero,1 ;inicializo en 1
		and $v1,$a1,$t0 ;guardamos en v1 el resultado del and
        jr $ra
   

















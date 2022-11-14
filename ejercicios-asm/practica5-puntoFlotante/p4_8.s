;8) *Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y 
;retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1. 

.data
cadena1: .asciiz "ho1a0"
cadena2: .asciiz "hola0"
result: .word 0

.code
;cargamos argumentos
daddi $a0,$zero,cadena1 ;cargamos las direcciones de los inicios de las cadenas
daddi $a1,$zero,cadena2

jal compara
sd $v0,result($zero) ;guardamos el resultado retornado por la subrutina
halt

;subrutina
compara: daddi $v0,$zero,1 ;inicializamos en 1, por si justo es en la primera

    loop: lbu $t0,0($a0) ;cargamos caracter cadena 1
    lbu $t1,0($a1) ;cargamos caracter cadena 2
    beqz $t0,finalA0 ;*si la cadena de arriba llega a su fin, sale
    beqz $t1,final ;si la primera no termina, pero la segunda si, no tienen nada en común
    bne $t0,$t1,final ;si no son iguales, sale
    daddi $v0,$v0,1 ;aumenta en 1 la posicion
    daddi $a0,$a0,1 ;avanza al siguiente caracter de la cadena 1
    daddi $a1,$a1,1 ;avanza al siguiente caracter de la cadena 2
    j loop

    finalA0: bnez $t1,final ;corroboramos que la 2da haya terminado
        daddi $v0,$zero,-1 ;son iguales
    final: jr $ra
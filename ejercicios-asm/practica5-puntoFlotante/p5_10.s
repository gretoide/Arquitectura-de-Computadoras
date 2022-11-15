;10) Usando la subrutina escrita en el ejercicio anterior, escriir la subrutina CONTAR_VOC, 
;que recibe una cadena terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.

.data
cadena: .asciiz "somos unos capos" ; 6 vocales
fin: .byte 0
vocales: .asciiz "AEIOUaeiou"
resultado: .word 0

.code
;declaramos pila
daddi $sp,$zero,0x400 ;le decimos al sp su tope de pila

;pasamos argumentos a la subrutina
daddi $a0,$zero,cadena ;direccion de nuestra cadena
daddi $a1,$zero,vocales

;llamamos subrutina
jal contarVoc

;retorno subrutina
sd $v0,resultado($zero)
halt

;subrutina que cuenta las vocales
contarVoc: daddi $sp,$sp,-8 ;reservamos valor en la pila
	sd $ra,0($sp) ;guardamos la direccion de retorno de la subrutina
    dadd $v0,$zero,$zero ;inicializamos contador de vocales
    ;subrutina
  lazo: lbu $a2,0($a0) ;copiamos valor de nuestra cadena
  	beqz $a2,fin
    jal esVocal
    bnez $v1,suma ;si no es cero quiere decir que es vocal
    daddi $a0,$a0,1
    j lazo
    
    suma: daddi $v0,$v0,1
    daddi $a0,$a0,1
    j lazo
    
    fin: ld $ra,0($sp) ;desapilamos
    daddi $sp,$sp,8
    jr $ra

;subrutina que analiza vocales
esVocal: dadd $v1,$zero,$zero ;inicializa si no es vocal
	dadd $t2,$zero,$a1 ;le mandamos puntero inicial
    
    loop: lbu $t1,vocales($t2) ;carga la nueva vocal
    beqz $t1, fin ;si nuestro caracter es 0, fin de cadena
    beq $a2,$t1,es ;compara si es vocal, salta y retorna 1
    daddi $t2,$t2,1 ;siguiente elemento
    j loop ;vuelve al loop

    es: daddi $v1,$zero,1 ;es vocal
    fin: jr $ra ;termina

;subrutina que analiza vocales
esVocal: dadd $v1,$zero,$zero ;inicializa si no es vocal
	dadd $t2,$zero,$a1 ;le mandamos puntero inicial
    
    loop: lbu $t1,vocales($t2) ;carga la nueva vocal
    beqz $t1, fin ;si nuestro caracter es 0, fin de cadena
    beq $a2,$t1,es ;compara si es vocal, salta y retorna 1
    daddi $t2,$t2,1 ;siguiente elemento
    j loop ;vuelve al loop

    es: daddi $v1,$zero,1 ;es vocal
    fin: jr $ra ;termina
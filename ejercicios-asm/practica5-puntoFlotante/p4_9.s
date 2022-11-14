;9) *Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, ya sea mayúscula o minúscula. La 
;rutina debe recibir el caracter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario. 

.data
control: .word 0x10000
data: .word 0x10008
vocales: .asciiz "AEIOUaeiou"
resultado: .word 0

.code
;cargamos direcciones para el ingreso de un dato
ld $s0,control($zero)
ld $s1,data($zero)

;leemos caracter
daddi $t0,$zero,9 ;con el valor 9 leemos caracteres
sd $t0,0($s0) ;guardamos en control el 9 (para que lea)
;argumentos subrutina
lbu $a0,0($s1) ;copiamos el caracter de data a $a0 para enviarlo a la subrutina
;llama a subrutina
jal esVocal
sd $v0, resultado($zero)
halt


;subrutina
esVocal: dadd $v0,$zero,$zero ;inicializa si es vocal
    dadd $t0,$zero,$zero ;inidice de cadena

    loop: lbu $t1,vocales($t0) ;carga la nueva vocal
    beqz $t1, fin ;si nuestro caracter es 0, fin de cadena
    beq $a0,$t1,es ;compara si es vocal, salta y retorna 1
    daddi $t0,$t0,1 ;siguiente elemento
    j loop ;vuelve al loop

    es: daddi $v0,$zero,1 ;es vocal
    fin: jr $ra ;termina





















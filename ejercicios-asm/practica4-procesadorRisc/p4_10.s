; 10) Escribir un programa que cuente la cantidad de veces que un 
;   determinado caracter aparece en una cadena de texto. Observar
;   cómo se almacenan en memoria los códigos ASCII de los caracteres 
;   (código de la letra “a” es 61H). Utilizar la instrucción lbu
;   (load byte unsigned) para cargar códigos en registros. 
;    La inicialización de los datos es la siguiente: .data
;   cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
;   car: .asciiz "d" ; caracter buscado
;   cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar 
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena. (8)

.code
;cargo variables
daddi $t4, $zero, 0  ;1)inicializo en 0 el puntero de la cadena
daddi $t5, $t5, 16 ;cantidad de caracteres de la cadena (para decrementar)
daddi $a0, $zero, cadena ;2)copio la direccion de cadena en $a0
ld $t2, car($zero) ;caracter a  buscar
ld $t1, cant($zero) ;contador de repeticiones
dadd $t4, $a0, $zero ;3)copio la direccion de inicio de la cadena (para ir sacando caracteres)

;loop que recorre la cadena
loop: lbu $t6, 0($t4) ;4) saco de la cadena el primer caracter (guarda en $t6, desplazamientos 0, el valor de la direccion de $t4)
daddi $t4, $t4, 1  ;5) incremento para obtener el siguiente elemento 
daddi $t5, $t5, -1 ;decremento la longitud del string recorrida
beq $t6, $t2, suma  ;si son iguales
beqz $t5, fin  ;si llegamos a cero salta a fin
j loop

;suma de elementos iguales
suma: daddi $t3, $t3, 1
beqz $t5, fin  ; si es cero salta a fin; tambien se podria preguntar
j loop        ; si el ultimo caracter sacado es cero
nop
fin: halt
; bnez ; si no es cero "0"
; bnqz ; si es cero "0"
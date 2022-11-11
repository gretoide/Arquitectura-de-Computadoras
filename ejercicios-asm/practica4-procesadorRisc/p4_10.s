; 10) Escribir un programa que cuente la cantidad de veces que un 
; determinado caracter aparece en una cadena de texto. Observar
; cómo se almacenan en memoria los códigos ASCII de los caracteres 
; (código de la letra “a” es 61H). Utilizar la instrucción lbu
; (load byte unsigned) para cargar códigos en registros. 
; La inicialización de los datos es la siguiente: .data
; cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
; car: .asciiz "d" ; caracter buscado
; cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.data
cadena: .asciiz "adbdcdedfdgdhdid" ;cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
daddi r4, r4, 0  ; inicializo en cero
daddi r5, r5, 16  ; inicializo en 16
ld r1, cadena(r0) 
ld r2, car(r0) ; caracter a  buscar
ld r3, cant(r0); contador de repeticiones
loop: lbu r6, r1(r4) ; saco de la cadena el primer caracter
daddi r4, r4, 8  ; incremento para obtener el siguiente elemneto 
daddi r5, r5, -1 ; decremento la longitud del string
beq r6, r2, suma  ; si son iguales
beqz r5, fin  ; si es cero salta a fin
j loop
suma: daddi r3, r3, 1
beqz r5, fin  ; si es cero salta a fin
j loop
fin: halt
; bnez ; si no es cero "0"
; beqz ; si es cero "0"
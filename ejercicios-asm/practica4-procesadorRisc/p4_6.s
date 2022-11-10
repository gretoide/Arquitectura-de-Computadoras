;6) Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y 
;determine cuántos de ellos son iguales entre sí (0, 2 o 3). El resultado debe quedar almacenado
; en la dirección de memoria D. 

.data
a: .word 2 ; r1
b: .word 2 ; r2
c: .word 2 ; r3
d: .word 2 ; r4 inicializa en 2
.code
;cargamos variables
ld r1, a(r0) ;2
ld r2, b(r0) ;2
ld r3, c(r0) ;2
ld r4, d(r0) ;2
;comparamos
beq r1, r2, sumar1 ; si son iguales salta a sumar1, compara el último y termina de sumar
beq r2, r3, fin    ; si son iguales salta a fin, porque solo hay dos iguales
beq r1, r3, fin    ; si son iguales salta a fin
daddi r4, r4, -2   ;si llego hasta acá es porque ninguno es igual
j fin
sumar1: beq r1, r3, total ;hace la última comparación
j fin
total: daddi r4, r4, 1  ;suma 1, quedan 3 iguales
fin: halt
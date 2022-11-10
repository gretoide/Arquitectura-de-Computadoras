;6) Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y 
;determine cuántos de ellos son iguales entre sí (0, 2 o 3). El resultado debe quedar almacenado
; en la dirección de memoria D. 

.data
a: .word 2 ; r1
b: .word 1 ; r2
c: .word 2 ; r3
d: .word 0 ; r4
.code
;cargamos variables
ld r1, a(r0)
ld r2, b(r0)
ld r3, c(r0)
ld r4, d(r0)
;comparamos
bne r1,r2, dos
daddi r4,r4,1
dos: bne r2,r3, tres
daddi r4,r4,1
tres: bne r1,r3,fin
daddi r4,r4,1
fin: halt
 ;ANDA COMO QUIERE, NO SE GUIEN (?)
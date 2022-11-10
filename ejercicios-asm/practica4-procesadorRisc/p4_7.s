;7) * Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos
; son mayores que X. 
;El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además 
; otro arreglo llamado RES cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero 
;correspondiente en el arreglo TABLA 
;es mayor que X, 
;mientras que un ‘0’ indicará que es menor o igual. 


.data
tabla: .word 1,1,3,4,10,11,13,2,9,2
cant: .word 0
; x = 5
res: .word 0,0,0,0,0,0,0,0,0,0

.code
daddi r1,r1,0 ;puntero de tabla
ld r2,tabla(r0)
daddi r3,r3,0 ;contador de aciertos
daddi r4,r4,0 ;flag de la instruccion de "es menor"

comparacion: 



COMPARACION
si no es salTO A SIGUIENTE
    aumento cant
    sumo en tabla
siguiente valor
vuelvo a comparar

;7) * Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos
; son mayores que X. 
;El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además 
; otro arreglo llamado RES cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero 
;correspondiente en el arreglo TABLA 
;es mayor que X, 
;mientras que un ‘0’ indicará que es menor o igual. 


.data
tabla: .word 1,1,3,4,10,11,13,2,9,2 ;tabla original
res: .word 0,0,0,0,0,0,0,0,0,0 ;tabla nueva
cant: .word 0 ;cantidad de números mayores
busca: .word 5 ;numero a buscar
long: .word 10 ;puntero de tabla
.code
ld r1, long(r0) ;puntero de tabla
ld r2, busca(r0) ;valor a buscar
daddi r3, r3, 0 ;contador de aciertos 
daddi r4, r4, 0 ;indice para recorrer la tabla  
daddi r6, r6, 0 ;registro para almacenar en "res" 

loop: ld r5, tabla(r4) ; obtengo la primera insidencia de la tabla de numeros
nop
slt r6, r5, r2  ; compara r5=1,con r2=5,dejando un 1 en r6 si r2 es menor que r5 
daddi r1, r1, -1        ; decremento el cotador
bnez r6, cargar ; si es 1 salto para guardar un 1 en la tabla res, sino
beqz r1, fin
daddi r4, r4, 8 ; incremento la posicion dela tabla
j loop
cargar: sd r6, res(r4)    ; guarda en la nueva tabla el resultado r6
daddi r3, r3, 1 ; incremento el contador de aciertos
daddi r6, r6, 0 ; registro para almacenar en "res"
daddi r4, r4, 8 ; incrementa posicion de la tabla
beqz r1, fin ;etiqueta fin
j loop
fin: halt
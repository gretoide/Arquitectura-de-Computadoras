.data
tabla: .word 20, 1, 14, 7, 2, 58, 18, 7, 12, 11 ;declara una tabla con 10 elementos
num: .word 7 ; numero a buscar??
long: .word 10 ;longitud de tabla

.code
       dadd $t2, $zero, $zero ;inicializa t2 = 0 (recorrido de tabla)
       ld $t1, num($zero) ; t1 = 7
       ld $t0, long($zero) ;t0 = 10
       daddi $t4, $t4, 0 ; inicializo cantidad de apariciones

loop:  ld $t3, tabla($t2) ;carga en t3 en tabla posicion t2
       bne $t3, $t1, sigo  ;compara si los registros no son iguales
       daddi $t4, $t4, 1 ;suma 1 si son iguales y sigue la ejecución
sigo:  daddi $t0, $t0, -1 ;decrementa longitud de elementos recorridos
       daddi $t2, $t2, 8 ; avanza en posicion
       bnez $t0, loop ;si no terminamos nuestra tabla, vuelvo a saltar a loop
       halt

;7) Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una 
;tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla. 
;La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla. 

.data
valorM: .word 4
tabla: .word 5,2,6,1,8,3
dimf: .word 6
cant: .word 0

.code
;cargamos los argumentos para la subrutina
ld $a0,valorM($zero) ; $a0 = 4
ld $a1,tabla($zero) ; $a1 = direccion del inicio de la tabla
ld $a2,dimf($zero) ; dimension de la tabla
dadd $t0,$zero,$zero ;inicializo un registro temporal para índice de la tabla

;llamamos subrutina
jal esMayor
sd $v0,cant($zero) ;al salir de la subrutina guarda el valor
halt

;subrutina
esMayor: dadd $v0,$zero,$zero ;inicializamos el contador en 0
    loop: beqz $a2,termino ;si llegamos al final de la tabla, salimos
    ld $a1,tabla($t0) ;actualiza el valor en el registro
    slt $t1,$a0,$a1 ;pregunta si nuestro valor m, es menor al de la tabla
    beqz $t1, siguiente ;si es igual a 0, es decir que no era menor, pasa al siguiente elemento
    ;si no salta, es decir que era menor
    daddi $v0,$v0,1 ;aumentamos un número en los menores
    dadd $t1,$zero,$zero ;reiniciamos nuestro flag
    daddi $t0,$t0,8 ;avanzamos al siguiente elemento
    daddi $a2,$a2,-1 ;decrementamos la dimension
    j loop

    siguiente: daddi $t0,$t0,8 ;avanzamos al siguiente elemento
    daddi $a2,$a2,-1 ;decrementamos la dimensión
    j loop
    
    termino: jr $ra

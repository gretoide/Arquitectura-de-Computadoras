;3) * Analizar el siguiente programa con el simulador MIPS64: 

;a) Ejecutar el programa con Forwarding habilitado y responder: 
;- ¿Por qué se presentan atascos tipo RAW? 
;- Branch Taken es otro tipo de atasco que aparece. ¿Qué significa? ¿Por qué se produce? 
;- ¿Cuántos CPI tiene la ejecución de este programa? Tomar nota del número de ciclos, cantidad de 
;   instrucciones y CPI. 

;RESPUESTA: se produce un atasco raw (read after write) por dependencia de datos porque la instruccion
; "bnez r2, loop" quiere obtener el operando de el registro r2 que todavía sigue en la etapa "mem"
; de la instrucción anterior.
; el error de bts (branch taken stall) se debe a que se ejecuta incorrectamente la instruccion siguiente
; a la de nuestro salto condicional. esto se debe a que al tardar la ejecución del salto, entra la siguiente
; instruccion en el pipeline;
;cpi = 1750 
;------------------------------------------------------------------------------------------------
;b) Ejecutar ahora el programa deshabilitando el Forwarding y responder: 
;- ¿Qué instrucciones generan los atascos tipo RAW y por qué? ¿En qué etapa del cauce se 
;   produce el atasco en cada caso y 
;durante cuántos ciclos? 
;- Los Branch Taken Stalls se siguen generando. ¿Qué cantidad de ciclos dura este atasco en cada
;  vuelta del lazo ‘loop’? 
;Comparar con la ejecución con Forwarding y explicar la diferencia. 
;- ¿Cuántos CPI tiene la ejecución del programa en este caso? Comparar número de ciclos, cantidad de
;  instrucciones y CPI con el caso con Forwarding. 

;RESPUESTA: ahora tenemos dos instrucciones que generan atascos de dependencia de datos raw.
; la primera es en "dsll r1,r1,1", porque cuando entra al loop, aún no se guardó el movimiento del operando
; anterior. entonces, como desactivamos el forwarding, no tenemos forma de postergarle la necesidad
; de obtener ese operando. después, tenemos dos atascos del tipo bts (branch taken stalls) de la toma del halt
; luego del salto condicional. dura 3 ciclos el bts.
;
; en diferencia con el forwarding activado, como ya no tenemos forma de postergarle la necesidad de los operandos
; a las intrucciones siguientes, hay instrucciones que no les dan tiempo a las anteriores de terminar su
; ejecución.

; instruccions 12
; cycles = 25
; cpi = 2083
; muchísimo más ineficiente que el anterior
;------------------------------------------------------------------------------------------------
;c) Reordenar las instrucciones para que la cantidad de RAW sea ‘0’ en la ejecución del programa 
; (Forwarding habilitado) 
; cargamos primero b, despues a, y primero hacemos la resta, despues el corrimiento.
;
;------------------------------------------------------------------------------------------------
;d) Modificar el programa para que almacene en un arreglo en memoria de datos los contenidos parciales
; del registro r1 ¿Qué significado tienen los elementos de la tabla que se genera? 

 .data 
A: .word 1 
B: .word 3 
tabla: .word 0
 .code 
 daddi r3,r0,0 ;inicializamos r3 en cero para ir aumentando
 ld r2, B(r0) ;r2=2
 ld r1, A(r0) ;r1=1
loop: daddi r2, r2, -1 ;resta r2
 dsll r1, r1, 1 ;dsll desplaza a la izquierda los bits n veces (multiplica x2)
 sd r1, tabla(r3)
 daddi r3,r3,8 ;accede a la siguiente prosicion de la tabla
 bnez r2, loop ;se ejecuta el loop mientras r2 no sea 0
halt 

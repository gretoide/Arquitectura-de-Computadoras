; 5) El siguiente programa multiplica por 2 los elementos de un arreglo llamado datos y genera 
;    un nuevo arreglo llamado res. Ejecutar el programa en el simulador winmips64 con la opción
; Delay Slot habilitada. 
;a) ¿Qué efecto tiene habilitar la opción Delay Slot (salto retardado)?. 
;RESPUESTA: el efecto del delay slot, es que ejecuta la instruccion siguiente al salto condicional, dandole
; tiempo a que se decida qué hacer con ese salto. 
;----------------------------------------------------------------------------------------------
;b) ¿Con qué fin se incluye la instrucción NOP? ¿Qué sucedería si no estuviera?
;RESPUESTA: se incluye la instrucción nop para que sea ejecutada luego de la sentencia "bnez r2, loop", 
; dándole tiempo a que esta se decodifique
;----------------------------------------------------------------------------------------------
;c) Tomar nota de la cantidad de ciclos, la cantidad de instrucciones y los CPI luego de ejecutar
; el programa

;delaySlot OFF   | delaySlot ON       | d) modificado     
;----------------|--------------------|-------------------
;CYCLES 55       | CYCLES 63          | CYCLES 55
;INSTRUCCIONS 44 | INSTRUCCIONS 59    | INSTRUCCIONS 51 
;CPI  1250       | CPI 1068           | CPI 1078   
;RAW 0           | RAW 0              | RAW 0       
;BTS 7           | BTS 0              | BTS 0 
;----------------------------------------------------------------------------------------------
;d) Modificar el programa para aprovechar el ‘Delay Slot’ ejecutando una instrucción útil. 
;   Simular y comparar número de ciclos, instrucciones y CPI obtenidos con los de la versión anterior. 

.data 
cant: .word 8 
datos: .word 1, 2, 3, 4, 5, 6, 7, 8 
res: .word 0 
 .code 
 dadd r1, r0, r0        ;inicializa r1 = 0 (posiciones de la tabla)
 ld r2, cant(r0)        ; r2(pos0)=8
loop: ld r3, datos(r1)  ;carga en r3, la tabla "datps" en pos r1
 daddi r2, r2, -1       ;decrementa el contador 
 dsll r3, r3, 1         ;realiza la multiplicacion y la guarda en r3
 sd r3, res(r1)         ; guarda en la nueva tabla el resultado
 daddi r1, r1, 8        ; avanza posicion
 bnez r2, loop          ; compara con 0
 nop
 halt 
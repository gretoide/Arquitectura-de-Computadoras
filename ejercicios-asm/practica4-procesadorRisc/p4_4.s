;4) * Dado el siguiente programa: 
;a) Ejecutar en simulador con Forwarding habilitado. ¿Qué tarea realiza? ¿Cuál es el resultado
; y dónde queda indicado? 
; RESPUESTA: busca en la tabla, si se encuentra el carácter "7" y lo deja indicado en r10, el cual
; usa como flag.
;---------------------------------------------------------------------------------------------
;b) Re-Ejecutar el programa con la opción Configure/Enable Branch Target Buffer habilitada. 
;Explicar la ventaja de usar este método y cómo trabaja. 
;RESPUESTA: el método branch target buffer trabaja con misprediction, el cuál predice en qué momento
; se debe saltar o no, entonces, se equivoca solo la primera y última vez. a diferencia, de tenerlo
; desactivado, que va a tomar instrucciones equivocadas cada vez que se ejecute el loop;
;---------------------------------------------------------------------------------------------
;c) Confeccionar una tabla que compare número de ciclos, CPI, RAWs y Branch Taken Stalls para los dos 
;casos anteriores. 

BTB OFF         | BTB ON            
----------------|-----------------
CYCLES 71       | CYCLES 67
INSTRUCCIONS 43 | INSTRUCCIONS 43
CPI  1651       | CPI 1558
RAW 16          | RAW 16
BTS 8           | BTS 4

;---------------------------------------------------------------------------------------------
 
.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11 
num: .word 7 
long: .word 10
 .code 
 ld r1, long(r0)        ; r1=10 (contador)
 ld r2, num(r0)         ;r2=7 (numero buscado)
 dadd r3, r0, r0        ; iniciliza en 0 (posiciones)
 dadd r10, r0, r0       ; inicializa en 0 (flag)
loop: ld r4, tabla(r3)  ; r4 = tabla en pos r3
 beq r4, r2, listo      ; compara si el valor de la tabla = 7
 daddi r1, r1, -1       ; decrementa contador
 daddi r3, r3, 8        ; avanza en la tabla (8 = 1 movimiento)
 bnez r1, loop          ; vuelvo al loop
 j fin 
listo: daddi r10, r0, 1 
fin: halt 

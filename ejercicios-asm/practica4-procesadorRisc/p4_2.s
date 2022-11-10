;2) * El siguiente programa intercambia el contenido de dos palabras de la memoria de datos, etiquetadas A y B. 

;a) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding deshabilitada. Analizar paso a paso su 
;funcionamiento, examinar las distintas ventanas que se muestran en el simulador y responder: 
;- ¿Qué instrucción está generando atascos (stalls) en el cauce (ó pipeline) y por qué?
;- ¿Qué tipo de ‘stall’ es el que aparece? 
;- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración? 

;RESPUESTA: la que está generando los atascos es la instruccion de sd, porque quiere guardar un operando que todavía no está
;no está disponible (se conoce como atasco por dependencia de datos) y en este caso es el RAW (read after write);
;2.200 ciclos por instruccion

;------------------------------------------------------------------------------------------------------------------

;b) Una forma de solucionar los atascos por dependencia de datos es utilizando el Adelantamiento de Operandos o Forwarding. 
;Ejecutar nuevamente el programa anterior con la opción Enable Forwarding habilitada y responder: 
;- ¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora. 
;- ¿Qué indica el color de los registros en la ventana Register durante la ejecución? 
;- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en este caso? Comparar con el anterior. 

;RESPUESTA: no se presenta ningún atasco en este caso, porque el "forwarding" lo que hace es postergar
;la necesidad del operando, es decir, le da tiempo a la ejecución para que se termine de guardar, y así poder
;accederlo.
;el color en los registros, el verde indica que el dato está disponible en la etapa mem para adelantamiento.
;el color rojo indica que el resultado está disponible en ex y puede ser adelantado
;1.800 ciclos por instruccion

 .data 
A: .word 1 
B: .word 2 
 .code 
 ld r1, A(r0)   ;r1=1
 ld r2, B(r0)   ;r2=2
 sd r2, A(r0)   ;a=2
 sd r1, B(r0)   ;b=1
halt 
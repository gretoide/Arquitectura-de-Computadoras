;1) Simular el siguiente programa de suma de números en punto flotante y analizar minuciosamente la ejecución paso a 
;paso. Inhabilitar Delay Slot y mantener habilitado Forwarding. 
.data
n1: .double 9.13  ;genera dos números en punto flotante
n2: .double 6.58 
res1: .double 0.0 ;genera dos variables para dos resultados
res2: .double 0.0 

.code
l.d f1, n1($zero) 
l.d f2, n2($zero) 
nop
add.d f3, f2, f1 ; suma 6.58 + 9.13  = 15.71
mul.d f1, f2, f1 ; multiplica queriendo escribir el mismo resgistro que está siendo usado
mul.d f4, f2, f1 ; multiplica 6.58 . 9.13 = 60.0754
s.d f3, res1($zero)  ;guarda suma en res1
s.d f4, res2($zero)  ;guarda mul en res2
halt 
;a) Tomar nota de la cantidad de ciclos, instrucciones y CPI luego de la ejecución del programa. 
;RESPUESTA: se generan 4 atascos por dependencia de datos, 2 atascos estructurales.
; 16 ciclos, 7 instrucciones y 2.286 ciclos por instruccion;
;-------------------------------------------------------------------------------------------------------------------
;b) ¿Cuántos atascos por dependencia de datos se generan? Observar en cada caso cuál es el dato en conflicto y las 
;instrucciones involucradas. 
;RESPUESTA: se generan 4 atascos por dependecia de datos:
;1) se genera un atasco en la suma, espera que el operando dos sea cargado;
;2) se genera en la instrucción "add.d f3, res1($zero)" porque f2 todavía no se almacenó.
;3) se genera en "s.d f3,res1,($zero)" porque quiere que guardemos algo que la ejecucción anterior no terminó de almacenar.
;4) se genera en "s.d f4, res2($zero)" pero debido a que como la instrucción de multiplicar demanda mucho, para cuando esta se intenta ejecutar
; la multiplicación se sigue ejecutando;

;-------------------------------------------------------------------------------------------------------------------
;c) ¿Por qué se producen los atascos estructurales? Observar cuales son las instrucciones que los generan y en qué 
;etapas del pipeline aparecen. 
;RESPUESTA: se producen atascos estructurales cuando dos instrucciones quieren acceder a la etapa "mem" simultaneamente. estas se generan
;en nuestras dos operaciones aritmeticas en este programa.
;-------------------------------------------------------------------------------------------------------------------
;d) Modificar el programa agregando la instrucción mul.d f1, f2, f1 entre las instrucciones add.d y mul.d. 
;Repetir la ejecución y observar los resultados. ¿Por qué aparece un atasco tipo WAR? 
;RESPUESTA: aparece el atasco war porque queremos acceder a un dato que aún no fue leido.
;-------------------------------------------------------------------------------------------------------------------
;e) Explicar por qué colocando un NOP antes de la suma, se soluciona el RAW de la instrucción ADD y como 
;consecuencia se elimina el WAR. 
;RESPUESTA: porque le da un poco más de tiempo para que el operando este dispobnible.
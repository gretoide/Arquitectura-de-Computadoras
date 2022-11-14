;6) Como ya se observó anteriormente, muchas instrucciones que normalmente forman parte del repertorio de un 
;procesador con arquitectura CISC no existen en el MIPS64. En particular, el soporte para la invocación a subrutinas 
;es mucho más simple que el provisto en la arquitectura x86 (pero no por ello menos potente). El siguiente programa 
;muestra un ejemplo de invocación a una subrutina. 
;a) ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo? 
;RESPUESTA: calcula la potencia de un número desde una subrutina.
;-----------------------------------------------------------------------------------------------------------------
;b) ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr? 
;RESPUESTA: jal llama a la subrutina y jr salta a la dirección contenida en $ra
;-----------------------------------------------------------------------------------------------------------------
;c) ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el registro $v0? 
;RESPUESTA: $ra se utiliza para almacenar la direccion de retorno e la subrutina.
;$a0 y $a1 se utilizan para enviar argumentos a las subrutinas;
;$v0 se utiliza para retornar valores de una subrutina.
;-----------------------------------------------------------------------------------------------------------------
;d) ¿Qué sucedería si la subrutina a_la_potencia necesitara invocar a otra subrutina para realizar la multiplicación, 
;por ejemplo, en lugar de usar la instrucción dmul? ¿Cómo sabría cada una de las subrutinas a que dirección de 
;memoria deben retornar? 
;RESPUESTA deberíamos guardarnos el registro $ra para que no lo pise el llamado anidado.
;-----------------------------------------------------------------------------------------------------------------

.data
valor1: .word 16 
valor2: .word 4 
result: .word 0 
 
.text
;argumentos de la subrutina
ld $a0, valor1($zero) ;carga en $a0 = 16
ld $a1, valor2($zero) ;carga en  $a1 = 4

;llama a la subrutina
jal a_la_potencia  ;llama a la subrutina
;valor que retorna la subrutina
sd $v0, result($zero) ;guarda el resultado
halt 

;subrutina
a_la_potencia: daddi $v0, $zero, 1 ;inicializa $v0 = 1
lazo: slt $t1, $a1, $zero ;compara si es menor. 1° $t1 (resultado). compara 4 < 0
bnez $t1, terminar ;si es menor (vale 1) salta a terminar
daddi $a1, $a1, -1  ;decrementa a
dmul $v0, $v0, $a0 ;multiplica y guarda en $v0 la potencia
j lazo ;vuelve a saltar a lazo
terminar: jr $ra ;sale de la subrutina cuando terminamos las potencias

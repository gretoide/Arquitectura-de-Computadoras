;Objetivos: Comprender el funcionamiento de la segmentación de cauce del procesador MIPS de 64 bits. Analizar las ventajas e 
;inconvenientes de este tipo de arquitectura. Familiarizarse con el desarrollo de programas para procesadores con sets reducidos 
;de instrucciones (RISC). Resolver problemas y verificarlos a través de simulaciones (winmips64) 

;Los ejercicios con * tienen solución propuesta total o parcial

;1) Muchas instrucciones comunes en procesadores con arquitectura CISC no forman parte del repertorio
;de instrucciones del MIPS64, pero pueden implementarse haciendo uso de una única instrucción.
;Evaluar las siguientes instrucciones, indicar qué 
;tarea realizan y cuál sería su equivalente en lenguaje assembly del x86. 

a) dadd r1, r2, r0 

realiza una suma y la guarda en el registro r1 (r1 = r2 + 0).
el equivalente en msx88 sería

mov ax,0 ;movemos a un registro cero
add cx, ax ;sumamos con otro registro
mov bx, cx ;movemos a bx el resultado


b) daddi r3, r0, 5 
realiza una suma con un operando inmediato, la equivalencia en msx88 es:
mov cx, 0 ;ya que r0 siempre vale 0
add cx, 5
mov bx, cx ;movemos el resultado a otro registro


c) dsub r4, r4, r4 
 un registro se resta a sí mismo, y guarda el valor en el mismo registro
 en msx88:
 sub ax,ax (?)


d) daddi r5, r5, -1 
a un registro, le suma un número negativo, lo cual no podíamos hacer en msx88 porque no teníamos esa
posibilidad
sub ax,1

e) xori r6, r6, 0xffffffffffffffff
hace un xor con un operando inmediato (-1)
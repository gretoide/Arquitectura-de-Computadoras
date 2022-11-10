; 8) * Escribir un programa que multiplique dos números enteros utilizando 
;      sumas repetidas (similar a Ejercicio 6 o 7 de la Práctica
; 1). El programa debe estar optimizado para su ejecución con la
;     opción Delay Slot habilitada.
.data
num1: .word 3
num2: .word 3
res: .word 0
.code
ld r3, res(r0) 
ld r2, num2(r0)
ld r1, num1(r0)
loop: dadd r3, r3, r1
daddi r2, r2, -1
bnez r2, loop
sd r3, res(r0) ;guardamos valor
halt

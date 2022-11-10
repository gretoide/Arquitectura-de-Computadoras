
;9) Escribir un programa que implemente el siguiente fragmento escrito en un lenguaje de alto nivel: 
; while a > 0 do 
;begin 
; x := x + y; 
; a := a - 1; 
; end; 
;Ejecutar con la opción Delay Slot habilitada

.data
a: .word 10
x: .word 0
y: .word 5

.code
ld r1, a(r0)
ld r2, x(r0)
ld r3, y(r0)

loop: beqz r1, fin
daddi r1,r1,-1
j loop
dadd r2,r2,r3
fin: halt
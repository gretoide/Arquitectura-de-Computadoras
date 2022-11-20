;1) El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador 
;WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el 
;programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo. 
.data
control: .word 0x10000
data: .word 0x10008
caracter: .byte 0

.code
;inicializamos los "registros"
ld $s0, control($zero) ;
ld $s1, data($zero)

;inicializamos s4 = enter para cortar con eso 
daddi $s4,$zero,13 

      ;le mandamos un 9 a control, para que ingrese un caracter
loop: daddi $t1,$zero,9 
    sd $t1,0($s0) 
    
    ;nos guardamos el caracter en data
    ld $t1,0($s1)

    ;comparamos si se ingreso el enter
    beq $t1, $s4, fin 

    ;nos guardamos el caracter en una variable para luego enviarle la direccion a data
    sd $t1, caracter($zero) 
    daddi $s3, $zero, caracter 
    sd $s3, 0($s1)

    ;imprimimos caracter
    daddi $t1,$zero,4 ;con 4 imprimimos el string
    sd $t1, 0($s0) ;lo cargamos en control
j loop
fin: halt

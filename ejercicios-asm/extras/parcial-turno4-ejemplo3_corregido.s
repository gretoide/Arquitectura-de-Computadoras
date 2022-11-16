.data
CONTROL: .word32 0x10000 ;declara control
DATA: .word32 0x10008 ;declara data
tabla1: .word 20, 1, 14, 7, 2, 58, 18, 7, 12, 11 ;tabla1 de 10 elementos
tabla2: .word 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ;tabla2 de 10 elementos
long: .word 10 ;longitud de tabla
.code
       lwu $s0, DATA($zero)
       lwu $s1, CONTROL($zero)
       dadd $t2, $zero, $zero ;inicializa t2 en 0
       daddi $t5, $zero, 1 ; inicializa pos en 1
       ld $t0, long($zero)
       daddi $t4, $t4, 0
       daddi $t6, $zero, 2
       
loop:  ld $t1, tabla2($t2)
       ld $t3, tabla1($t2)
       bne $t3, $t1, sigo ;berifica si los elementos de la tabla en la misma posicion son distintos
       sd $t5, 0($s0); $s0 = dirección de DATA $t5 el numero de pos en la tabla 
       sd $t6, 0($s1); $s1 = dirección de CONTROL y en $t6 el comando 2 - imprimir numero

sigo:  daddi $t0, $t0, -1
       daddi $t2, $t2, 8
       daddi $t5, $t5, 1
       bnez $t0, loop
       halt

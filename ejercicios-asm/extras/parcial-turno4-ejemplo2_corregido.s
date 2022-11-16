;imprime las posiciones en donde hay un 7 en nuestra tabla

.data
CONTROL: .word32 0x10000 ;declaro direccion de control
DATA: .word32 0x10008 ;declaro direccion data
tabla: .word 20, 1, 14, 7, 2, 58, 18, 7, 12, 11 ;tabla de elementos
num: .word 7 ;numeroa buscar
long: .word 10 ;cantidad de elementos

.code
       lwu $s1, CONTROL($zero) ;carga en $s1 control (puede ser fuera del loop)
       lwu $s0, DATA($zero) ;carga en $s0, data (puede ser fuera del loop)
       dadd $t2, $zero, $zero ;inicializamos en 0 nuestro indice de la tabla
       daddi $t5, $zero, 1 ; t5 = 1??? posiciones??
       ld $t1, num($zero) ;t1 = 7
       ld $t0, long($zero) ;t0 = 10
       daddi $t4, $t4, 0 ;inicializa en 0 la cantidad de apariciones
       daddi $t6, $zero, 2 ;inicializa t6 = 2 (para imprimir valores con signo)

loop:  ld $t3, tabla($t2) ;t3 = valor de tabla en pos t2
       bne $t3, $t1, sigo ; si los registros no son iguales, saltos
       sd $t5, 0($s0) ;almacena en data, lo que hay en t5??
       sd $t6, 0($s1); le mandamos a imprimir
       
sigo:  daddi $t0, $t0, -1 ;decrementa longitud
       daddi $t2, $t2, 8 ;avanza
       daddi $t5, $t5, 1 ;incrementa t5? pos de tabla
       bnez $t0, loop ; si no terminamos la tabla, lopea
       halt

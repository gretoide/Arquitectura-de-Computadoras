;2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el 
;ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La 
;segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del 
;número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje 
;de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones 
;del cauce (ejercicio similar al ejercicio 6 de Práctica 2). 

.data
vector: .word "cero","uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"
control: .word 0x10000
data: .word 0x10008

.code
;declaramos los registros
ld $s0,control($zero)
ld $s1,data($zero)

loop: jal sub_ingreso
    ;le mandamos el caracter a nuestra otra subrutina
    dadd $a0,$zero,$v0 ;ahora nuestro argumento para la subrutina muestro, vale lo que tenía el retorno
                        ;de la anterior
    jal sub_muestra
    j loop
halt

;subrutina ingreso
;-------------------------------------------------------------------
        ;INGRESAMOS NUMERO
sub_ingreso: daddi $t0,$zero,1 ;para el ingreso de numeros con signo
    sd $t0,0($s0) ;le decimos a control que ingrese el numero

    ;NOS GUARDAMOS NUMERO
    ld $s1,0($s2) ;s2 = nuestro numero leido

    ;CORROBORAMOS SI ES UN NUMERO
    es_num: slti $t0,$s2,0x30 ;compara si es menor a 0
        bnez $t0, fin
        slti $t0,$s2,0x3a ;compara si es menor al siguiente de 9
        beqz $0, fin
        
        ;si es un numero, lo retorna
        dadd $v0,$zero,$s2
    fin: jr $ra

;subrutina muestro
;------------------------------------------------------------------
sub_muestra: daddi $t0,$zero,8 ;indicamos a control que se imprime un número
    
    daddi $t1,$zero,9 ;inicializamos registro auxiliar en 9 para decrementar posiciones
    daddi $t2,$zero,0x30 ;inicializamos en 0 - 30h para comparar
    daddi $t3,$zero,1 ;indice para la el vector
    daddi $t4,$zero,vector ;cargamos la direccion de nuestro vector

    comparo: beqz $t1,fin ;si recorrimos todo el vector, salimos
        beq $a0,$t1, imprimo
        daddi $t1,$t1,-1 ;decrementamos comparaciones
        daddi $t2,$t2,1 ;incrementamos posiciones
        daddi $t3,$t3,8 ;avanzamos indice
        j comparo

    imprimo: dadd $t3,$t3,$t4 ;le sumo el indice a nuestra direccion
        sd $t3,0($s1) ;le mandamos la direccion a data
        sd $t1, 0($s0) ;le mandamos a control para que imprima
    fin: jr $ra

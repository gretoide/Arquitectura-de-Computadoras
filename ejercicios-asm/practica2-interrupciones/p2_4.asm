;4) Lectura de datos desde el teclado.
;Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado e inmediatamente lo muestre en la
;pantalla de comandos, haciendo uso de las interrupciones por software INT 6 e INT 7.

org 1000h
	string db "ingrese un numero"
	n db ?
org 2000h
	mov bx, offset string
	mov al, offset n - offset string
	int 7 ;imprime el primer mensaje "ingrese un numero"
	mov bx, offset n ;movemos la direccion donde queremos que guarde el n
	int 6 ;ingresa el numero
	mov bx, offset n ;movemos desde donde imprimir
	mov al, 1 ;la cantidad de caracteres a imprimir
	int 7
	int 0
end
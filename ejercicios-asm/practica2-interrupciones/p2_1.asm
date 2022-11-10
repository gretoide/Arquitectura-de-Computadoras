;1) Escritura de datos en la pantalla de comandos.
;Implementar un programa en el lenguaje assembler del simulador MSX88 que muestre en la pantalla de comandos un
;mensaje previamente almacenado en memoria de datos, aplicando la interrupción por software INT 7.
org 1000h
	cadena db "Mira como imprimo en assembler"
	cadena2 db "|	CADA DIA MAS CAPOOOO |"
	ccadena3 db 0Fh
	fin db ? ;variable que nos sirve para restar los caracteres
org 2000h
	mov bx, offset cadena ;le enviamos a bx desde donde comenzar a leer
	mov al, offset fin - offset cadena ;cantidad de caracteres a imprimir
	int 7 ;llamamos a lectura
	int 0 ;finaliza el programa
end
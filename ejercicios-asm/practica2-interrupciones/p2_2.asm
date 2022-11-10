;2) Escribir un programa que muestre en pantalla todos los caracteres disponibles en el simulador MSX88, comenzando con
;el caracter cuyo código es el número 01H.
org 1000h
	car db 01h
org 2000h
	mov al, 1;cantidad de caracteres a imprimir
	leer: mov bx, offset car
		int 7 ;llamamos a lectura
		inc car
		cmp car, 00FFH
		jnz leer
	int 0 ;finaliza el programa
end
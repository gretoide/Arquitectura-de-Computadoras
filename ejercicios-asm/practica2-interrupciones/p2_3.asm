;3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayúsculas y
;minúsculas (AaBb…), sin incluir texto en la memoria de datos del programa. Tener en cuenta que el código de “A” es 41H,
;el de “a” es 61H y que el resto de los códigos son correlativos según el abecedario.
org 1000h
	mayu db 41h
	minu db 61h
org 2000h
	mov al, 2;cantidad de caracteres a imprimir
	leer: mov bx, offset mayu
		int 7 ;llamamos a lectura
		inc mayu
		inc minu
		cmp mayu, 5bH
		jnz leer
	int 0 ;finaliza el programa
end
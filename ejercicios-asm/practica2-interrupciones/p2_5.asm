;5) Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es
;realmente un número. De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe
;recibir el código del caracter por referencia desde el programa principal y debe devolver vía registro el valor 0FFH en caso
;de tratarse de un número o el valor 00H en caso contrario. Tener en cuenta que el código del “0” es 30H y el del “9” es
;39H.
org 1000h
	string db "ingrese un numero"
	lectura db ?
	mensaje db "caracter no valido"
	final db ?
org 3000h
	es_num: cmp cl, [bx] ;compara el caracter leido con cx
		 jz si ;si da verdadero, devuelve el resultado en dx
		 inc cl ;sino incrementa bx
		 cmp cl, 3Ah
		 jnz es_num 
	 	call invalido
	 	jmp fin
	si: mov dl, 0FFH ;mueve a dx el resultado y retorna
	fin: ret
org 4000h
 invalido: mov bx, offset mensaje
 mov al, offset final - offset mensaje
 int 7
 ret
org 2000h
	;inicializamos en dl, lo que vamos a retornar
	mov dx, 00h ;valor que retorna si no es un numero
	;movemos el caracter 0 para ir comparando
	mov cx, 30h
	;imprime el mensaje de "ingrese un numero"
	mov bx, offset string
	mov al, offset lectura - offset string
	int 7
	;lee un caracter
	mov bx, offset lectura
	int 6
	call es_num ;verifica si es un número
	int 0
end
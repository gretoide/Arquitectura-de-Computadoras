;b) Escribir una subrutina CONTAR_MIN que cuente el número de letras minúsculas de la ‘a’ a la ‘z’ de una cadena de 
;caracteres terminada en cero almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro, 
;y el resultado se retorna por valor también a través de un registro. 
;Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2. 

;recibe el caracter en ah y retorna el resultado en al
org 1000h
	cad db "abcDe1"
	db 00H ;para que corte y deje de sumar
org 3000h
contar_min: mov dx,0;inicializamos contador
	loop: mov ah,[bx] ;le pasamos contenido de la direccion en bxr
		cmp ah, 0 ;para ver si se termino
		jz fin
		cmp ah, 61H ;a
		jz suma
		cmp ah, 65H ;e
		jz suma
		cmp ah, 66H ;i
		jz suma
		cmp ah, 6FH ;o
		jz suma
		cmp ah, 75H ;u
		jz suma
		inc bx ;luego de comparar incrementa para el proximo caracter
		jmp loop ;y vuelve a saltar a vocal para seguir preguntando
	suma: inc dx
		inc bx
		jmp loop ;vuelve a saltar a loop
	fin: ret
org 2000h
	mov bx, offset cad
	call contar_min
hlt
end
;b) * Escriba la subrutina RESTO que calcule el resto de la división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina a través de registros. El resultado debe devolverse
;también a través de un registro por referencia.
	
org 1000h
	num db 9h
	divi db 4h
org 3000h
	dividir: mov al,0 ;inicializamos el lugar donde vamos a guardar el resto
	mov dx, 0 ;inicializamos el lugar donde vamos a guardar el cociente
	cmp ch,0 ;para no dividir por 0
	jz fin
	cmp cl,0 ;por si el dividendo es 0
	jz fin
	;dividimos el numero
	div: sub cl,ch
		js res ;ahora, en vez de salir, si da 0, calcula el resto
		inc dx
		jmp div
	res: add cl,ch ;le volvemos a sumar lo que le restamos
	mov al, cl ;guardamos el resto
	fin: ret
org 2000h
	mov cl,num1
	mov ch,num2
	call dividir
hlt
end
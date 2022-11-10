;El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar los números 
;NUM1 y NUM2, y guardar el resultado en la variable RES 
;b) Llamando a una subrutina MUL para efectuar la operación, pasando los parámetros por valor desde el programa 
;principal a través de registros y devolviendo el resultado a través de un registro por valor. 
org 1000h ;declaracion de variables
	num1 db 5h
	num2 db 3h
	res dw ?
org 3000h ;declaracion de subrutinas
multi: mov dx,0
	cmp cl,0
	jz fin
	mov ah,0 ;para que no tenga basura
lazo: add dx, ax 	;lazo se ejecuta durante la multiplicacion
	dec cl
	jnz lazo
fin:	ret
org 2000h
	mov al, num1 ;movemos a al el num a mul
	mov cl,num2
	call multi
	mov res,dx
hlt
end
;El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar los números 
;NUM1 y NUM2, y guardar el resultado en la variable RES 
;c) Llamando a una subrutina MUL, pasando los parámetros por referencia

org 1000h ;zona de declaracion de variables
	num1 db 5h
	num2 db 3h
	res dw ?
org 3000h
	mul: mov dx,0
		;debemos obtener los operandos por memoria, para direccionamiento indirecto
		mov bx,ax
		mov ax,[bx] ;le manda el valor
		mov bx,cx
		mov cx,[bx] ;le manda el valor
		cmp cx,0
		jz fin
	lazo: add ax,dx
	dec cx
	jnz lazo
	fin: ret
org 2000h ;programa principal
	mov al, offset num1
	mov cl, offset num2
	call mul
	mov res,dx
htl
end
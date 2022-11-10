;d) Escribir un programa que calcule la suma de dos números de 32 bits almacenados en la memoria llamando a una
;subrutina SUM32, que reciba los parámetros de entrada por valor a través de la pila, y devuelva el resultado también
;por referencia a través de la pila.

org 1000h
	num1 dw 2000h
	num1_2 dw 2450h
	num2 dw 2789h
	num2_2 dw 2000h
org 2000h
	;cargamos en los registros los numeros
	mov ax,num1
	mov bx,num1_2
	mov cx,num2
	mov dx,num2_2
	;sumamos 
	add ax,bx
	adc ax,0
	add ax,cx
	adc ax,0
	add ax,dx
	adc ax,0
hlt
end
	
	
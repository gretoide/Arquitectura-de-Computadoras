;c) Escribir un programa que calcule la suma de dos números de 32 bits almacenados en la memoria sin hacer llamados a
;subrutinas, resolviendo el problema desde el programa principal.

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
	add ax,cx
	adc ax,0
	add bx,dx
	adc bx,0
	add ax,bx
	adc ax,0
hlt
end
	
	
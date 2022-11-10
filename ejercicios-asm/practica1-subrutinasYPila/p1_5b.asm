;b) Escribir un programa como en a) pero ahora el cálculo y el almacenamiento del resultado debe realizarse en una 
;subrutina llamada calculo, sin recibir ni devolver parámetros, es decir, utilizando A, B, C y D como variables 
;globales. Si bien esta técnica no está recomendada, en ejercicio sirve para ver sus diferencias con el uso de 
;parámetros.

org 1000h ;declaracion de variables
	num_a dw 5h
	num_b dw 6h
	num_c dw 2h
	num_d dw ?
org 3000h ;declaracion de subrutinas
	suma: mov ax, num_a
		add ax, num_b
		sub ax, num_c
		mov num_d, ax
		ret
org 2000h ;programa principal
	call suma
hlt
end

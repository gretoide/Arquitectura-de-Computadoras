;Escribir un programa que dados los valores etiquetados como A, B y C y almacenados en la memoria de datos, 
;calcule A+B-C y guarde el resultado en la memoria con etiqueta D, sin utilizar subrutinas. 

org 1000h ;zona de declaracion de variables
	num_a DW 5h
	num_b DW 6h
	num_c DW 2h
	num_d DW ?
org 2000h ;programa principal
	mov ax, num_a
	add ax, num_b
	sub ax, num_c
	mov num_d, ax
hlt
end
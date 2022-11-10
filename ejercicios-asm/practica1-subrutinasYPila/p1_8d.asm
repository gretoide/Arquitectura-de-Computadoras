;d) * Usando la subrutina anterior escribir la subrutina CONTAR_VOC, que recibe una cadena terminada en cero por 
;referencia a través de un registro, y devuelve, en un registro, la cantidad de vocales que tiene esa cadena. 
;Ejemplo: CONTAR_VOC de ‘contar1#!’ debe retornar 2 
org 1000h
	char db
 "VoCaLeS"
	db 00H
org 4000h
contar_voc: mov dx,0 ;inicializamos contador
  loop: mov al,[bx] ;movemos el contenido de la dir en bx
		cmp al,0 ;comparamos con 0 (condicion de corte)
		jz final 
		call es_vocal ;llama a las vocales
		jz suma
		inc bx ;incrementa para el prox caracter
		jmp loop
suma: inc dx 
		inc bx
		jmp loop
final: ret
org 3000h
es_vocal: cmp al,0
	jz fin
	cmp al, 61H ;a
	jz fin
	cmp al, 65H ;e
	jz fin
	cmp al, 69H ;i
	jz fin
	cmp al, 6FH ;o
	jz fin
	cmp al, 75H ;u
	jz fin
fin: ret
org 2000h
	mov bx, offset char
	call contar_voc
hlt
end
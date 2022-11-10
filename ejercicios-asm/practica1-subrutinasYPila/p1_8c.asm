;c) * Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La 
;rutina debe recibir el carácter por valor vía registro, y debe retornar, también vía registro, el valor 0FFH si el 
;carácter es una vocal, o 00H en caso contrario

org 1000h
	char db "i"
	res db ?
org 3000h
es_vocal: mov ah,0FFH ;si es vocal
	cmp al,0
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
	mov ah, 00H ;si termino comparaciones y no era vocal
fin: ret
org 2000h
	mov al,char
	call es_vocal
	mov res,ah
hlt
end
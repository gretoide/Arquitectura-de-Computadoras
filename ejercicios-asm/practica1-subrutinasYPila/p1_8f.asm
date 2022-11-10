;f) Escriba la subrutina REEMPLAZAR_CAR que reciba dos caracteres (ORIGINAL y REEMPLAZO) por valor a
;través de la pila, y una cadena terminada en cero también a través de la pila. La subrutina debe reemplazar el
;carácter ORIGINAL por el carácter REEMPLAZO.

org 1000h
	cad db "cadena" ;caracter 0
	db 00h
	original db "a"
	reemplazo db "o"
org 3000h
	contar_char: mov bx,sp ;en bx vamos a usar el sp
	add bx,2 ;ubicamos operando 
	mov al,[bx] ;manda el caracter a reemplazar
	add bx,2 ;ubicamos el operando
	mov ah, [bx] ;movemos el caracter original
	add bx,2 ;ubicamos el sp del primer char de la cadena
	mov cx,[bx] ;movemos el contenido del sp (la direccion)
	mov bx,cx ; movemos a bx la direccion del opera (para ir aumentando)
	mov cx,[bx] ;movemos a cx el contenido de la direccion (el caracter)
	loop: cmp byte ptr [bx],0 ;compara si es 0 para cortar
		jz fin
		cmp byte ptr [bx],ah ;compara el caracter
		jz rem
		sigue: inc bx
		jmp loop
	rem: mov [bx],al
		jmp sigue
	fin: ret
org 2000h
	mov ax, offset cad ;movemos la direccion inicial de la cadena
	push ax ;la apilamos
	mov ax, original  ;movemos el caracter ORIGINAL
	push ax ;lo apilamos
	mov ax, reemplazo ;movemos el caracter a reemplazar
	push ax
	call contar_char
hlt
end
;b) Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina ROTARIZQ_N que realice N
;rotaciones a la izquierda de un byte. La forma de pasaje de parámetros es la misma, pero se agrega el parámetro N
;que se recibe por valor y registro. Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, se obtiene el byte
;01010010.

org 1000h
	b db 27h ;00100111
	n db 3h ;n veces el rotamiento
org 3000h
	rotar_izq: cmp cx,0
	jz fin
	add ah,ah ;se suma así mismo
	adc ah,0 ;le suma el carry (fuente + destino + carry) por eso el 0
	dec cx
	jmp rotar_izq
	fin: ret
org 2000h
	mov cx, n 
	mov ah, b ;ah = 00100111
	call rotar_izq ; ah = 01001110 ; ah = 10011100 ; ah = 00111001
hlt
end
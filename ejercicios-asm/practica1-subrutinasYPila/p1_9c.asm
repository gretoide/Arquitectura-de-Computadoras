;c) * Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina ROTARDER_N que sea similar
;pero que realice N rotaciones hacia la derecha.
;Una rotación a derecha de N posiciones, para un byte con 8 bits, se obtiene rotando a la izquierda 8 - N posiciones. Por
;ejemplo, al rotar a la derecha 6 veces el byte 10010100 se obtiene el byte 01010010, que es equivalente a la rotación a
;la izquierda de 2 posiciones del ejemplo anterior.

org 1000h
	b db 27h ;00100111
	n db 3h ;n veces el rotamiento
org 4000h
	rotar_izq_n: mov ch, 8
	sub ch,cl
	mov cl, ch
	call rotar_izq
	ret
org 3000h
	rotar_izq: cmp cl,0
	jz fin
	add ah,ah ;se suma así mismo
	adc ah,0 ;le suma el carry (fuente + destino + carry) por eso el 0
	dec cl
	jmp rotar_izq
	fin: ret
org 2000h
	mov cl, n
	mov ah, b ;ah = 00100111
	call rotar_izq_n ; ah = 01001110 ; ah = 10011100 ; ah = 00111001
hlt
end
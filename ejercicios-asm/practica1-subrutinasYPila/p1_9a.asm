;a) Escribir una subrutina ROTARIZQ que haga una rotación hacia la izquierda de los bits de un byte almacenado en la 
;memoria. Dicho byte debe pasarse POR VALOR desde el programa principal a la subrutina a TRAVÉZ DE REGISTROS y por 
;REFERENCIA. No hay valor de retorno, sino que se modifica directamente la memoria. 
;Una rotación a izquierda de un byte se obtiene moviendo cada bit a la izquierda, salvo por el último que se mueve a la 
;primera posición. Por ejemplo al rotar a la izquierda el byte 10010100 se obtiene 00101001, y al rotar a la izquierda 
;01101011 se obtiene 11010110. 

; Recibe el caracter a rotar en AH
; Devuelve el resultado también en AH
org 1000h
	b db 27h ;00100111
org 3000h
	rotar_izq: add ah,ah ;se suma así mismo
	adc ah,0 ;le suma el carry (fuente + destino + carry) por eso el 0
org 2000h
	mov ah, b ;ah = 00100111
	;primera rotacion
	call rotar_izq ; ah = 01001110
	;segunda rotacion
	call rotar_izq ; ah = 10011100
hlt
end
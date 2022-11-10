;a) Escriba la subrutina DIV que calcule el resultado de la división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina a través de la pila. El resultado debe devolverse también
;a través de la pila por valor.

org 1000h
	num db 9h
	divi db 1h
org 3000h
	dividir: mov dx, 0 ;inicializamos contador
		mov bx,sp 
		add bx,2
		mov ch,[bx] 
		; ch = divisor
		mov bx, sp
		add bx,4
		mov cl,[bx]
		; cl = numerador
		loop: sub cl,ch
			js retorna
			inc dx
			jmp loop
		;guardamos resultado
		 retorna: push dx
		ret
org 2000h
	mov al,num
	push ax
	mov al, divi
	push ax
	call dividir
	pop dx
	pop ax
	pop ax
hlt
end
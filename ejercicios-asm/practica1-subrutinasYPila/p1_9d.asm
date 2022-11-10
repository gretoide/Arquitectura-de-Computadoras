;d) Escriba la subrutina ROTARDER del ejercicio anterior, pero sin usar la subrutina ROTARIZ. Compare qué ventajas
;tiene cada una de las soluciones.
org 3000h
	b db 27h ;00100111
	n db 03h ;n veces el rotamiento
org 3000h
	rotar_der: mov ch,8
	sub ch,cl
	mov cl,ch
	loop: cmp cl,0
		jz fin
		add ah,ah
		adc ah,0
		dec cl
		jmp loop
	fin:ret
org 2000h
	mov al,b
	mov cl,n
	call rotar_der
hlt
end
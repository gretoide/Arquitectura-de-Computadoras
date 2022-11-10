;10) SWAP Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados en memoria. Los
;parámetros deben ser pasados por referencia desde el programa principal a través de la pila.
;Para hacer este ejercicio, tener en cuenta que los parámetros que se pasan por la pila son las direcciones de memoria,
;por lo tanto para acceder a los datos a intercambiar se requieren accesos indirectos, además de los que ya se deben
;realizar para acceder a los parámetros de la pila.

org 1000h
	valor_1 dw 1234h
	valor_2 dw 5678h
org 3000h
	swap: push bx ; guardamos los 3 registros
		push cx
		push dx
		
		;obtenemos el primer operando en cx
		mov bx, sp ;le mandamos a bx la direccion del sp
		add bx, 8 ;ubicamos el operando
		mov bx,[bx] ;nos guardamos la direccion del operando
		mov cx, [bx] ; cx = operando v2
		
		;obtenemos el segundo operando en dx
		mov bx,sp
		add bx, 10 ;apuntamos la primer operando
		mov bx,[bx] ;accedemos a la direccion
		mov dx, [bx] ;accedemos al operando, dx = v1
		
		;ponemos el valor v1 (dx) en v2
		mov bx, sp
		add bx, 8 ;apuntamos al v2
		mov bx,[bx] ;obtenemos la direccion
		mov [bx],dx
		
		;ponemos el valor de v2 (cx), en v1
		mov bx, sp
		add bx, 10 ;nos paramos en el primer operando
		mov bx,[bx]
		mov [bx],cx
		
		;restauro los 3 registros
		pop dx
		pop cx
		pop bx
		
		ret
org 2000h
	mov ax, offset valor_1
	push ax ;apilamos el primer valor
	mov ax, offset valor_2
	push ax ;apilamos el segundo valor
	call swap
hlt
end
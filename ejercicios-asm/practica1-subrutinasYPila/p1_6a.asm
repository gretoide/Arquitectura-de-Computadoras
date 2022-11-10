;El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar los números 
;NUM1 y NUM2, y guardar el resultado en la variable RES 
;a) Sin hacer llamados a subrutinas, resolviendo el problema desde el programa principal;

org 1000h ;zona de decLaracion de variables
	num1 db 5h
	num2 db 3h
	res dw ?
org 2000h ;programa principal
	mov dx,0 ;inicializa en 0
	mov al, num1 ;mueve a la parte baja de al num1
	cmp al,0 ;cmp compara para no multiplicar por 0
	jz fin ;si es 0, se terminó de multiplicar, salta a fin
	mov ah, 0 
	mov cl, num2 ;mueve a cl el num a mul, para decrementar
loop: cmp cl,0 ;para ver si terminó 
	jz fin; si es 0 sale
	add dx, ax ;empieza a multiplicar
	dec cl ;una menos a multiplicar
	jmp loop
fin: mov res,dx
	hlt
	end
	
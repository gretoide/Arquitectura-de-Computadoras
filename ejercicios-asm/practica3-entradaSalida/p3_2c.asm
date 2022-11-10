;c) * Escribir un programa que solicita el ingreso de cinco caracteres por teclado y los envía de a uno por
;  vez a la impresora a través de la PIO a medida que se van ingresando. No es necesario mostrar los
;  caracteres en la pantalla.
PA EQU 30H
PB EQU 31H 
CA EQU 32H
CB EQU 33H

ORG 1000H
DATO DB ?

ORG 2000H
; CONFIGURAMOS EL PIO
	MOV AL, 00000010B
	OUT CA, AL
	
	MOV AL, 00000000B
	OUT CB, AL
; DICTAMINAMOS DONDE GUARDAR LO LEIDO	
	MOV BX, OFFSET DATO
	MOV DL, 5
	
LOOP: CMP DL, 0
	JZ FIN
	INT 6
; CONSULTO STADO DE LA IMPRESORA	
	POLL:IN AL, PA
		AND AL, 00000001B
		JNZ POLL
; ENVIO A IMPRIMIR		
		MOV AL, [BX]
		OUT PB, AL
; FUERZO EL STROBE A UNO
		IN AL, PA
		OR AL, 00000010B
; FUERZO EL STROBE A CERO
		IN AL,PA
		AND AL, 11111101B 
;-------------------------------
		DEC DL
		JMP LOOP
	FIN: INT 0
END
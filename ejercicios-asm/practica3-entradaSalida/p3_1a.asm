;a) * Escribir un programa que encienda las luces con el patrón
; 11000011, o sea, solo las primeras y las
;últimas dos luces deben prenderse, y el resto deben apagarse.

PB EQU 31H
CB EQU 33H

ORG 1000H
	PATRON DB 11000011B

ORG 2000H
	;CONFIGURAMOS CB
	;---------------
	MOV AL, 00000000B ;TODO DE SALIDA, YA QUE VAMOS A MOSTRAR DATOS
	OUT CB, AL
	
	;MANDAMOS PATRON A PB - LUCES
	;----------------------------
	MOV AL, PATRON
	OUT PB, AL
	
INT 0
END
	
;d) * Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
;que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
;través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
;se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
;los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón
;11111111.

EOI EQU 20H
IMR EQU 21H
PB EQU 31H
CB EQU 33H
INT1 EQU 25H ;ID 10
CONT EQU 10H
COMP EQU 11H

ORG 3000H
	TIMER: CMP PATRON, 11111111B
	JNZ PRENDO
	JMP FIN ;SI LLEGO A 11111111B, SALE DE CONTAR SIN REINICIAR
	PRENDO: MOV AL, PATRON
	OUT PB, AL
	INC PATRON
	JMP RESET
	
	RESET: MOV AL, 0
	OUT CONT, AL
	
	MOV AL, 20H
	OUT EOI, AL
	
	FIN: IRET
	
ORG 1000H
PATRON DB 00000000B

ORG 2000H
	;GUARDAR VECTOR
	MOV AX, TIMER
	MOV BX, 40
	MOV [BX],AX
	;CONFIGURAR PIC
	CLI
		MOV AL, 11111101B ;HABILITAMOS TIMER
		OUT IMR, AL
		
		MOV AL, 10 ; TIMER = ID 10
		OUT INT1, AL
		
		;CONFIGURAR REGISTROS TIMER
		MOV AL, 0
		OUT CONT, AL
		
		MOV AL, 1
		OUT COMP, AL
	STI
	;CONFIGURAMOS PA COMO ENTRADA Y PB COMO SALIDA
	
	MOV AL, 00000000B
	OUT CB, AL
	
	LOOP: JMP LOOP
	
INT 0
END
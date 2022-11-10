;d)Escribir un programa que solicite el ingreso de cinco caracteres por teclado y los almacene en memoria.
;Una vez ingresados, que los envíe a la impresora a través del HAND-SHAKE, en primer lugar tal cual
;fueron ingresados y a continuación en sentido inverso. Utilizar el HAND-SHAKE en modo consulta de
;estado. ¿Qué diferencias encuentra con el ejercicio 2c?

;INGRESAR 5 CARACTERES Y ALMACENARLOS

;IMPRIMIR EN ORDEN Y EN INVERSO

; HAND-SHAKE POR POLLING

DATOS EQU 40H
ESTADO EQU 41H

ORG 3000H
	POLL: IN AL, ESTADO
				AND AL, 00000001B
				JNZ POLL
	RET

ORG 1000H
	LONGITUD DB 0
	STRING DB ?
	
ORG 2000H
	;CONFIGURAR HAND-SHAKE
	MOV AL , 01111111B
	OUT ESTADO, AL
	
	;MANDAMOS CARACTER
	MOV BX, OFFSET STRING
	
	LECTURA: CMP LONGITUD, 5
		JZ IMPRESION
		INT 6
		INC BX
		INC LONGITUD
		JMP LECTURA

	;REINICIAMOS PUNTERO
IMPRESION: 	MOV BX, OFFSET STRING
	
	DERECHO: CMP LONGITUD, 0
		JZ DECREMENTAR
		CALL POLL
		MOV AL, [BX]
		OUT DATOS, AL
		
		INC BX
		DEC LONGITUD
		JMP DERECHO
		
		DECREMENTAR: DEC BX
		INVERSO: CMP LONGITUD, 5
		JZ FIN
		CALL POLL
		MOV AL,[BX]
		OUT DATOS, AL
		
		DEC BX
		INC LONGITUD
		JMP INVERSO
FIN: INT 0
END
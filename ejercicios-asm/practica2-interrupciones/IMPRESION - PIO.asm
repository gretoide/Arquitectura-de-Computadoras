PA EQU 30H ;ESTADO - LLAVES
PB EQU 31H ;DATOS - LUCES
CA EQU 32H
CB EQU 33H

ORG 1000H
	MSJ DB "HOLA"
	FIN DB ?

ORG 2000H
	; 1) CONFIGURACION DE PIO
	;------------------------
	
		;PA COMO ESTADO
		MOV AL, 11111101B ;strobe deshabilitado
		OUT CA, AL 
	
		;PB COMO DATOS PANTALLA, LAS LUCES
		MOV AL, 0B
		OUT CB, AL ;configuramos pb como salida
	
		
	; 2) RECORREMOS EL STRING
	;------------------------
	
		MOV BX, OFFSET MSJ ;le mandamos el inicio de nuestro mensaje
		;------------------------
		POLL: IN AL, PA
			AND AL, 00000001B	;consulta el estado del busy
			JNZ POLL
		
			;LE MANDAMOS EL CARACTER SI ESTA LIBRE
			MOV AL, [BX]  ;le mandamos "hola" al pb
			OUT PB, AL 
		
			;FORZAR STROBE A 1 (para que imprima)
			IN AL, PA
			OR AL, 00000010B
			OUT PA, AL
	
			;FORZAMOS STROBE A 0 (reiniciamos)
			IN AL, PA ;forzamos al strobe a 0 para deshabilitarlo
			AND AL, 11111101B
			OUT PA, AL
			
			INC BX
			CMP BX, OFFSET FIN
			JNZ POLL
		;------------------------
INT 0
END
	
	
	
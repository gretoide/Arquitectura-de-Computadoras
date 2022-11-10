;11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en
;un registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H ; ID = 10 (10*4 = 40 <- Direccion del vector de interrupcion)

ORG 3000H
	; 1) Declaracion de subrutina que atiende la interrupcion
		SUB_F10: MOV [BX],DL ;guarda el caracter actual
		MOV AL, OFFSET FIN - OFFSET CARACTER ;Reiniciamos el contador de caracteres, ya que se pisa con una nueva
		;interrupcion
		INT 7
		MOV AL, 20H
		OUT EOI,AL
		IRET
		
ORG 4000H
	ABECEDARIO: CMP DL, 5BH ;compara con el siguiente a Z
		JZ REINICIO
		INC DL ;incrementa
		JMP ABECEDARIO
	REINICIO: MOV DL, 41H ;reinicia el abecedario
		JMP ABECEDARIO
	RET
	
	ORG 1000H
	CARACTER DB ?
	DB 13
	FIN DB ?
		
ORG 2000H
	; 2) Configuramos el vector de interrupciones
	;--------------------------------------------
	MOV AX, SUB_F10 ; 3000H
	MOV BX, 40; <- Direccion del vector de interrupciones
	MOV [BX], AX ; <- 40H = 3000H
	
	; 3) Configuracion el pic
	;------------------------
	CLI
		MOV AL, 11111110B ;Solo habilita la f10
		OUT IMR, AL
		
		MOV AL, 10 ;Nuestro id
		OUT INT0, AL
	STI
	
	;Mueve los operandos
	;-------------------
	MOV BX, OFFSET CARACTER ; BX = 1000H
	MOV DX, 41H ; Inicializamos el abecedario A
	MOV AL, OFFSET FIN - OFFSET FIN
	
	CALL ABECEDARIO
	
INT 0
END
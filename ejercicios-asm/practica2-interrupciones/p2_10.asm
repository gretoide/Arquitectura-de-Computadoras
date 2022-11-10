;10) Interrupción por hardware: tecla F10.
;Escribir un programa que, mientras ejecuta un lazo infinito, cuente el número de veces que se presiona la tecla F10 y
;acumule este valor en el registro DX.

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
	
ORG 3000H
	; 1) Subrutina que atiende nuestra interrupcion
	TECLA_F10: INC DL
		;Le avisamos al pic, que la interrupcion fue atentida
		MOV AL, 20H
		OUT EOI, AL
	IRET

ORG 2000H
		;Inicializamos DX
	MOV DX, 0

	;Configuramos vector de interrupciones
	MOV AX, TECLA_F10
	MOV BX, 40
	MOV [BX],AX ;40H = 3000H

	;Configuramos el pic
	CLI
		MOV AL, 11111110B ;Para decirle a IMR que atienda solo la tecla  f10
		OUT IMR, AL ; IMR = 11111110 <- Solo atiende f10
		
		MOV AL, 10 ;Ahora la tecla f10 está asociado con el ID = 10
		OUT INT0, AL
	STI
	
	LOOP: JMP LOOP ;Lazo infinito
	
INT 0
END
	
;b) * Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es así, mostrar en
;pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo importa el valor
;de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se manejan con las
;teclas 0-7.

PA EQU 30H
CA EQU 32H

ORG 1000H
	OFF DB "ESTA APAGADA"
	FIN DB ?
	ON DB "ESTA ENCENDIDA"
	FIN2 DB ?
	
ORG 2000H
	;CONFIGURAMOS CA PARA DEVOLVER DATOS
	;-----------------------------------
	MOV AL, 11111111B
	OUT CA, AL
	
	IN AL, PA ;NOS GUARDAMOS EL VALOR
	
	AND AL, 10000000B ;HACEMOS UN AND
	
	CMP AL, 0 ;ES DECIR QUE ESTABA APAGADA
	JZ APAGADA
	;SINO
	MOV BX, OFFSET ON
	MOV AL, OFFSET FIN - OFFSET ON
	INT 7
	JMP FINAL
	
	APAGADA: MOV BX, OFFSET OFF
	MOV AL, OFFSET FIN2 - OFFSET OFF
	INT 7
	FINAL: INT 0
END
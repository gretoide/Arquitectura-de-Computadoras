;8) Escribir un programa que efectúe la resta de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Antes de visualizarlo el programa debe verificar si el resultado es positivo o negativo
;y anteponer al valor el signo correspondiente.

ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?

ORG 1500H
NUM1 DB ?
NUM2 DB ?
RES_S DB "+" ; Decena del resultado.
RES_U DB ? ; Unidad del resultado.
; Por ej. si se suma "6" + "7", la decena del resultado sera "1" y la unidad "3"

ORG 2000H
	MOV BX, OFFSET MSJ
	MOV AL, OFFSET FIN-OFFSET MSJ
	INT 7     ;Imprimo mensaje en pantalla pidiendo el ingreso de un numero

	;LEEMOS PRIMER OPERANDO
	MOV BX, OFFSET NUM1
	INT 6     ;Leo un caracter y queda guardado en NUM1

	;GUARDAMOS SEGUNDO OPERANDO
	MOV BX, OFFSET NUM2
	INT 6 ; Leo un caracter y queda guardado en NUM2
	MOV BX, OFFSET MSJ
	INT 7    ; Imprimo mensaje en pantalla pidiendo el ingreso de un numero

	;MOVEMOS OPERANDOS PARA COMPARAR
	MOV AL, NUM1
	MOV AH, NUM2
	CMP AL,AH
	JNS POSITIVO
	JS NEGATIVO
	
	;RESULTADO SIN SIGNO
	POSITIVO: SUB AL, AH ;realizamos la operacion
	ADD AL, 30H
	MOV RES_U, AL ;guardamos el resultado en res_u
	JMP IMPRIMIR

	;RESULTADO CON SIGNO
	NEGATIVO: SUB AH, AL
		ADD AH, 30H
		MOV RES_U, AH
		MOV BX, OFFSET RES_S
		MOV BYTE PTR [BX], 2DH ;2DH = -
		JMP IMPRIMIR
	
	;IMPRIMIMOS RESULTADO
	IMPRIMIR: MOV BX, OFFSET RES_S ;le mandamos la direccion desde donde imprimir
	MOV AL, 2
	INT 7

INT 0
END

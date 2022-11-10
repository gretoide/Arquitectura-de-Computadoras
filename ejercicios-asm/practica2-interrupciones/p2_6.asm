; 6) * Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado y muestre 
; en pantalla dicho número expresado en letras. Luego que solicite el ingreso de otro y así sucesivamente. 
; Se debe finalizar la ejecución al ingresarse en dos vueltas consecutivas el número cero.

ORG 1000H
	CERO DB "CERO  " ;Todos los nombres tienen 6 caracteres
	DB "UNO   " ; facilitar posicionarnos al imprimir el nombre del numero
	DB "DOS   "	
	DB "TRES  "
	DB "CUATRO"
	DB "CINCO "
	DB "SEIS  "
	DB "SIETE "
	DB "OCHO  "
	DB "NUEVE "
	MSJ DB "|INGRESE UN NUMERO: "
	FIN DB ?
	
ORG 1500H
	NUM DB ? ;NUMERO A LEER POR TECLADO
	
ORG 2000H
	MOV CL, 0 ;CONTADOR PARA EL 0
	
	;IMPRIMIMOS MENSAJE
	OTRO: MOV BX, OFFSET MSJ
	MOV AL, OFFSET FIN - OFFSET MSJ
	INT 7
	
	;LEEMOS CARACTER
	MOV BX, OFFSET NUM
	INT 6
	
	;COMPARAMOS PARA IMPRIMIR
	CMP NUM, 30H ;compara con 0
	JNZ NO_ES_CERO
	INC DL ;incremento el primer 0
	JMP SEGUIR
	
	;CUANDO NO VIENE UN CERO
	NO_ES_CERO: MOV CL, 0 ;reiniciamos contador
	
	;SEGUIMOS PREGUNTANDO
	SEGUIR: MOV BX, OFFSET CERO ;le mandamos la direccion del primero
	MOV AL, 6
	
	;LOOP QUE COMPARA PARA IMPRIMIR EL CARACTER
	LOOP: CMP NUM, 30H
	JZ IMPRIME
	ADD BX, 6 ;vamos aumentado por caracteres
	DEC NUM ;para que cuando llegue a 0 esté posicionado bien
	JMP LOOP
	
	;LA SUBRUTINA QUE IMPRIME
	IMPRIME: INT 7
	CMP CL, 2
	JNZ OTRO ;si no vinieron dos ceros, pide otro caracter

INT 0
END
	
	
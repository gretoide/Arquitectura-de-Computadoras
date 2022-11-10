;12) Interrupción por hardware: TIMER.
;Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
;desde el inicio de la ejecución.
EOI  EQU 20H
IMR  EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H
 
ORG 3000H
 SUB_TIMER: INC UNIDAD
  CMP UNIDAD, 3AH ;mientras no se pase, imprime
	 JNZ FIN
	 MOV UNIDAD, 30H ;si se pasa, resetea y aumenta la decena
	 INC DECENA
	 CMP DECENA, 36H ;nunca se pasa de 60 segundos
	 JNZ FIN
	 MOV DECENA, 30H
  
  FIN: MOV AL, OFFSET FINAL - OFFSET DECENA
   INT 7
   MOV AL, 0
   OUT CONT, AL
   
   MOV AL, 20H
   OUT EOI, AL
  IRET
  
ORG 1000H
 DECENA DB 30H
 UNIDAD DB 30H
 DB 13
 FINAL   DB ?
  
ORG 2000H
	;GUARDAMOS EN EL VECTOR DE INTERRUPCIONES LA SUBRUTINA
	;-----------------------------------------------------
	MOV AX, SUB_TIMER
	MOV BX, 40 ;ID 10, 10*4 = 40H VI
	MOV [BX], AX
	
	;CONFIGURAMOS EL PIC
	;-------------------
	CLI
		MOV AL, 11111101B ;HABILITAMOS SOLO EL TIMER
		OUT IMR, AL
  
		MOV AL, 10 ; INT1 = ID 10
		OUT INT1, AL
		
		;CONFIGURAMOS TIMER
		;------------------
		MOV AL, 1 ;COMPARA CADA 1 SEGUNDO
		OUT COMP, AL
  
		MOV AL, 0 
		OUT CONT, AL
	STI
 
 MOV BX, OFFSET DECENA
 
 LOOP: JMP LOOP

 INT 0
END
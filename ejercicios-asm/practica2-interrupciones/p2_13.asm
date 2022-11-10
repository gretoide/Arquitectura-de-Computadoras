;13) Modificar el programa anterior para que 
;también cuente minutos (00:00 - 59:59), pero que 
;actualice la visualización en
;pantalla cada 10 segundos.
EOI  EQU 20H
IMR  EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

ORG 3000H
	SEGUNDOS: INC SEGUNDO
		CMP SEGUNDO, 3036H 
		JNZ MINUTOS ;si no llego a 00:60, salta a minuto
		MOV AX, MINUTO ;sino, aumenta el minuto 01:00
		INC AH
		MOV MINUTO, AX
		MOV SEGUNDO, 3030H ;resetea los segundos
		
		MINUTOS: CMP MINUTO, 3036H ;si aun no es 60:60, imprime
		JNZ RESET
		MOV AX, MINUTO
		CMP AL, 36H
		JNZ RESET
		MOV MINUTO, 3030H
		
  RESET: MOV AL, OFFSET FINAL - OFFSET MINUTO
   INT 7
   MOV AL, 0
   OUT CONT, AL
   
   MOV AL, 20H
   OUT EOI, AL
  IRET
  
ORG 1000H
	MINUTO DW 3030H
  ESPACIO DB ":"
	SEGUNDO DW 3030H
	DB 13
	FINAL   DB ?
  
ORG 2000H
 ;GUARDAMOS SUBRUTINA
 ;-------------------
 MOV AX, SEGUNDOS
 MOV BX, 40
 MOV [BX], AX
 
 ;CONFIGURAMOS PIC
 ;---------------
 CLI
  MOV AL, 11111101B
  OUT IMR, AL
  
  MOV AL, 10
  OUT INT1, AL
  
  MOV AL, 1
  OUT COMP, AL
  
  MOV AL, 0
  OUT CONT, AL
 STI
 
 MOV BX, OFFSET MINUTO
 
 LAZO: JMP LAZO
 INT 0
END
EOI EQU 20H
IMR EQU 21H
INT2 EQU 26H
DATOS EQU 40H
ESTADO EQU 41H

ORG 3000H
 SUB_HAND: CMP BANDERA, 1
 JZ FIN
 
 DERECHO: CMP LONGITUD, 0
 JZ CORRIJO
 CALL POLL
 MOV AL, [BX]
 OUT DATOS, AL
 INC BX
 DEC LONGITUD
 JMP DERECHO
 
 CORRIJO: DEC BX
 
 INVERSO: CMP LONGITUD, 5
 JZ CAMBIO
 CALL POLL
 MOV AL, [BX]
 OUT DATOS, AL
 DEC BX
 INC LONGITUD
 JMP INVERSO
 
 CAMBIO: MOV BANDERA, 1
 FIN: MOV AL, EOI
 OUT EOI, AL
 
 IN AL, ESTADO
 AND AL, 01111111B
 OUT ESTADO, AL
 IRET

ORG 4000H
 POLL: IN AL, ESTADO
 AND AL, 00000001B
 JNZ POLL
 RET
 
ORG 1000H
 BANDERA DB 0
 LONGITUD DB 0
 STRING DB ?

ORG 2000H
 ;GUARDAR SUBRUTINA
 MOV AX, SUB_HAND
 MOV BX, 40
 MOV [BX], AX
 
 ;LEEMOS DATOS
 MOV BX, OFFSET STRING
 
 LECTURA: CMP LONGITUD, 5
 JZ IMPRIMIR
 INT 6
 INC LONGITUD
 INC BX
 JMP LECTURA
 
 IMPRIMIR: MOV BX, OFFSET STRING
 
 ;CONFIGURAR PIC
 CLI
  MOV AL, 11111011B
  OUT IMR, AL
  
  MOV AL, 10
  OUT INT2, AL
  
  IN AL, ESTADO
  OR AL, 10000000B
  OUT ESTADO, AL
 STI
 
 LAZO: CMP BANDERA, 0
 JZ LAZO
 
INT 0
END
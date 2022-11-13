;4) El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo. 
;Se calcula a partir del peso (expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura (expresada en metros, 
;por ejemplo 1,73 m), usando la fórmula: 
;IMC = peso / (estatura)2
;De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en: 
;Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30). 
;Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección 
;etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla: 

.data
peso: .double 80.0
estatura: .double 1.80
imc: .double 0.0
estado: .word 0

.code
;cargamos las variables
l.d f1, peso($zero)
l.d f2, estatura($zero)
l.d f3, imc($zero)
l.d f4, estado($zero)
daddi f5, $zero, 

;llamamos subrutina
jal calcularImc

c.le.d f3,


;subrutina
calcularImc: mul.d f2,f2,f2
div.d f3, f1, f2
s.d f3, imc($zero)
jr $ra
halt
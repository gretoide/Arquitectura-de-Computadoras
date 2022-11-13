;3) *Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm. 
;Pista: la superficie de un triángulo se calcula como: 
; Superficie = (base x altura) / 2 

.data
base: .double 5.85
altura: .double 13.47
res: .double 0.0
const: .double 2.0

.code
;guardamos valores
l.d f1, base($zero) ;cargamos la base
l.d f2, altura($zero) ;cargamosa altura
l.d f3, res($zero)
l.d f4, const($zero)

;realizamos operaciones
mul.d f5,f1,f2 ;base . altura
div.d f3,f5,f4 ;(||)/2
s.d f3, res($zero)
halt


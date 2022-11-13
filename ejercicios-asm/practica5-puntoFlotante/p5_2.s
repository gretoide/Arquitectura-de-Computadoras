;2) *Es posible convertir valores enteros almacenados en alguno de los registros r1-r31 a su representación equivalente 
;en punto flotante y viceversa. Describa la funcionalidad de las instrucciones mtc1, cvt.l.d, cvt.d.l y mfc1.

mtc1 rf,fd ;1) copia los 64 bits del registro entero rf al registro fd de punto flotante.
cvt.d.l fd,ff ;2) convierte a un punto flotante el valor entero copiado al registro fd, dejandolo en ff.

mfc1 rd, ff ;1)copia los 64 bits del registro ff de punto flotante, al registro rd entero.
cvt.l.d fd, ff ;2)convierte a entero el valor en punto flotante, contenido en fd, dejándolo en ff.

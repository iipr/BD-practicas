LOAD DATA 

INFILE 'descuentos.txt'
INTO TABLE DESCUENTOS
APPEND 
FIELDS TERMINATED BY ';' 
TRAILING NULLCOLS (codigo, fecha_caducidad DATE 'DD-MM-YY', "porcentaje descuento")

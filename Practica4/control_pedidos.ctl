LOAD DATA 

INFILE 'pedidos.txt'
INTO TABLE PEDIDOS
APPEND 
FIELDS TERMINATED BY ';' 
 TRAILING NULLCOLS (codigo "Seq_CodPedidos.nextval", estado, fecha_hora_pedido DATE 'DD-MM-YY:HH24:MI',
  fecha_hora_entrega DATE 'DD-MM-YY:HH24:MI',
  "importe total", cliente)
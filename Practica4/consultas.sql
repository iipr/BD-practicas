
--1 
select *
from CLIENTES
order by APELLIDO;
--2
select 	RESTAURANTES.NOMBRE, DIAS.NOMBRE AS DIA, TO_CHAR(HORA_APERTURA, 'HH24:MI'), TO_CHAR(HORA_CIERRE, 'HH24:MI')
from RESTAURANTES, HORARIOS, DIAS
where codigo = restaurante AND "dia semana" = dia
ORDER BY RESTAURANTES.NOMBRE;
 --3
SELECT DISTINCT CLIENTES.DNI, CLIENTES.NOMBRE, CLIENTES.APELLIDOS
FROM (CONTIENE NATURAL INNER JOIN PLATOS), PEDIDOS, CLIENTES
WHERE PLATOS.CATEGORIA = 'picante' AND PEDIDOS.CODIGO = CONTIENE.PEDIDO AND CLIENTES.DNI = PEDIDOS.CLIENTE AND PLATO = PLATOS.NOMBRE;
 --4
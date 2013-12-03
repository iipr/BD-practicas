
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
 SELECT DNI
 FROM CLIENTES C1
 WHERE NOT EXISTS ((SELECT CODIGO
                FROM RESTAURANTES)
                MINUS
                (SELECT RESTAURANTE
                FROM CLIENTES C2, PEDIDOS, CONTIENE
                WHERE C2.DNI=CLIENTE AND CODIGO=PEDIDO AND C1.DNI=C2.DNI ));
--5
SELECT DISTINCT DNI, NOMBRE, APELLIDOS
FROM CLIENTES, PEDIDOS
WHERE DNI=CLIENTE AND ESTADO <> 'ENTREGADO';
--6
SELECT CODIGO, ESTADO, FECHA_HORA_PEDIDO, FECHA_HORA_ENTREGA,"importe total", CLIENTE
FROM PEDIDOS
WHERE PEDIDOS."importe total" = (SELECT MAX("importe total")
                        FROM PEDIDOS);
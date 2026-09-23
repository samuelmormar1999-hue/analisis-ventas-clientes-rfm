
#01.Estructura de las tablas
describe clientes;
describe pedidos;
describe productos;
describe ventas;

#02. Volumen de registros
select COUNT(*) from clientes;
select COUNT(*) from pedidos;
select COUNT(*) from productos;
select COUNT(*) from ventas;

#03. Claves primarias
#Clientes
select 
	count(*) as filas, 
    count(id_cliente) as ids_no_nulos,
    count(distinct id_cliente) as ids_unicos
from clientes;

#Productos
select 
	count(*) as filas, 
    count(id_producto) as ids_no_nulos,
    count(distinct id_producto) as ids_unicos
from productos;

#Ventas 
select 
	count(*) as filas ,
    count(id_pedido) as ids_no_nulos,
    count(distinct id_pedido) as ids_unicos
from ventas;

#04.Comprobación de duplicados
select 
	id_pedido,
    count(*) as repeticiones 
from ventas 
group by id_pedido
having count(*) > 1;

select 
	id_producto,
    count(*) as repeticiones 
from productos 
group by id_producto
having count(*) > 1;

select id_cliente, 
	count(*) as repeticiones
from clientes 
group by id_cliente
having count(*) > 1;

select
    id_pedido,
    id_producto,
    count(*) as repeticiones
from pedidos
group by
    id_pedido,
    id_producto
having count(*) > 1;

 #05. Valores nulos 
select 
	sum(id_cliente is null) as id_cliente_nulos,
	sum(segmento_cliente is null) as segmento_cliente_nulos,
    sum(pais_cliente is null) as pais_cliente_nulos
from clientes;

select 
	sum(id_pedido is null) as id_pedido_nulos,
	sum(id_producto is null) as id_producto_nulos,
	sum(cantidad is null) as cantidad_nulos,
	sum(precio_unitario is null) as precio_unitario_nulos
from pedidos;

select 
	sum(id_producto is null) as id_producto_nulos,
    sum(coste_producto is null)  as coste_producto_nulos,
    sum(precio_unitario is null) as precio_unitario_nulos
from productos;

 select 
	sum(id_pedido is null) as id_pedido_nulos,
	sum(id_cliente is null) as id_cliente_nulos,
    sum(fecha_pedido is null)  as fecha_nulos,
    sum(cantidad is null) as cantidad_nulos
from ventas;

#06.Integridad referencial 

#Clientes en ventas pero no en la tabla de clientes
select count(*) as clientes_sin_correspondencia
from ventas as v 
left join clientes as c 
	on v.id_cliente = c.id_cliente
where c.id_cliente is null;

#Pedidos sin correspondencia en la tabla de ventas 

select count(*) as pedidos_sin_correspondencia 
from pedidos as p 
left join ventas as v 
	on p.id_pedido = v.id_pedido
where v.id_pedido is null; 

# Productos sin correspondencia en la tabla de pedidos 

select count(*) as productos_sin_correspondencia 
from productos as p 
left join pedidos as pe 
	on p.id_producto = pe.id_producto 
where pe.id_producto is null;



#08Fechas
SELECT
    MIN(fecha_pedido) AS fecha_minima,
    MAX(fecha_pedido) AS fecha_maxima
FROM ventas as periodo_fechas;

SELECT COUNT(*) as fechas_atípicas
FROM ventas 
WHERE fecha_pedido < '2021-01-01'
   OR fecha_pedido > '2025-12-31';
   
 
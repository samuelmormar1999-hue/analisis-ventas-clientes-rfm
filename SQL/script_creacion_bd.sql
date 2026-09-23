CREATE DATABASE ecommerce_bi;

use ecommerce_bi;
 drop table clientes;
CREATE TABLE clientes (
    id_cliente VARCHAR(50) PRIMARY KEY,
    nombre_cliente VARCHAR(150),
    edad_cliente INT,
    genero VARCHAR(30),
    segmento_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100),
    estado_cliente VARCHAR(100),
    pais_cliente VARCHAR(100),
    region VARCHAR(100),
    codigo_postal_cliente VARCHAR(20),
    coste_adquisicion_cliente DECIMAL(10,2)
);



CREATE TABLE productos (
    id_producto VARCHAR(50) PRIMARY KEY,
    nombre_producto VARCHAR(255),
    categoria_producto VARCHAR(100),
    subcategoria_producto VARCHAR(100),
    marca VARCHAR(100),
    proveedor VARCHAR(150),
    precio_unitario DECIMAL(10,2),
    coste_producto DECIMAL(10,2),
    valoracion_producto DECIMAL(3,2)
);



CREATE TABLE pedidos (
    id_pedido VARCHAR(50),
    id_producto VARCHAR(50),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    porcentaje_descuento DECIMAL(7,6),
    importe_descuento DECIMAL(10,2),
    ventas_brutas DECIMAL(12,2),
    importe_impuestos DECIMAL(10,2),
    coste_envio DECIMAL(10,2),
    ventas_netas DECIMAL(12,2),
    coste_producto DECIMAL(12,2),
    beneficio DECIMAL(12,2)
);



CREATE TABLE ventas (
    id_pedido VARCHAR(50) PRIMARY KEY,
    fecha_pedido DATE,
    hora_pedido TIME,
    estado_pedido VARCHAR(50),
    canal_venta VARCHAR(50),

    id_cliente VARCHAR(50),

    nombre_cliente VARCHAR(150),
    edad_cliente INT,
    genero VARCHAR(30),
    segmento_cliente VARCHAR(100),
    tipo_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100),
    provincia_cliente VARCHAR(100),
    pais_cliente VARCHAR(100),
    region VARCHAR(100),
    codigo_postal_cliente VARCHAR(20),

    metodo_pago VARCHAR(100),
    estado_pago VARCHAR(50),
    moneda VARCHAR(20),
    metodo_envio VARCHAR(100),
    almacen VARCHAR(100),

    dias_entrega INT,
    dias_entrega_estimados INT,
    estado_entrega VARCHAR(50),
    estado_devolucion VARCHAR(50),
    motivo_devolucion VARCHAR(255),

    valoracion_cliente DECIMAL(3,2),
    sentimiento_resena VARCHAR(50),
    resena_cliente TEXT,

    canal_marketing VARCHAR(100),
    nombre_campana VARCHAR(150),
    codigo_cupon VARCHAR(100),

    puntos_fidelizacion_obtenidos INT,
    puntos_fidelizacion_canjeados INT,

    cantidad INT,

    ventas_brutas DECIMAL(12,2),
    importe_descuento DECIMAL(12,2),
    importe_impuestos DECIMAL(12,2),
    coste_envio DECIMAL(12,2),
    ventas_netas DECIMAL(12,2),
    coste_producto DECIMAL(12,2),
    beneficio DECIMAL(12,2),

    porcentaje_margen_beneficio DECIMAL(10,4),
    valor_vida_cliente DECIMAL(12,2),

    cliente_recurrente BOOLEAN,
    numero_pedidos_cliente INT,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Clean/clientes_limpio.csv'
INTO TABLE clientes
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from clientes;


LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Clean/pedidos_limpio.csv'
INTO TABLE pedidos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from pedidos; 

select id_pedido from pedidos
group by id_pedido
order by id_pedido asc
;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Clean/productos_limpio.csv'
INTO TABLE productos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from productos;

TRUNCATE TABLE ventas;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Clean/ventas_limpio.csv'
INTO TABLE ventas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    id_pedido,
    fecha_pedido,
    hora_pedido,
    estado_pedido,
    canal_venta,
    id_cliente,
    nombre_cliente,
    edad_cliente,
    genero,
    segmento_cliente,
    tipo_cliente,
    ciudad_cliente,
    provincia_cliente,
    pais_cliente,
    region,
    codigo_postal_cliente,
    metodo_pago,
    estado_pago,
    moneda,
    metodo_envio,
    almacen,
    @dias_entrega,
    @dias_entrega_estimados,
    estado_entrega,
    estado_devolucion,
    motivo_devolucion,
    @valoracion_cliente,
    sentimiento_resena,
    resena_cliente,
    canal_marketing,
    nombre_campana,
    codigo_cupon,
    puntos_fidelizacion_obtenidos,
    puntos_fidelizacion_canjeados,
    cantidad,
    ventas_brutas,
    importe_descuento,
    importe_impuestos,
    coste_envio,
    ventas_netas,
    coste_producto,
    beneficio,
    porcentaje_margen_beneficio,
    valor_vida_cliente,
    @cliente_recurrente,
    numero_pedidos_cliente
)
SET
    dias_entrega = NULLIF(@dias_entrega, ''),
    dias_entrega_estimados = NULLIF(@dias_entrega_estimados, ''),
    valoracion_cliente = NULLIF(@valoracion_cliente, ''),
    cliente_recurrente =
        CASE
            WHEN @cliente_recurrente = 'True' THEN 1
            WHEN @cliente_recurrente = 'False' THEN 0
            ELSE NULL
        END;


select * from ventas;


	
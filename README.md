# E-commerce Analytics: Ventas, Operaciones, Clientes y Productos

Proyecto de Business Intelligence desarrollado a partir de un dataset de comercio electrónico con más de **150.000 transacciones entre 2021 y 2025**.

El objetivo ha sido construir un flujo analítico completo, desde la limpieza y preparación de los datos hasta la creación de una base de datos, el modelado y la visualización en Power BI.

---

## Objetivo

Transformar datos transaccionales en información útil para analizar el comportamiento del negocio desde cuatro perspectivas principales:

- Ventas y rentabilidad
- Pedidos y operaciones
- Clientes y segmentación RFM
- Productos y rentabilidad

El proyecto busca responder preguntas como:

- ¿Cómo evolucionan las ventas y el margen?
- ¿Qué impacto tienen los descuentos sobre la rentabilidad?
- ¿Qué clientes aportan mayor valor?
- ¿Qué clientes presentan riesgo de pérdida?
- ¿Qué productos y marcas concentran ventas y beneficio?
- ¿Cómo evolucionan cancelaciones y devoluciones?

---

## Herramientas utilizadas

- **Python**
- **Pandas**
- **SQL / MySQL**
- **Power Query**
- **Power BI**
- **DAX**

---

## Proceso de trabajo

### 1. Limpieza y preparación de datos

La primera fase se realizó con **Python y Pandas**.

Se llevaron a cabo tareas como:

- revisión de tipos de datos;
- detección de valores nulos;
- eliminación de duplicados;
- validación de identificadores;
- revisión de inconsistencias;
- transformación y preparación de variables.

---

### 2. Base de datos

Los datos limpios se cargaron posteriormente en **MySQL**, estructurando la información en diferentes tablas relacionadas con:

- ventas;
- pedidos;
- clientes;
- productos.

SQL también se utilizó para realizar análisis exploratorios y comprobar determinadas relaciones entre variables antes de construir el dashboard.

---

### 3. Modelo de datos

En Power BI se construyó un modelo basado en tablas de hechos y dimensiones.

Principales tablas:

#### Tablas de hechos
- `h_ventas`
- `h_pedidos`

#### Tablas de dimensiones
- `d_clientes`
- `d_producto`
- `D_Fechas`

Este modelo permite analizar ventas, clientes y productos manteniendo relaciones consistentes entre las diferentes entidades.

---

## Dashboard

El dashboard se divide en cuatro áreas de análisis.

### 1. Ventas y Rentabilidad

Incluye indicadores como:

- ventas netas;
- unidades vendidas;
- beneficio;
- margen;
- variación mensual;
- variación interanual;
- evolución de los últimos meses.

---

### 2. Pedidos y Operaciones

Permite analizar:

- volumen de pedidos;
- evolución mensual;
- cancelaciones;
- devoluciones;
- unidades vendidas;
- marcas con mayor volumen.

---

### 3. Clientes y Segmentación RFM

Se desarrolló un modelo **RFM** utilizando:

- **Recency:** tiempo desde la última compra.
- **Frequency:** número de compras realizadas.
- **Monetary:** valor económico generado.

Cada cliente recibe una puntuación y posteriormente se clasifica en distintos segmentos:

- Campeones
- Clientes Leales
- Clientes Rentables
- Clientes Recientes
- Grandes Gastadores
- Leales Potenciales
- Prometedores
- En Riesgo
- Dudosos

---

### 4. Productos y Rentabilidad

Esta página permite comparar:

- productos;
- categorías;
- subcategorías;
- marcas;
- unidades vendidas;
- ventas;
- beneficio;
- margen.

El objetivo es identificar diferencias entre productos que generan volumen y productos que realmente aportan mayor rentabilidad.



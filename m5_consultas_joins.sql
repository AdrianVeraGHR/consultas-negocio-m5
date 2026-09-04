-- Consulta 1 — Vista base del proyecto (INNER JOIN)
/*Trabajás sobre el esquema que creaste en el Checkpoint del Módulo 3. 
Combiná con INNER JOIN tu tabla de ventas con las tablas descriptivas que hayas modelado (clientes, productos y cualquier otra dimensión de tu caso de negocio) para obtener en una sola fila, 
como mínimo: fecha, identificación del cliente, descripción del producto, cantidad, precio unitario y total de venta.
Sumá además las columnas descriptivas que existan en tu propio esquema (por ejemplo segmento de cliente, categoría de producto o región, si las modelaste).
No es necesario que estén todas: la consulta se evalúa sobre las tablas que vos diseñaste, no sobre una lista fija.
Si tu esquema no tiene ninguna dimensión geográfica ni de segmentación, agregala ahora al script del Módulo 3 con dos o tres registros de ejemplo. 
Esta consulta va a ser la fuente de datos principal en Power BI, así que conviene que tenga al menos una columna para agrupar y una para filtrar.*/

SELECT 
vent.id_venta, prod.nombre_producto, vent.cantidad, vent.precio_unitario , vent.precio_total, vent.tipo_operacion,
vent.objetivo_minimo, vent.trimestre_venta, clien.nombre as "cliente", clien.ciudad as "ciudad cliente", clien.segmento, terr.zona
FROM ventas as "vent"
INNER JOIN clientes as "clien"
ON vent.id_cliente = clien.id_cliente
INNER JOIN territorio as "terr"
ON vent.id_territorio = terr.id_territorio
INNER JOIN productos as "prod"
ON vent.id_producto = prod.id_producto

-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
/* Identificá clientes registrados que aún no han realizado ninguna compra. Mostrá su nombre, email y fecha de registro. Usá WHERE ... IS NULL para aislar los casos.*/
  
SELECT clien.nombre, clien.fecha_registro, clien.fecha_registro
FROM clientes as "clien"
LEFT JOIN ventas as "vent"
ON clien.id_cliente = vent.id_cliente
WHERE vent.id_venta IS NULL

-- Consulta 3 — Productos sin ventas (LEFT JOIN)
/*Identificá productos del catálogo que no tienen ninguna venta registrada. Mostrá nombre del producto, categoría y precio. Usá WHERE ... IS NULL.*/

SELECT prod.nombre_producto, prod.id_categoria, prod.precio FROM productos AS "prod"
LEFT JOIN ventas AS "vent"
ON prod.id_producto = vent.id_producto
WHERE vent.id_venta IS NULL

-- Consulta 4 — Consolidado por canal (UNION ALL)
/* Importante: la columna canal no se consulta, se crea. No busques ese dato en tus tablas — lo generás vos dentro de cada SELECT como valor literal. Ese es el punto de este ejercicio.
Escribí dos SELECT sobre tus ventas, separados por el criterio que corresponda a tu caso (por ejemplo, ventas de dos períodos, dos sucursales o dos orígenes distintos),
y agregá en cada uno una columna de texto fija que identifique el origen. Unilos con UNION ALL y cerrá con un GROUP BY para obtener el total por cada origen.*/

SELECT 
id_venta, id_cliente, id_producto, id_territorio, cantidad, precio_unitario, fecha_venta, precio_total, 'online' as canal,	
tipo_operacion, objetivo_minimo, trimestre_venta
FROM ventas
WHERE trimestre_venta = '26Q1'
UNION ALL
SELECT 
id_venta, id_cliente, id_producto, id_territorio, cantidad, precio_unitario, fecha_venta, precio_total, 'presencial' as canal,	
tipo_operacion, objetivo_minimo, trimestre_venta
FROM ventas
WHERE trimestre_venta = '26Q2'

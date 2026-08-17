-- Consulta 1 — Resumen ejecutivo mensual
SELECT SUM(cantidad * precio_unitario) AS 'Total facturado', 
COUNT(id_venta) as 'Cantidad de pedidos', AVG(precio_unitario) as 'Ticket promedio'
FROM ventas
GROUP BY MONTH(fecha_venta);
-- La función EXTRACT(MONTH FROM fecha_venta) no funciona en la versión de SQL 15.0

-- Consulta 2 — Ranking de productos
SELECT TOP 5 id_producto, SUM(cantidad) AS 'Unidades vendidas', SUM(cantidad * precio_unitario) AS 'Total facturado'
FROM ventas
GROUP BY id_producto
ORDER BY SUM(cantidad * precio_unitario) DESC;

-- Consulta 3 — Clientes recurrentes
SELECT id_cliente, COUNT(id_cliente) AS 'Cantidad de pedidos', SUM(cantidad * precio_unitario) AS 'Total facturado'
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_cliente) > 1
ORDER BY SUM(cantidad * precio_unitario) DESC;

-- Consulta 4 — Meses por encima/por debajo del promedio
SELECT MONTH(fecha_venta) AS 'Mes', SUM(cantidad * precio_unitario) AS 'Total facturado',
CASE
	WHEN SUM(cantidad * precio_unitario) > AVG(cantidad * precio_unitario) THEN 'Por encima'
	WHEN SUM(cantidad * precio_unitario) < AVG(cantidad * precio_unitario) THEN 'Por debajo'
END AS 'Estado del mes'
FROM ventas
GROUP BY MONTH(fecha_venta);

-- Bloque de cierre
/* Observaciones generales:
	1 - El cliente 1 es el que presenta el mayor monto facturado en comparación con otros clientes
	2 - El producto 1 es el que representa el mayor ingreso para la empresa
	3 - Las actividades totales facturadas del mes, superan el promedio facturado de ingresos del mismo mes.
	4 - El producto 4 es el único producto que presenta un único movimiento en el mes.
*/

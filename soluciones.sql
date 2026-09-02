-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: [Adrian Santiago Agustin Vera]
-- Fecha: [30/08/2026]
-- ══════════════════════════════════════════
-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa
-- la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)

SELECT * FROM inventario_sucursal_norte
UNION 
SELECT * FROM inventario_sucursal_sur;

-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock
-- existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)

SELECT COUNT
	(*) AS "Registros físicos de stock"
FROM
	(SELECT nombre_producto FROM inventario_sucursal_norte
	UNION ALL
	SELECT nombre_producto FROM inventario_sucursal_sur) as "Inventario total";

-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas
-- devuelve cada operador y explicá la diferencia en tu README

SELECT COUNT(*) AS filas_union FROM 
	(SELECT nombre_producto FROM inventario_sucursal_norte
	UNION
	SELECT nombre_producto FROM inventario_sucursal_sur) AS resultado_union;

SELECT COUNT(*) AS filas_union_all FROM 
	(SELECT nombre_producto FROM inventario_sucursal_norte
	UNION ALL
	SELECT nombre_producto FROM inventario_sucursal_sur) AS resultado_union_all;

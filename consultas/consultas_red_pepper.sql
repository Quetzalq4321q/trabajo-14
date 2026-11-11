-- Trabajo 14: consultas de solo lectura para DataGrip.
-- Antes de ejecutar, elija red_pepper_db en el selector de la consola.
-- Ejecute cada consulta por separado con Ctrl+Enter o seleccionela.

-- 1. Base actual
SELECT DB_NAME() AS base_actual;

-- 2. Tablas del trabajo
SELECT name AS tabla
FROM sys.tables
WHERE name IN (N'clientes', N'platos', N'pedidos')
ORDER BY name;

-- 3. Todos los clientes
SELECT * FROM dbo.clientes ORDER BY id_cliente;

-- 4. Todos los platos
SELECT * FROM dbo.platos ORDER BY id_plato;

-- 5. Todos los pedidos
SELECT * FROM dbo.pedidos ORDER BY id_pedido;

-- 6. Pedidos con nombres y total
SELECT
    p.id_pedido,
    p.fecha,
    c.nombre AS cliente,
    pl.nombre AS plato,
    pl.categoria,
    p.cantidad,
    pl.precio,
    CAST(p.cantidad * pl.precio AS DECIMAL(10, 2)) AS total
FROM dbo.pedidos AS p
JOIN dbo.clientes AS c ON c.id_cliente = p.id_cliente
JOIN dbo.platos AS pl ON pl.id_plato = p.id_plato
ORDER BY p.id_pedido;

-- 7. Cantidad de registros por tabla
SELECT 'clientes' AS tabla, COUNT(*) AS total FROM dbo.clientes
UNION ALL
SELECT 'platos', COUNT(*) FROM dbo.platos
UNION ALL
SELECT 'pedidos', COUNT(*) FROM dbo.pedidos;

-- 8. Campos y tipos de datos
SELECT TABLE_NAME AS tabla, ORDINAL_POSITION AS orden,
       COLUMN_NAME AS columna, DATA_TYPE AS tipo,
       CHARACTER_MAXIMUM_LENGTH AS longitud, IS_NULLABLE AS permite_nulo
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME IN ('clientes', 'platos', 'pedidos')
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- 9. Relaciones entre las tablas
SELECT fk.name AS relacion,
       OBJECT_NAME(fk.parent_object_id) AS tabla_hija,
       COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS columna_hija,
       OBJECT_NAME(fk.referenced_object_id) AS tabla_padre,
       COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS columna_padre
FROM sys.foreign_keys AS fk
JOIN sys.foreign_key_columns AS fkc
  ON fkc.constraint_object_id = fk.object_id
WHERE fk.parent_object_id = OBJECT_ID(N'dbo.pedidos')
ORDER BY fk.name;

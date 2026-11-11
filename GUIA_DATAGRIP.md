# Guía para ver la base de datos en DataGrip

Esta guía usa la base `red_pepper_db` del Trabajo 14. Todas las consultas están juntas en [`consultas/consultas_red_pepper.sql`](consultas/consultas_red_pepper.sql). Son **solo de lectura**: no crean, modifican ni borran datos.

## 1. Elegir la base correcta

En la consola de DataGrip, abre el selector de base de datos que aparece arriba a la derecha y elige `red_pepper_db`. Después ejecuta:

```sql
SELECT DB_NAME() AS base_actual;
```

El resultado debe ser `red_pepper_db`. Si muestra `master`, cambia el selector antes de continuar. DataGrip puede mostrar **Current database is not introspected** aunque las consultas funcionen; usa **Introspect database** si quieres ver las tablas también en Database Explorer.

Para ejecutar una consulta, coloca el cursor dentro de ella y presiona **Ctrl+Enter**, o selecciónala y pulsa el botón verde **Execute**. Si DataGrip pregunta qué ejecutar, elige la consulta o la selección deseada.

## 2. Ver las tres tablas

```sql
SELECT name AS tabla
FROM sys.tables
WHERE name IN (N'clientes', N'platos', N'pedidos')
ORDER BY name;
```

Debe mostrar `clientes`, `pedidos` y `platos`.

## 3. Ver todos los registros

Ejecuta cada consulta por separado:

```sql
SELECT * FROM dbo.clientes ORDER BY id_cliente;
```

```sql
SELECT * FROM dbo.platos ORDER BY id_plato;
```

```sql
SELECT * FROM dbo.pedidos ORDER BY id_pedido;
```

## 4. Ver cada pedido con el nombre del cliente y del plato

La tabla `pedidos` guarda identificadores. Esta consulta los relaciona con los nombres y calcula el total de cada pedido:

```sql
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
```

## 5. Comprobar la cantidad de datos

```sql
SELECT 'clientes' AS tabla, COUNT(*) AS total FROM dbo.clientes
UNION ALL
SELECT 'platos', COUNT(*) FROM dbo.platos
UNION ALL
SELECT 'pedidos', COUNT(*) FROM dbo.pedidos;
```

En la carga inicial deben aparecer **20 clientes, 30 platos y 20 pedidos**. Esos son los totales que se comprobaron en DataGrip tras la carga.

## 6. Ver campos y relaciones

Campos y tipos de datos:

```sql
SELECT TABLE_NAME AS tabla, ORDINAL_POSITION AS orden,
       COLUMN_NAME AS columna, DATA_TYPE AS tipo,
       CHARACTER_MAXIMUM_LENGTH AS longitud, IS_NULLABLE AS permite_nulo
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME IN ('clientes', 'platos', 'pedidos')
ORDER BY TABLE_NAME, ORDINAL_POSITION;
```

Claves foráneas:

```sql
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
```

## Archivos del proyecto

- [Informe y diagrama entidad-relación](documentacion/trabajo_14_red_pepper.pdf)
- [Excel con todos los datos](documentacion/red_pepper_datos_completos_con_nombres.xlsx)
- [Scripts de creación y carga](sql/)

## Referencias técnicas

- [Ejecutar consultas en DataGrip](https://www.jetbrains.com/help/datagrip/run-a-query.html)
- [Vista `INFORMATION_SCHEMA.COLUMNS` en SQL Server y Azure SQL](https://learn.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/columns-transact-sql)
- [Vista `sys.foreign_keys` en SQL Server y Azure SQL](https://learn.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-foreign-keys-transact-sql)

# Trabajo 14 - Red Pepper

Repositorio local del modelo básico de base de datos del local Red Pepper.

## Contenido

- `sql/01_crear_tablas.sql`: crea las tablas `clientes`, `platos` y `pedidos`, con claves primarias y foráneas.
- `sql/02_insertar_clientes.sql`: inserta 20 clientes ficticios.
- `sql/03_insertar_platos.sql`: inserta 30 platos de la carta.
- `sql/04_insertar_pedidos.sql`: inserta 20 pedidos ficticios.
- `documentacion/trabajo_14_red_pepper.pdf`: informe con diagrama entidad-relación.
- `documentacion/trabajo_14_red_pepper.tex`: fuente LaTeX editable del informe.
- `documentacion/red_pepper_datos_completos_con_nombres.xlsx`: los datos de las tres tablas, cada una en su hoja.
- `documentacion/red_pepper_30_platos.xlsx`: lista independiente de platos.

## Motor y ejecución

Los scripts usan **T-SQL para Azure SQL Database (motor SQL Server)**. Cree una base de datos vacía llamada `red_pepper_db` en Azure SQL Database y conéctese a ella desde el editor SQL. Ejecute los cuatro scripts **una vez y en orden numérico**. La base de datos se crea desde Azure; los scripts no usan `USE`, que no corresponde a este flujo de Azure SQL Database.

Para comprobar la carga:

```sql
SELECT COUNT(*) AS clientes FROM dbo.clientes; -- 20
SELECT COUNT(*) AS platos FROM dbo.platos;     -- 30
SELECT COUNT(*) AS pedidos FROM dbo.pedidos;   -- 20
```

Cada pedido referencia un cliente y un plato. Los clientes y pedidos son ejemplos simulados. Los platos y precios se tomaron de la [carta pública de Red Pepper](https://nexlabs.net.pe/Red-Pepper-menu/), consultada el 10/11/2026. Los sabores de empanadas y algunas opciones de hamburguesa se registraron por separado para completar 30 platos.

# Trabajo 14 - Red Pepper

Repositorio local del modelo básico de base de datos del local Red Pepper.

## Contenido

- `sql/01_crear_base.sql`: crea una base de datos nueva (nombre provisional: `red_pepper_db`).
- `sql/02_crear_tablas.sql`: crea las tablas `clientes`, `platos` y `pedidos`, con claves primarias y foráneas.
- `sql/03_insertar_clientes_y_platos.sql`: inserta 20 clientes ficticios y 30 platos de la carta.
- `sql/04_insertar_pedidos.sql`: inserta 20 pedidos ficticios.
- `documentacion/trabajo_14_red_pepper.pdf`: informe con diagrama entidad-relación.
- `documentacion/trabajo_14_red_pepper.tex`: fuente LaTeX editable del informe.
- `documentacion/red_pepper_datos_completos_con_nombres.xlsx`: los datos de las tres tablas, cada una en su hoja.
- `documentacion/red_pepper_30_platos.xlsx`: lista independiente de platos.
- [`GUIA_DATAGRIP.md`](GUIA_DATAGRIP.md): pasos y comandos para mostrar toda la base.
- [`consultas/consultas_red_pepper.sql`](consultas/consultas_red_pepper.sql): consultas de solo lectura listas para usar.

## Motor y ejecución

Los scripts usan **T-SQL para Azure SQL Database (motor SQL Server)**. El nombre `red_pepper_db` es provisional: puede cambiar las dos apariciones de ese nombre en `01_crear_base.sql` antes de ejecutarlo. Crear una base en Azure requiere permiso `CREATE DATABASE` y puede generar cargos según la configuración de su cuenta.

1. Conéctese a `master` y ejecute **solo** `01_crear_base.sql`.
2. Abra una **nueva conexión** a la base que acaba de crear. Compruebe con `SELECT DB_NAME() AS base_actual;` que ya no está en `master`.
3. En esa conexión, ejecute `02_crear_tablas.sql`, `03_insertar_clientes_y_platos.sql` y `04_insertar_pedidos.sql`, en ese orden.

En Azure SQL Database no se cambia a otra base con `USE`; hay que conectarse directamente a ella. Los scripts pueden repetirse: conservan las tablas y filas existentes e insertan solo las que faltan. Los pasos 2–4 se detienen con un mensaje claro si siguen conectados a `master`. En SSMS puede elegir la base nueva en el selector de la ventana de consulta. En el portal de Azure, abra la base nueva y luego su **Query editor**.

Para comprobar la carga:

```sql
SELECT COUNT(*) AS clientes FROM dbo.clientes; -- 20
SELECT COUNT(*) AS platos FROM dbo.platos;     -- 30
SELECT COUNT(*) AS pedidos FROM dbo.pedidos;   -- 20
```

Cada pedido referencia un cliente y un plato. Los clientes y pedidos son ejemplos simulados. Los platos y precios se tomaron de la [carta pública de Red Pepper](https://nexlabs.net.pe/Red-Pepper-menu/), consultada el 10/11/2026. Los sabores de empanadas y algunas opciones de hamburguesa se registraron por separado para completar 30 platos.

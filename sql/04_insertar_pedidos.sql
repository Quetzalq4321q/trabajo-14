-- Paso 4. Ejecutar conectado a la base nueva; 20 pedidos ficticios.
-- Se pueden ejecutar otra vez: solo insertan las filas que faltan.
SET XACT_ABORT ON;
IF DB_NAME() = N'master'
BEGIN
    ;THROW 50001, N'Conectese a la base nueva antes de ejecutar los datos.', 1;
END;
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 1)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (1, '2026-11-03', 1, 7, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 2)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (2, '2026-11-03', 2, 14, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 3)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (3, '2026-11-03', 3, 21, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 4)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (4, '2026-11-03', 4, 28, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 5)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (5, '2026-11-04', 5, 5, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 6)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (6, '2026-11-04', 6, 12, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 7)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (7, '2026-11-04', 7, 19, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 8)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (8, '2026-11-04', 8, 26, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 9)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (9, '2026-11-05', 9, 3, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 10)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (10, '2026-11-05', 10, 10, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 11)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (11, '2026-11-05', 11, 17, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 12)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (12, '2026-11-05', 12, 24, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 13)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (13, '2026-11-06', 13, 1, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 14)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (14, '2026-11-06', 14, 8, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 15)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (15, '2026-11-06', 15, 15, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 16)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (16, '2026-11-06', 16, 22, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 17)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (17, '2026-11-07', 17, 29, 3);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 18)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (18, '2026-11-07', 18, 6, 1);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 19)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (19, '2026-11-07', 19, 13, 2);
IF NOT EXISTS (SELECT 1 FROM dbo.pedidos WHERE id_pedido = 20)
INSERT INTO dbo.pedidos (id_pedido, fecha, id_cliente, id_plato, cantidad) VALUES (20, '2026-11-07', 20, 20, 3);
COMMIT TRANSACTION;

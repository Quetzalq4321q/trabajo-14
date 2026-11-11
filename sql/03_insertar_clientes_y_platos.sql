-- Paso 3. Ejecutar conectado a la base nueva.
-- Carga 20 clientes ficticios y 30 platos; omite los IDs ya existentes.
SET XACT_ABORT ON;
IF DB_NAME() = N'master'
BEGIN
    ;THROW 50001, N'Conectese a la base nueva antes de ejecutar los datos.', 1;
END;
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 1)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (1, N'Ana Torres');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 2)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (2, N'Luis Mendoza');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 3)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (3, N'Carla Rojas');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 4)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (4, N'Diego Flores');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 5)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (5, N'Sofía Vargas');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 6)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (6, N'Miguel Paredes');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 7)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (7, N'Valeria Castillo');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 8)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (8, N'José Salazar');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 9)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (9, N'Lucía Herrera');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 10)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (10, N'Andrés Medina');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 11)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (11, N'Daniela Quispe');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 12)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (12, N'Marco Gutiérrez');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 13)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (13, N'Camila Navarro');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 14)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (14, N'Ricardo Chávez');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 15)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (15, N'Gabriela León');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 16)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (16, N'Fernando Silva');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 17)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (17, N'Paula Romero');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 18)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (18, N'Renato Aguilar');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 19)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (19, N'Elena Campos');
IF NOT EXISTS (SELECT 1 FROM dbo.clientes WHERE id_cliente = 20)
INSERT INTO dbo.clientes (id_cliente, nombre) VALUES (20, N'Bruno Morales');
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 1)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (1, N'Triple Clásico', N'Sánguches', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 2)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (2, N'Triple Mixto', N'Sánguches', 5.50);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 3)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (3, N'Triple de Durazno', N'Sánguches', 6.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 4)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (4, N'Baguetino de Pollo a la Brasa', N'Sánguches', 7.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 5)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (5, N'Empanada de Ají de Gallina', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 6)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (6, N'Empanada de Rocoto Relleno', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 7)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (7, N'Empanada de Lomo Saltado', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 8)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (8, N'Empanada de Pizza', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 9)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (9, N'Empanada Hawaiana', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 10)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (10, N'Empanada de Queso', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 11)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (11, N'Empanada Triple', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 12)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (12, N'Empanada de Chorizo', N'Empanadas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 13)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (13, N'Salchicono', N'Salchipapas', 5.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 14)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (14, N'Cono Mix', N'Salchipapas', 6.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 15)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (15, N'Clásica', N'Salchipapas', 8.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 16)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (16, N'Double Black', N'Salchipapas', 9.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 17)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (17, N'Choripapas', N'Salchipapas', 10.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 18)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (18, N'Salchibrasa', N'Salchipapas', 10.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 19)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (19, N'Salchichaufa', N'Al plato', 12.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 20)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (20, N'Mostrito con Pechuga a la Plancha', N'Al plato', 16.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 21)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (21, N'Jack Pepper', N'Al plato', 14.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 22)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (22, N'Cheese Pepper', N'Al plato', 15.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 23)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (23, N'Extrema (Bandeja de siempre)', N'Compartir', 30.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 24)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (24, N'La Gaucha', N'Compartir', 25.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 25)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (25, N'Hamburguesa Clásica de res', N'Hamburguesas', 8.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 26)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (26, N'Hamburguesa Clásica de pollo', N'Hamburguesas', 8.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 27)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (27, N'Cheese Burguer de res', N'Hamburguesas', 9.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 28)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (28, N'Cheese Burguer de pollo', N'Hamburguesas', 9.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 29)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (29, N'La Royal', N'Hamburguesas', 10.00);
IF NOT EXISTS (SELECT 1 FROM dbo.platos WHERE id_plato = 30)
INSERT INTO dbo.platos (id_plato, nombre, categoria, precio) VALUES (30, N'Doble Burguer', N'Hamburguesas', 15.00);
COMMIT TRANSACTION;

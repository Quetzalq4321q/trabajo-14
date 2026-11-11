-- Paso 2. Ejecutar conectado a la base nueva (no a master).
-- Este script usa T-SQL de SQL Server. No requiere USE ni PRAGMA.
-- Puede ejecutarse otra vez: conserva las tablas y sus datos existentes.

IF DB_NAME() = N'master'
BEGIN
    ;THROW 50001, N'Conectese a la base nueva antes de ejecutar este script; esta conectado a master.', 1;
END;

IF OBJECT_ID(N'dbo.clientes', N'U') IS NULL
BEGIN
CREATE TABLE dbo.clientes (
    id_cliente INT NOT NULL CONSTRAINT PK_clientes PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);
END;

IF OBJECT_ID(N'dbo.platos', N'U') IS NULL
BEGIN
CREATE TABLE dbo.platos (
    id_plato INT NOT NULL CONSTRAINT PK_platos PRIMARY KEY,
    nombre NVARCHAR(120) NOT NULL,
    categoria NVARCHAR(40) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT CK_platos_precio CHECK (precio >= 0)
);
END;

IF OBJECT_ID(N'dbo.pedidos', N'U') IS NULL
BEGIN
CREATE TABLE dbo.pedidos (
    id_pedido INT NOT NULL CONSTRAINT PK_pedidos PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_plato INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT FK_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES dbo.clientes(id_cliente),
    CONSTRAINT FK_pedidos_platos FOREIGN KEY (id_plato) REFERENCES dbo.platos(id_plato),
    CONSTRAINT CK_pedidos_cantidad CHECK (cantidad > 0)
);
END;

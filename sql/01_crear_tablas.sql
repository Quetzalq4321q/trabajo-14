-- Trabajo 14: ejecutar en una base de datos Azure SQL Database vacía.
-- Nombre recomendado para la base de datos: red_pepper_db.
-- Este script usa T-SQL de SQL Server. No requiere USE ni PRAGMA.

CREATE TABLE dbo.clientes (
    id_cliente INT NOT NULL CONSTRAINT PK_clientes PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.platos (
    id_plato INT NOT NULL CONSTRAINT PK_platos PRIMARY KEY,
    nombre NVARCHAR(120) NOT NULL,
    categoria NVARCHAR(40) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT CK_platos_precio CHECK (precio >= 0)
);

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

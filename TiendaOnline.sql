-- Crear la base de datos
CREATE DATABASE TiendaOnline;

-- Seleccionar la base de datos
USE TiendaOnline;

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estatus TINYINT(1) NOT NULL DEFAULT 1  -- Agregar estatus como booleano
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estatus TINYINT(1) NOT NULL DEFAULT 1  -- Agregar estatus como booleano
);

-- Crear la tabla Pedidos
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    estatus TINYINT(1) NOT NULL DEFAULT 1,  -- Agregar estatus como booleano
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

-- Crear la tabla DetallePedido para asociar productos a los pedidos
CREATE TABLE DetallePedido (
    idDetalles INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    estatus TINYINT(1) NOT NULL DEFAULT 1,  -- Agregar estatus como booleano
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- Insertar registros en la tabla Usuarios
INSERT INTO Usuarios (nombre, email, contraseña, estatus) VALUES
('Juan Perez', 'juan.perez@example.com', 'password123', 1),
('Maria Garcia', 'maria.garcia@example.com', 'password456', 1),
('Carlos Lopez', 'carlos.lopez@example.com', 'password789', 0);

-- Insertar registros en la tabla Productos
INSERT INTO Productos (nombre, descripcion, precio, stock, estatus) VALUES
('Producto A', 'Descripción del Producto A', 10.00, 100, 1),
('Producto B', 'Descripción del Producto B', 20.00, 200, 1),
('Producto C', 'Descripción del Producto C', 30.00, 300, 0);

-- Insertar registros en la tabla Pedidos
INSERT INTO Pedidos (id_usuario, total, estatus) VALUES
(1, 50.00, 1),
(2, 100.00, 1),
(3, 150.00, 0);

-- Insertar registros en la tabla DetallePedido
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario, estatus) VALUES
(1, 1, 2, 10.00, 1),
(1, 2, 1, 20.00, 1),
(2, 3, 4, 30.00, 1),
(3, 2, 5, 20.00, 1),
(3, 1, 3, 10.00, 1);

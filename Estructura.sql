-- Active: 1749208756264@@127.0.0.1@3307@Examen
DROP DATABASE Examen; 
CREATE DATABASE Examen;

USE Examen;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100)
);

CREATE TABLE producto ( 
    id_producto INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100), 
    tipo ENUM('pizza', 'bebida') NOT NULL, 
    tamaño ENUM('pequena', 'mediana', 'grande', 'Extra grande') NULL, 
    precio DECIMAL(10,2) NOT NULL 
);

CREATE TABLE ingrediente ( 
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100), 
    precio_extra DECIMAL(10,2)
);

CREATE TABLE pizza_ingrediente ( 
    id_producto INT, 
    id_ingrediente INT, 
    PRIMARY KEY (id_producto, id_ingrediente), 
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto), 
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente) 
);

CREATE TABLE pedido ( 
    id_pedido INT AUTO_INCREMENT PRIMARY KEY, 
    cliente_id INT, 
    fecha_hora_pedido DATETIME DEFAULT CURRENT_TIMESTAMP, 
    fecha_hora_recogida DATETIME, 
    estado_pago BOOLEAN DEFAULT FALSE, 
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
); 

CREATE TABLE pedido_producto ( 
    id_pedido_producto INT AUTO_INCREMENT PRIMARY KEY, 
    id_pedido INT, 
    id_producto INT, 
    cantidad INT DEFAULT 1, 
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido), 
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) 
);

CREATE TABLE pedido_ingrediente_extra ( 
    id_pedido_producto INT, 
    id_ingrediente INT, 
    PRIMARY KEY (id_pedido_producto, id_ingrediente), 
    FOREIGN KEY (id_pedido_producto) REFERENCES pedido_producto(id_pedido_producto), 
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente) 
);

CREATE TABLE combo ( 
    id_combo INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100), 
    precio DECIMAL(10,2) 
);

CREATE TABLE combo_producto ( 
    id_combo INT, 
    id_producto INT, 
    PRIMARY KEY (id_combo, id_producto), 
    FOREIGN KEY (id_combo) REFERENCES combo(id_combo), 
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) 
);

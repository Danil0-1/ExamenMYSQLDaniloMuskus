

INSERT INTO clientes (nombre, telefono , direccion)
VALUES  ('Danilo Muskus',    '3003417554',   'Calle 61#22c-45'),
        ('Nicolas Muskus',   '3192733605',   'Calle 63#22c-45');

INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES  ('Pizza Campesina', 'pizza', 'mediana', 3500),
        ('Pizza Carne', 'pizza', 'grande', 5500),
        ('Pizza Hawayana 🤮', 'pizza', 'pequeña', 1),
        ('Danilos Pizza', 'pizza', 'Extra grande', 6900),
        ('Pizza Queso', 'pizza', 'mediana', 6500)
;

INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES ('Coca-Cola', 'bebida', 'mediana', 2000);

INSERT INTO ingrediente (nombre, precio_extra)
VALUES ('Chorizo', 1500);

INSERT INTO pedido (cliente_id, fecha_hora_recogida, estado_pago)
VALUES  (1, '2025/06/06 13:00:00', TRUE),
        (1, '2025/06/07 13:00:00', TRUE),
        (1, '2025/06/08 13:00:00', TRUE),
        (1, '2025/06/09 13:00:00', TRUE),
        (1, '2025/06/10 13:00:00', TRUE),
        (1, '2025/06/11 13:00:00', TRUE);

INSERT INTO pedido_producto (id_pedido , id_producto, cantidad)
VALUES  (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2);

INSERT INTO pedido_ingrediente_extra (id_pedido_producto, id_ingrediente)
VALUES (1,1);

SELECT
    p.id_pedido,
    pr.nombre AS producto,
    ing.nombre AS ingrediente_extra
FROM pedido AS p 
JOIN pedido_producto AS pp ON p.id_pedido = pp.id_pedido
JOIN producto AS pr ON pp.id_producto = pr.id_producto
LEFT JOIN pedido_ingrediente_extra AS pie ON pp.id_pedido_producto = pie.id_pedido_producto
LEFT JOIN ingrediente AS ing ON pie.id_ingrediente = ing.id_ingrediente
WHERE p.id_pedido = 1;

UPDATE producto
SET precio = 5000
WHERE id_producto = 1;

UPDATE clientes 
SET direccion = 'Calle 62#22c-45'
WHERE cliente_id = 1; 

DELETE FROM producto
WHERE id_producto = 2 AND tipo = 'Bebida';

DELETE FROM ingrediente
WHERE id_ingrediente = 2;

SELECT *
FROM pedido
WHERE cliente_id = 1;

SELECT *
FROM producto;

SELECT *
FROM ingrediente;

SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c 
JOIN pedido AS p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id
HAVING total_pedidos > 5;

SELECT *
FROM pedido
WHERE (fecha_hora_recogida) > '2025/06/07 13:00:00'

SELECT *
FROM producto
WHERE tipo = 'pizza' AND precio > 100


INSERT INTO clientes (nombre, telefono , direccion)
VALUES ('Danilo Muskus', '3003417554', 'Calle 61#22c-45');

INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES ('Pizza Campesina', 'pizza', 'mediana', 3500);

INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES ('Coca-Cola', 'bebida', 'mediana', 2000);

INSERT INTO ingrediente (nombre, precio_extra)
VALUES ('Chorizo', 1500);

INSERT INTO pedido (cliente_id, fecha_hora_recogida, estado_pago)
VALUES (1, '2025/06/06 13:41:00', TRUE);

INSERT INTO pedido_producto (id_pedido , id_producto, cantidad)
VALUES (1,1,2);

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


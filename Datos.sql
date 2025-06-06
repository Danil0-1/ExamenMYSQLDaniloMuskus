
-- 1. **Registrar un nuevo cliente:**
INSERT INTO clientes (nombre, telefono , direccion)
VALUES  ('Danilo Muskus',    '3003417554',   'Calle 61#22c-45'),
        ('Nicolas Muskus',   '3192733605',   'Calle 63#22c-45');

-- 2. **Agregar un nuevo producto (pizza) al menú:**
INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES  ('Pizza Campesina', 'pizza', 'mediana', 3500),
        ('Pizza Carne', 'pizza', 'grande', 5500),
        ('Pizza Hawayana 🤮', 'pizza', 'pequeña', 1),
        ('Danilos Pizza', 'pizza', 'Extra grande', 6900),
        ('Pizza Queso', 'pizza', 'mediana', 6500)
;
-- 3. **Registrar una bebida en el menú:**
INSERT INTO producto (nombre, tipo, tamaño, precio)
VALUES ('Coca-Cola', 'bebida', 'mediana', 2000);

-- 4. **Agregar un ingrediente a la base de datos:**
INSERT INTO ingrediente (nombre, precio_extra)
VALUES ('Chorizo', 1500);

-- 5. **Crear un pedido para un cliente:**
INSERT INTO pedido (cliente_id, fecha_hora_recogida, estado_pago)
VALUES  (1, '2025/06/06 13:00:00', TRUE),
        (1, '2025/06/07 13:00:00', TRUE),
        (1, '2025/06/08 13:00:00', TRUE),
        (1, '2025/06/09 13:00:00', TRUE),
        (1, '2025/06/10 13:00:00', TRUE),
        (1, '2025/06/11 13:00:00', TRUE);

-- 6. **Añadir productos a un pedido específico:**
INSERT INTO pedido_producto (id_pedido , id_producto, cantidad)
VALUES  (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2),
        (1,1,2);

-- 7. **Añadir ingredientes adicionales a una pizza en un pedido:**
INSERT INTO pedido_ingrediente_extra (id_pedido_producto, id_ingrediente)
VALUES (1,1);

-- 8. **Consultar el detalle de un pedido (productos y sus ingredientes):**
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

-- 9. **Actualizar el precio de una pizza en el menú:**
UPDATE producto
SET precio = 5000
WHERE id_producto = 1;

-- 10. **Actualizar la dirección de un cliente:**
UPDATE clientes 
SET direccion = 'Calle 62#22c-45'
WHERE cliente_id = 1; 

-- 11. **Eliminar un producto del menú (bebida):**
DELETE FROM producto
WHERE id_producto = 2 AND tipo = 'Bebida';

-- 12. **Eliminar un ingrediente de la base de datos:**
DELETE FROM ingrediente
WHERE id_ingrediente = 2;

-- 13. **Consultar todos los pedidos de un cliente:**
SELECT *
FROM pedido
WHERE cliente_id = 1;

-- 14. **Listar todos los productos disponibles en el menú (pizzas y bebidas):**
SELECT *
FROM producto;

-- 15. **Listar todos los ingredientes disponibles para personalizar una pizza:**
SELECT *
FROM ingrediente;

-- 17. **Listar los clientes que han hecho más de 5 pedidos:**

SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c 
JOIN pedido AS p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id
HAVING total_pedidos > 5;

-- 18. **Buscar pedidos programados para recogerse después de una hora específica:**
SELECT *
FROM pedido
WHERE (fecha_hora_recogida) > '2025/06/07 13:00:00'

-- 20. **Buscar pizzas con un precio mayor a $100:**
SELECT *
FROM producto
WHERE tipo = 'pizza' AND precio > 100
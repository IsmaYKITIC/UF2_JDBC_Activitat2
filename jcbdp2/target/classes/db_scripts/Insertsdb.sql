-- Insert data into Mesa
INSERT INTO Mesa (Capacidad, Disponibilidad) VALUES (4, TRUE);
INSERT INTO Mesa (Capacidad, Disponibilidad) VALUES (6, TRUE);
INSERT INTO Mesa (Capacidad, Disponibilidad) VALUES (2, FALSE);

-- Insert data into Cliente
INSERT INTO Cliente (Nombre, Telefono, Correo) VALUES ('Juan Perez', '555123456', 'juan.perez@example.com');
INSERT INTO Cliente (Nombre, Telefono, Correo) VALUES ('Maria Lopez', '555654321', 'maria.lopez@example.com');
INSERT INTO Cliente (Nombre, Telefono, Correo) VALUES ('Carlos Gomez', '555111222', 'carlos.gomez@example.com');

-- Insert data into Carta
INSERT INTO Carta (Nombre_Producto, Precio, Tipo_producto) VALUES ('Ensalada Cesar', 9.99, 'Entrada');
INSERT INTO Carta (Nombre_Producto, Precio, Tipo_producto) VALUES ('Pizza Margarita', 14.99, 'Principal');
INSERT INTO Carta (Nombre_Producto, Precio, Tipo_producto) VALUES ('Tiramisu', 6.50, 'Postre');

-- Insert data into Empleado
INSERT INTO Empleado (Nombre, Telefono, DNI, Rol, Turno, Id_mesa) VALUES ('Luis Martinez', '555333444', '12345678A', 'camarero', 'Mañana', 1);
INSERT INTO Empleado (Nombre, Telefono, DNI, Rol, Turno, Id_mesa) VALUES ('Ana Rodriguez', '555444555', '87654321B', 'cocinero', 'Tarde', NULL);

-- Insert data into Reserva
INSERT INTO Reserva (Id_mesa, Id_cliente, Fecha_hora) VALUES (1, 1, '2024-12-15 19:00:00');
INSERT INTO Reserva (Id_mesa, Id_cliente, Fecha_hora) VALUES (2, 2, '2024-12-15 20:00:00');

-- Insert data into Comanda
INSERT INTO Comanda (Id_mesa, Id_empleado, Id_cliente, Id_reserva, Preu_total) VALUES (1, 1, 1, 1, 25.49);
INSERT INTO Comanda (Id_mesa, Id_empleado, Id_cliente, Id_reserva, Preu_total) VALUES (2, 2, 2, 2, 30.99);
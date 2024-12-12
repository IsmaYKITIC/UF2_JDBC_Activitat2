-- Drop tables if they already exist to reset schema
DROP TABLE IF EXISTS Comanda;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Carta;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Mesa;

-- Entidad Mesa
CREATE TABLE Mesa (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Capacidad INT NOT NULL CHECK (Capacidad > 0),
    Disponibilidad BOOLEAN NOT NULL DEFAULT TRUE
);

-- Entidad Cliente
CREATE TABLE Cliente (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    UNIQUE (Telefono),
    UNIQUE (Correo)
);

-- Relacion Reserva
CREATE TABLE Reserva (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Id_mesa INT NOT NULL,
    Id_cliente INT NOT NULL,
    Fecha_hora DATETIME NOT NULL,
    UNIQUE (Id_mesa, Fecha_hora),
    FOREIGN KEY (Id_mesa) REFERENCES Mesa(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE
);

-- Entidad Carta
CREATE TABLE Carta (
    Nombre_Producto VARCHAR(100) PRIMARY KEY,
    Precio DECIMAL(10, 2) NOT NULL CHECK (Precio >= 0),
    Tipo_producto VARCHAR(50) NOT NULL
);

-- Entidad Empleado
CREATE TABLE Empleado (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Rol ENUM('camarero', 'cocinero') NOT NULL,
    Turno VARCHAR(50),
    Id_mesa INT,
    FOREIGN KEY (Id_mesa) REFERENCES Mesa(Id) ON DELETE SET NULL
);

-- Relacion Comanda
CREATE TABLE Comanda (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Id_mesa INT NOT NULL,
    Id_empleado INT NOT NULL,
    Id_cliente INT NOT NULL,
    Id_reserva INT,
    Preu_total DECIMAL(10, 2) NOT NULL CHECK (Preu_total >= 0),
    FOREIGN KEY (Id_mesa) REFERENCES Mesa(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_empleado) REFERENCES Empleado(Id) ON DELETE SET NULL,
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_reserva) REFERENCES Reserva(Id) ON DELETE SET NULL
);

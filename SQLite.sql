-- Crear tabla de productos
CREATE TABLE productos (
    producto_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Crear tabla de regiones
CREATE TABLE regiones (
    region_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    venta_id INTEGER PRIMARY KEY,
    fecha DATE NOT NULL,
    producto_id INTEGER,
    region_id INTEGER,
    monto DECIMAL NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos (producto_id),
    FOREIGN KEY (region_id) REFERENCES regiones (region_id)
);
-- Insertar datos en la tabla de productos
INSERT INTO productos (producto_id, nombre) VALUES
(1, 'Producto A'),
(2, 'Producto B'),
(3, 'Producto C');

-- Insertar datos en la tabla de regiones
INSERT INTO regiones (region_id, nombre) VALUES
(1, 'Región Norte'),
(2, 'Región Sur'),
(3, 'Región Este');

-- Insertar datos en la tabla de ventas
INSERT INTO ventas (venta_id, fecha, producto_id, region_id, monto) VALUES
(1, '2024-01-15', 1, 1, 150.00),
(2, '2024-01-17', 2, 2, 200.00),
(3, '2024-02-10', 1, 1, 250.00),
(4, '2024-02-20', 3, 3, 300.00),
(5, '2024-03-05', 2, 2, 180.00),
(6, '2024-03-15', 3, 1, 220.00);

SELECT
    r.nombre AS region,
    SUM(v.monto) AS ventas_totales
FROM
    ventas v
JOIN
    regiones r ON v.region_id = r.region_id
GROUP BY
    r.nombre
ORDER BY
    ventas_totales DESC;



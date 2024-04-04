CREATE TABLE usuario (
user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre VARCHAR(45) NOT NULL,
correo VARCHAR(45) NOT NULL, 
contrasena VARCHAR(45) NOT NULL,
saldo INT 
);

INSERT INTO usuario (nombre, correo, contrasena, saldo) VALUES
('Gabriela Miranda', 'gabriela@gmail.com', 'gabi1234', 50000),
('Ian Carrera', 'ian@gmail.com', 'ian1234', 150000),
('Katherine Astorga', 'katty@gmail.com', 'katty1234', 80000),
('Miguel Sepúlveda', 'miguel@gmail.com', 'miguel1234', 250000);

CREATE TABLE moneda (
currency_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
currency_name VARCHAR(45),
currency_symbol VARCHAR(10) NOT NULL 
);

INSERT INTO moneda (currency_name, currency_symbol) VALUES
('dolar', '$'),
('peso','$'),
('euro','€'),
('libra esterlina','£');

CREATE TABLE transaccion (
transaction_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
sender_user_id INT NOT NULL,
receiver_user_id INT NOT NULL, 
importe INT NOT NULL,  
transaction_date DATE NOT NULL,
transaction_currency INT NOT NULL,
FOREIGN KEY (sender_user_id) REFERENCES usuario (user_id),
FOREIGN KEY (receiver_user_id) REFERENCES usuario (user_id),
FOREIGN KEY (transaction_currency) REFERENCES moneda (currency_id)
);

INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, transaction_date, transaction_currency) VALUES
(1, 2, 30000, '2024-04-02', 1),
(4, 3, 130000, '2024-04-02', 3),
(3, 1, 20000, '2024-04-02', 2),
(2, 1, 20000, '2024-04-02', 4);

-- CONSULTAS

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico --
SELECT currency_name
FROM moneda 
INNER JOIN transaccion ON moneda.currency_id = transaccion.transaction_currency
where transaccion.sender_user_id = 3; 

-- Consulta para obtener todas las transacciones registradas -- 
SELECT*FROM transaccion; 

-- Consulta para obtener todas las transacciones realizadas por un usuario específico --
 SELECT*FROM transaccion where sender_user_id =3;

-- Sentencia DML para modificar el campo correo electrónico de un usuario espefícico -- 
UPDATE usuario SET correo = 'cambio@gmail.com' WHERE user_id =1; 

-- Sentencia para eliminar los datos de una transaccion (eliminando de la fila completa) -- 
DELETE FROM transaccion where transaction_id = 2; 

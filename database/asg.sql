DROP TABLE IF EXISTS comandaproducte CASCADE;
DROP TABLE IF EXISTS comanda CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

CREATE TABLE IF NOT EXISTS categoria
(
  id     SERIAL       NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comanda
(
  id            SERIAL         NOT NULL,
  importe_total NUMERIC(10, 2) ,
  data_creacion DATE           DEFAULT CURRENT_DATE,
  usuario_id    INT            NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comandaproducte
(
  cantidad    INT            NOT NULL,
  precio      NUMERIC(10, 2) NOT NULL,
  comanda_id  INT            NOT NULL,
  producto_id INT            NOT NULL,
  PRIMARY KEY (comanda_id, producto_id)
);

CREATE TABLE IF NOT EXISTS producto
(
  id             SERIAL         NOT NULL,
  categoria      INT            NOT NULL,
  nombre         VARCHAR(150)   NOT NULL,
  precio         NUMERIC(10, 2) NOT NULL,
  img            VARCHAR(100)   ,
  descripcion    TEXT           ,
  disponibilidad VARCHAR(20)    NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS usuario
(
  id         SERIAL       NOT NULL,
  nombre     VARCHAR(100) NOT NULL,
  email      VARCHAR(150) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  direccion  VARCHAR(255) ,
  poblacion  VARCHAR(100) ,
  cp         VARCHAR(10)  ,
  PRIMARY KEY (id)
);

ALTER TABLE producto DROP CONSTRAINT IF EXISTS FK_categoria_TO_producto;
ALTER TABLE producto
  ADD CONSTRAINT FK_categoria_TO_producto
    FOREIGN KEY (categoria)
    REFERENCES categoria (id);

ALTER TABLE comanda DROP CONSTRAINT IF EXISTS FK_usuario_TO_comanda;
ALTER TABLE comanda
  ADD CONSTRAINT FK_usuario_TO_comanda
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id);

ALTER TABLE comandaproducte DROP CONSTRAINT IF EXISTS FK_comanda_TO_comandaproducte;
ALTER TABLE comandaproducte
  ADD CONSTRAINT FK_comanda_TO_comandaproducte
    FOREIGN KEY (comanda_id)
    REFERENCES comanda (id);

ALTER TABLE comandaproducte DROP CONSTRAINT IF EXISTS FK_producto_TO_comandaproducte;
ALTER TABLE comandaproducte
  ADD CONSTRAINT FK_producto_TO_comandaproducte
    FOREIGN KEY (producto_id)
    REFERENCES producto (id);

-- ==========================================
-- DATOS INICIALES (categorias, productos, usuarios)
-- ==========================================

INSERT INTO categoria (id, nombre) VALUES
(1, 'Horno'),
(2, 'Lavadora'),
(3, 'Nevera'),
(4, 'Secadora');

SELECT setval('categoria_id_seq', (SELECT MAX(id) FROM categoria));

INSERT INTO producto (categoria, id, nombre, precio, img, descripcion, disponibilidad) VALUES
(1, 1000, 'Horno Teka HCB6375', 219.00, '1000.png', 'Horno de diseño moderno y elegante, ideal para preparar todo tipo de recetas. Su interior ofrece el espacio necesario para cocinar cómodamente para toda la familia.', 'Disponible'),
(1, 1001, 'Horno Balay 3CB4130X3', 453.00, '1001.png', 'Combina funcionalidad y diseño para facilitar la preparación de tus platos favoritos. Una opción práctica para quienes buscan comodidad y buenos resultados en la cocina.', 'Disponible'),
(1, 1002, 'Horno Bosch HBA514ES4', 371.00, '1002.png', 'Disfruta de una cocina versátil con este horno Bosch, pensado para preparar desde recetas sencillas hasta elaboraciones más especiales.', 'Disponible'),
(1, 1003, 'Horno Candy CA6 N5B3EYTX', 338.00, '1003.png', 'Renueva tu cocina con un horno moderno y funcional. Su diseño combina estilo y practicidad para acompañarte en tus preparaciones diarias.', 'Disponible'),
(1, 1004, 'Horno Edesa EOE8411PX', 274.00, '1004.png', 'Una solución práctica para cocinar en casa con comodidad. Su acabado elegante encaja fácilmente en diferentes estilos de cocina.', 'NoDisponible'),
(2, 2000, 'Lavadora Bosch WUU28T68ES', 414.00, '2000.png', 'Mantén tu ropa limpia y cuidada con esta lavadora Bosch. Una opción funcional para afrontar las coladas del día a día con comodidad.', 'Disponible'),
(2, 2001, 'Lavadora Balay 3TS273BA', 350.00, '2001.png', 'Diseñada para facilitar las tareas domésticas, esta lavadora combina un estilo sencillo con la practicidad que necesitas en cada lavado.', 'Disponible'),
(2, 2002, 'Lavadora Bosch WAL28PH0ES', 640.00, '2002.png', 'Una lavadora pensada para hogares que buscan comodidad y eficiencia en su rutina. Ideal para mantener tus prendas siempre a punto.', 'Disponible'),
(2, 2003, 'Lavadora Edesa EWF7202WH', 246.00, '2003.png', 'Solución práctica y accesible para el cuidado diario de tu ropa. Su diseño sencillo permite integrarla fácilmente en cualquier espacio de lavado.', 'Disponible'),
(2, 2004, 'Lavadora Indesit IMA752', 218.00, '2004.png', 'Simplifica tus coladas con esta lavadora Indesit. Una alternativa funcional para mantener tu ropa limpia sin complicaciones.', 'NoDisponible'),
(3, 3000, 'Nevera Haier HDPR3618DNPK', 482.00, '3000.png', 'Conserva tus alimentos organizados y siempre a mano con esta nevera Haier. Su diseño moderno aporta un toque elegante a tu cocina.', 'Disponible'),
(3, 3001, 'Nevera Balay 3KFE553WI', 518.00, '3001.png', 'Una nevera práctica y elegante, pensada para mantener tus alimentos bien organizados y aprovechar cómodamente el espacio de almacenamiento.', 'Disponible'),
(3, 3002, 'Nevera Whirlpool W9821COX2', 597.00, '3002.png', 'Combina capacidad y diseño para conservar tus alimentos de forma cómoda. Una buena elección para quienes buscan funcionalidad en su cocina.', 'Disponible'),
(3, 3003, 'Nevera Bosch KGN36VIDB', 660.00, '3003.png', 'Disfruta de una organización cómoda de tus alimentos con esta nevera Bosch. Su diseño moderno se adapta perfectamente a cualquier cocina.', 'Disponible'),
(3, 3004, 'Nevera Edesa EFC18220NFWH', 344.00, '3004.png', 'Una opción funcional para conservar y organizar tus alimentos. Su acabado blanco aporta sencillez y luminosidad al espacio.', 'NoDisponible'),
(4, 4000, 'Secadora Bosch WTR83200ES', 483.00, '4000.png', 'Seca tu ropa cómodamente y completa tu rutina de lavado con esta secadora Bosch. Una solución práctica para el cuidado de tus prendas.', 'Disponible'),
(4, 4001, 'Secadora Balay 3SB3091BR', 834.00, '4001.png', 'Cuida tus prendas después de cada lavado con esta secadora Balay. Su diseño combina elegancia y funcionalidad para el hogar.', 'Disponible'),
(4, 4002, 'Secadora Balay 3SB093XC', 667.00, '4002.png', 'Una alternativa cómoda para secar tu ropa durante todo el año. Ideal para facilitar las tareas domésticas y ahorrar tiempo en tu rutina.', 'Disponible'),
(4, 4003, 'Secadora Edesa ESP8150WH', 378.00, '4003.png', 'Haz más sencilla tu colada con esta secadora Edesa. Su diseño práctico permite disfrutar de una solución cómoda para el secado diario.', 'Disponible'),
(4, 4004, 'Secadora Siemens WQ45G2D0ES', 860.00, '4004.png', 'Una secadora de diseño cuidado que aporta comodidad a tu hogar. Perfecta para completar tu zona de lavado y mantener tus prendas listas para usar.', 'NoDisponible');

SELECT setval('producto_id_seq', (SELECT MAX(id) FROM producto));

INSERT INTO usuario (id, nombre, email, contrasena, direccion, poblacion, cp) VALUES
(1, 'Laura García', 'laura.garcia@gmail.com', 'Laura2026', 'Calle Mayor 12', 'Barcelona', '08001'),
(2, 'Carlos Martínez', 'carlos.martinez@hotmail.com', 'Carlos123', 'Avenida Cataluña 25', 'Mataró', '08301'),
(3, 'Ana López', 'ana.lopez@yahoo.es', 'AnaLopez25', 'Calle del Sol 8', 'Girona', '17001'),
(4, 'David Fernández', 'david.fernandez@gmail.com', 'David456', 'Plaza España 14', 'Tarragona', '43001'),
(5, 'Marta Sánchez', 'marta.sanchez@outlook.com', 'Marta2026', 'Calle Marina 32', 'Sabadell', '08201');

SELECT setval('usuario_id_seq', (SELECT MAX(id) FROM usuario));
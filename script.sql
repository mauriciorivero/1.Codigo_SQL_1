-- entra en el motor de bases de datos
mysql -u root -p;


-- entra en el motor de base de datos especificando la url
mysql -h localhost -u root -p;

-- crea una base de datos
CREATE DATABASE carniceria;

-- muestra todas las bases de datos
SHOW DATABASES

-- entrar en la base de datos que quieras
USE carniceria;

--Verificar que base de datos estas usando
SELECT DATABASE();


CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);


-- 
Tabla de telefono (entidad de segunda forma normal 1:n)
CREATE TABLE telefono (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_telefono VARCHAR(20) NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES cliente(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla de redes sociales (entidad independiente)
CREATE TABLE redes_sociales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_red_social VARCHAR(50) NOT NULL UNIQUE,
    url_red_social VARCHAR(100) NOT NULL
);

-- Tabla intermedia para la relación N:M entre usuario y redes_sociales
CREATE TABLE perfil_social (
    usuario_id INT NOT NULL,
    red_social_id INT NOT NULL,
    url_perfil VARCHAR(200) NOT NULL,
    PRIMARY KEY (usuario_id, red_social_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (red_social_id) REFERENCES redes_sociales(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO CLIENTE VALUES (null, 'CC', '3456765','Mauricio','Jose','Rivero','Padilla','1984-01-02');
INSERT INTO CLIENTE VALUES (null, 'TI', '87656','Abel','','Rivero','Herrera','2018-06-24');
INSERT INTO CLIENTE VALUES (null, 'TI', '8752673','Ada','Alicia','Rivero','Herrera','2024-03-19');
INSERT INTO CLIENTE VALUES (null, 'CC', '12345678','Mariana','','Cano','Lopez','2004-11-06');
INSERT INTO CLIENTE VALUES (null, 'CC', '9876543','Jose','Manuel','Castillo','Castro','1976-03-19');

INSERT INTO telefono VALUES (null, 'Fijo','645645',1);
INSERT INTO telefono VALUES (null, 'Movil','3005673245',1);
INSERT INTO telefono VALUES (null, 'Fax','8765434',1);
INSERT INTO telefono VALUES (null, 'fijo','876567',2);
INSERT INTO telefono VALUES (null, 'Movil','87654786',3);
INSERT INTO telefono VALUES (null, 'Movil','2345676543',4);
INSERT INTO telefono VALUES (null, 'Movil','8765434787',2);
INSERT INTO telefono VALUES (null, 'Fax','4598761098',4);


INSERT INTO redes_sociales VALUES (null, 'facebook','www.facebook.com');
INSERT INTO redes_sociales VALUES (null, 'twitter','www.twitter.com');
INSERT INTO redes_sociales VALUES (null, 'linkedin','www.linkedin.com');
INSERT INTO redes_sociales VALUES (null, 'tiktok','www.tiktok.com');
INSERT INTO redes_sociales VALUES (null, 'youtube','www.youtube.com');
INSERT INTO redes_sociales VALUES (null, 'instagram','www.instagram.com');

INSERT INTO perfil_social VALUES (1, 1, 'www.facebook.com/mauriciorivero');
INSERT INTO perfil_social VALUES (1, 2, 'www.twitter.com/mauriciorivero');
INSERT INTO perfil_social VALUES (1, 3, 'www.linkedin.com/mauriciorivero');
INSERT INTO perfil_social VALUES (2, 2, 'www.twiiter.com/abel');
INSERT INTO perfil_social VALUES (3, 1, 'www.facebook.com/ada');
INSERT INTO perfil_social VALUES (3, 5, 'www.youtube.com/ada');
CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);


-- Tabla de telefono (entidad de segunda forma normal 1:n)
CREATE TABLE telefono (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_telefono VARCHAR(20) NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
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
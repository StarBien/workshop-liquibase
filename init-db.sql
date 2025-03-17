-- Crear un esquema para nuestra aplicación
CREATE SCHEMA IF NOT EXISTS movies;

-- Crear la tabla de películas
CREATE TABLE IF NOT EXISTS movies.peliculas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    año_lanzamiento INTEGER NOT NULL,
    genero VARCHAR(100),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar algunos datos iniciales
INSERT INTO movies.peliculas (titulo, director, año_lanzamiento, genero) VALUES
('El Padrino', 'Francis Ford Coppola', 1972, 'Drama'),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crimen'),
('El Señor de los Anillos: La Comunidad del Anillo', 'Peter Jackson', 2001, 'Fantasía');

-- Crear un usuario para Liquibase con permisos adecuados
CREATE USER liquibase_user WITH PASSWORD 'liquibase_password';
GRANT ALL PRIVILEGES ON SCHEMA movies TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA movies TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA movies TO liquibase_user;

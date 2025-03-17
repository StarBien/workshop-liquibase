-- Añadir columna de duración en minutos a la tabla películas
ALTER TABLE movies.peliculas ADD COLUMN duracion_minutos INTEGER;

-- Actualizar los registros existentes con valores de ejemplo
UPDATE movies.peliculas SET duracion_minutos = 175 WHERE titulo = 'El Padrino';
UPDATE movies.peliculas SET duracion_minutos = 154 WHERE titulo = 'Pulp Fiction';
UPDATE movies.peliculas SET duracion_minutos = 178 WHERE titulo = 'El Señor de los Anillos: La Comunidad del Anillo';

-- Añadir restricción NOT NULL después de actualizar los datos existentes
ALTER TABLE movies.peliculas ALTER COLUMN duracion_minutos SET NOT NULL;

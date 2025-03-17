# Comandos

# 1. Verificar el estado actual - Muestra los cambios pendientes
./liquibase/liquibase status --verbose

# 2. Generar un SQL que muestra lo que se va a ejecutar (útil para revisión)
./liquibase/liquibase updateSQL > update_preview.sql

# 3. Ejecutar la migración
./liquibase/liquibase update

# 4. Ver el historial de cambios aplicados
./liquibase/liquibase history

# 5. Etiquetar la base de datos después de aplicar cambios
./liquibase/liquibase tag v1.1

# 6. Realizar un rollback a una etiqueta anterior
./liquibase/liquibase rollback v1.0

# 7. Realizar un rollback de un número específico de cambios
./liquibase/liquibase rollbackCount 1

# 8. Validar el changelog (útil para CI/CD)
./liquibase/liquibase validate

-- Consulta para verificar si la columna duracion_minutos existe y tiene datos
SELECT id, titulo, director, año_lanzamiento, genero, duracion_minutos
FROM movies.peliculas;

-- Consulta para verificar los metadatos de la columna
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'movies' AND table_name = 'peliculas' AND column_name = 'duracion_minutos';

-- Consulta para verificar el registro de la migración en la tabla de Liquibase
SELECT id, author, filename, dateexecuted, description
FROM databasechangelog
WHERE id = '01-add-duracion-column';

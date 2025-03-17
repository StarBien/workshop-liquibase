# Workshop Liquibase

Este repositorio es para practicar el uso de liquibase.

## Instalar liquibase

### Package manager
brew install liquibase

### Postgresql driver package
brew install libpq


### Descargar el driver de PostgreSQL
wget https://jdbc.postgresql.org/download/postgresql-42.5.1.jar -P lib/

### En Linux/Mac:
mkdir -p liquibase
cd liquibase
wget https://github.com/liquibase/liquibase/releases/download/v4.20.0/liquibase-4.20.0.zip
unzip liquibase-4.20.0.zip
chmod +x liquibase
cd ..

## Ejecutar base de datos local con docker-compose

docker compose up

## Agregando cambio

El archivo 01_add_duracion_column.sql contiene cambios a nivel de base de datos.

Para ejecutar estos cambios se necesita agregar lo siguiente al archivo changelog.xml

```xml
    <!-- Añadir columna de duración a tabla películas -->
    <changeSet id="01-add-duracion-column" author="workshop_user" failOnError="false">
        <sqlFile encoding="utf8" path="./migrations/01_add_duracion_column.sql"/>
        <rollback>
            ALTER TABLE movies.peliculas DROP COLUMN duracion_minutos;
        </rollback>
    </changeSet>
```

## Ejecutar migracion

liquibase update

## Ver historial

liquibase history

## Ver status

liquibase status --verbose


* Si la bd no crea el rol usar el siguiente comando:

docker exec -it liquibase-workshop-db psql -U workshop_user -d movies_db -c "
CREATE USER liquibase_user WITH PASSWORD 'liquibase_password';
GRANT USAGE ON SCHEMA movies TO liquibase_user;
GRANT USAGE ON SCHEMA public TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA movies TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA movies TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA movies GRANT ALL ON TABLES TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA movies GRANT ALL ON SEQUENCES TO liquibase_user;
"

## Acceder a la BD

docker exec -it liquibase-workshop-db psql -U workshop_user -d movies_db -c "SELECT * FROM movies.peliculas;"

docker exec -it liquibase-workshop-db psql -U liquibase_user -d movies_db -c "\conninfo"

docker exec -it liquibase-workshop-db psql -U liquibase_user -d movies_db -c "SELECT * FROM movies.peliculas;"

## Conexion con liquibase

liquibase status --url=jdbc:postgresql://localhost:5432/movies_db --username=workshop_user --password=workshop_password

liquibase status --url=jdbc:postgresql://localhost:5432/movies_db --username=liquibase_user --password=liquibase_password

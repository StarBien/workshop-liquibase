# Workshop Liquibase

Este repositorio es para practicar el uso de liquibase.

## Instalar liquibase

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

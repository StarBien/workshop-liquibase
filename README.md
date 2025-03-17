# Workshop Liquibase

Este repositorio es para practicar el uso de liquibase.

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

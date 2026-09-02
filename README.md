¿Cuántas filas devuelve cada consulta y por qué son distintas? Explicá con ejemplos concretos de los datos qué filas se eliminaron con UNION.
  
  Cada consultas devuelve un resultado diferente, los cuales son:  
    Antes de especificar cuantas registros recuperan cada consulta, se hace la aclaración, que esto es posible siempre que se cumplan las siguientes condiciones:
      - Las tablas deben de tener la misma cantidad de columnas, con los mismos tipos de datos.
    Una vez sabiendo las condiciones podemos especificar cuantos registros devuelve cada consulta:
    - Consulta con UNION, devuelve 14 filas, debido a que la misma combina todas las columnas de las tablas, no es posible eliminar repetidos debido a que la combinación de columnas previene que 2 registros posean todos los campos iguales
      - Ejemplo: Si se listasen únicamente los nombres de los producto, como [Monitor 4K 27"], el mismo se presenta en ambas tablas, en dicho caso la consulta devuelve un solo registro, debido a que es repetido. Dado que se consideran las 3 columnas la columnas devuelven [103; Monitor 4K 27"; Computación; 3] y [103; Monitor 4K 27"; Computación; 5] esa diferencia en la cantidad de stock evita que sean repetidos
    - Consulta con UNION ALL, devuelve 14 filas, debido a que la combinación de tablas se hace de manera total ignorando cualquier similitud o diferencia en los datos de las columnas entre tablas.
      
¿Por qué UNION ALL es más eficiente que UNION? ¿Qué operación adicional realiza UNION internamente que consume más recursos?
  La consulta UNION ALL es más eficiente que UNION, debido a que realiza la unión de las tablas sin filtrar ni eliminar los elementos repetidos, en cambio UNION consume más recursos al eliminar los elementos repetidos
  
¿En qué casos de negocio usarías cada uno? Dá al menos dos ejemplos reales distintos a los del ejercicio.
  Las situaciones en las que utilizaría cada tipo de consulta serían:
  - Consultas con UNION: Serían usadas para recuperar listados sin registros repetidos
    - Ejemplo 1: Conocer el listado de clientes total que poseen una operación en el último mes, sin importar la región o ubicación.
    - Ejemplo 2: Conocer el listado de empleados disponibles sin carpeta médica

  - Consultas con UNION ALL
    - Ejemplo 1: Recuperar el listado de todas las flotas de vehículos disponibles en la empresa a nivel nacional.
    - Ejemplo 2: Recuperar el listado de todas las operaciones efectuadas por los clientes con la empresa.

¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo? ¿Qué error genera SQL?
  Dado el caso que en cualquiera de las consultas el número de columnas no coincida en número o tipo, el error que genera en SQL es que no existe coincidencia entre las columnas de una tabla y la otra, ya fuera en cantidad o tipo

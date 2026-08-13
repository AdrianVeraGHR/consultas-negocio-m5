¿Por qué es mala práctica usar SELECT * en producción? 
  Es mala práctica utilizar SELECT * en producción, debido a:
  - No presenta el mejor rendimiento dado que consume un gran volumen de recursos y tiempo para ejecutar la consulta y recuperar los registros,
  la cual puede fallar en caso de que sucediera algún error.
  - No es segura, en el caso de que se realizase una consulta a una extensa base de datos, el tiempo que lleva recuperar los registros incrementa la exposición a misma
  favoreciendo vulnerabilidades de acceso por medio del puente de comunicación entre el equipo que consulta y la misma base de datos.

¿Por qué son importantes los alias para un stakeholder no técnico? 
  Los alias son importantes para un stakeholder no técnico dado que le permitirá comprender a que hace referencia el contenido del registro y del encabezado. Por ejemplo:
  - Una tabla contable que presenta la situación financiera de los clientes, en la misma podríamos encontrar una columna que posea el saldo a favor del cliente, los créditos de sus operaciones, y las
  deudas a nuestro favor, si el nombre de las columnas fuera monto_favor, monto y monto_debe el stakeholder puede confundir un monto_favor como el saldo a favor del cliente, o saldo a favor nuestro.

## Principio de mínimo privilegio

El proyecto implementa el principio de mínimo privilegio, según el cual
cada usuario recibe únicamente los permisos necesarios para realizar las
funciones correspondientes a su perfil.

El usuario asociado al rol `rol_vendedor` puede consultar y registrar
información relacionada con clientes y reservas, además de consultar
alojamientos y habitaciones. No dispone de permisos para eliminar
clientes o reservas ni para administrar elementos de seguridad del
servidor.

El usuario asociado al rol `rol_analista` dispone únicamente de permisos
de consulta sobre la información necesaria para realizar análisis y
reportes. Se le niegan explícitamente los permisos INSERT, UPDATE y DELETE
sobre el esquema JCAA.

No se asigna `db_owner` al vendedor ni al analista porque dicho rol
proporciona privilegios administrativos excesivos para las funciones que
desempeñan. Otorgarlo violaría el principio de mínimo privilegio y
aumentaría el riesgo de modificaciones o eliminaciones accidentales o no
autorizadas.

El usuario `turismo_admin` sí posee privilegios administrativos sobre
TURISMOPERU_JCAA debido a que su función consiste en administrar la base
de datos y realizar tareas relacionadas con respaldo y recuperación.
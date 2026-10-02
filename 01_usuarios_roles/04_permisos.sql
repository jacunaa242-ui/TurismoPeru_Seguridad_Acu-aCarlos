USE TURISMOPERU_JCAA;
GO


/* ============================================================
   1. PERMISOS DEL ROL VENDEDOR
   ============================================================ */

-- Puede consultar clientes
GRANT SELECT
ON OBJECT::JCAA.cliente
TO rol_vendedor;
GO

-- Puede registrar clientes
GRANT INSERT
ON OBJECT::JCAA.cliente
TO rol_vendedor;
GO

-- Puede consultar reservas
GRANT SELECT
ON OBJECT::JCAA.reserva
TO rol_vendedor;
GO

-- Puede registrar reservas
GRANT INSERT
ON OBJECT::JCAA.reserva
TO rol_vendedor;
GO

-- Puede consultar alojamientos
GRANT SELECT
ON OBJECT::JCAA.alojamiento
TO rol_vendedor;
GO

-- Puede consultar habitaciones
GRANT SELECT
ON OBJECT::JCAA.habitacion
TO rol_vendedor;
GO


/* ============================================================
   RESTRICCIONES DEL ROL VENDEDOR
   ============================================================ */

-- No puede eliminar clientes
DENY DELETE
ON OBJECT::JCAA.cliente
TO rol_vendedor;
GO

-- No puede eliminar reservas
DENY DELETE
ON OBJECT::JCAA.reserva
TO rol_vendedor;
GO


/* ============================================================
   2. PERMISOS DEL ROL ANALISTA
   ============================================================ */

GRANT SELECT
ON OBJECT::JCAA.cliente
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.reserva
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.pago
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.alojamiento
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.habitacion
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.paquete
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.lugar_turistico
TO rol_analista;
GO


/* ============================================================
   RESTRICCIONES DEL ROL ANALISTA

   El analista no puede insertar, actualizar ni eliminar
   información dentro del esquema JCAA.
   ============================================================ */
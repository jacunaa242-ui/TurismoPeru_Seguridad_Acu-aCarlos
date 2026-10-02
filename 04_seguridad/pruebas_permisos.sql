/* ============================================================
   PROYECTO: TURISMOPERU - SEGURIDAD
   ARCHIVO: pruebas_permisos.sql
   ============================================================ */

USE TURISMOPERU_JCAA;
GO


/* ============================================================
   1. PRUEBAS DEL ANALISTA
   ============================================================ */

PRINT '=============================================';
PRINT 'PRUEBAS DEL USUARIO turismo_analista';
PRINT '=============================================';
GO


EXECUTE AS USER = 'turismo_analista';
GO


/* Verificar usuario actual */

SELECT
    USER_NAME() AS UsuarioActual,
    ORIGINAL_LOGIN() AS LoginOriginal;
GO


/* ============================================================
   1.1 VERIFICAR PERMISOS DEL ANALISTA
   ============================================================ */

SELECT
    HAS_PERMS_BY_NAME(
        'JCAA.cliente',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Cliente,

    HAS_PERMS_BY_NAME(
        'JCAA.reserva',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Reserva,

    HAS_PERMS_BY_NAME(
        'JCAA.pago',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Pago,

    HAS_PERMS_BY_NAME(
        'JCAA.pago',
        'OBJECT',
        'INSERT'
    ) AS Puede_Insert_Pago,

    HAS_PERMS_BY_NAME(
        'JCAA.pago',
        'OBJECT',
        'UPDATE'
    ) AS Puede_Update_Pago,

    HAS_PERMS_BY_NAME(
        'JCAA.pago',
        'OBJECT',
        'DELETE'
    ) AS Puede_Delete_Pago;
GO


/* ============================================================
   1.2 CONSULTAS QUE EL ANALISTA SÍ PUEDE REALIZAR
   ============================================================ */

SELECT TOP 5 *
FROM JCAA.cliente;
GO

SELECT TOP 5 *
FROM JCAA.reserva;
GO

SELECT TOP 5 *
FROM JCAA.pago;
GO

SELECT TOP 5 *
FROM JCAA.alojamiento;
GO

SELECT TOP 5 *
FROM JCAA.habitacion;
GO

SELECT TOP 5 *
FROM JCAA.paquete;
GO

SELECT TOP 5 *
FROM JCAA.lugar_turistico;
GO


/* ============================================================
   1.3 PRUEBA DE OPERACIÓN PROHIBIDA
   ============================================================ */

/*
   Este UPDATE no modifica datos porque WHERE 1 = 0,
   pero SQL Server igualmente debe validar el permiso UPDATE.
   El resultado correcto es que la operación sea rechazada.
*/

UPDATE JCAA.pago
SET monto = monto
WHERE 1 = 0;
GO


/* Regresar al usuario original */

REVERT;
GO


/* ============================================================
   2. PRUEBAS DEL VENDEDOR
   ============================================================ */

PRINT '=============================================';
PRINT 'PRUEBAS DEL USUARIO turismo_vendedor';
PRINT '=============================================';
GO


EXECUTE AS USER = 'turismo_vendedor';
GO


/* Verificar usuario actual */

SELECT
    USER_NAME() AS UsuarioActual,
    ORIGINAL_LOGIN() AS LoginOriginal;
GO


/* ============================================================
   2.1 VERIFICAR PERMISOS DEL VENDEDOR
   ============================================================ */

SELECT
    HAS_PERMS_BY_NAME(
        'JCAA.cliente',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Cliente,

    HAS_PERMS_BY_NAME(
        'JCAA.cliente',
        'OBJECT',
        'INSERT'
    ) AS Puede_Insert_Cliente,

    HAS_PERMS_BY_NAME(
        'JCAA.reserva',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Reserva,

    HAS_PERMS_BY_NAME(
        'JCAA.reserva',
        'OBJECT',
        'INSERT'
    ) AS Puede_Insert_Reserva,

    HAS_PERMS_BY_NAME(
        'JCAA.reserva',
        'OBJECT',
        'DELETE'
    ) AS Puede_Delete_Reserva,

    HAS_PERMS_BY_NAME(
        'JCAA.alojamiento',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Alojamiento,

    HAS_PERMS_BY_NAME(
        'JCAA.habitacion',
        'OBJECT',
        'SELECT'
    ) AS Puede_Select_Habitacion;
GO


/* ============================================================
   2.2 CONSULTAS QUE EL VENDEDOR SÍ PUEDE REALIZAR
   ============================================================ */

SELECT TOP 5 *
FROM JCAA.cliente;
GO

SELECT TOP 5 *
FROM JCAA.reserva;
GO

SELECT TOP 5 *
FROM JCAA.alojamiento;
GO

SELECT TOP 5 *
FROM JCAA.habitacion;
GO


/* ============================================================
   2.3 PRUEBA DE OPERACIÓN PROHIBIDA
   ============================================================ */

/*
   Este DELETE no elimina datos porque WHERE 1 = 0.
   SQL Server igualmente debe comprobar el permiso DELETE.
   El resultado correcto es que sea rechazado.
*/

DELETE FROM JCAA.reserva
WHERE 1 = 0;
GO


/* Regresar al usuario original */

REVERT;
GO


/* ============================================================
   3. VERIFICACIÓN FINAL
   ============================================================ */

SELECT
    USER_NAME() AS UsuarioFinal,
    ORIGINAL_LOGIN() AS LoginOriginal;
GO
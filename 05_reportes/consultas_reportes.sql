/* ============================================================
   PROYECTO: TURISMOPERU
   ARCHIVO: consultas_reportes.sql
   ============================================================ */

USE TURISMOPERU_JCAA;
GO


/* ============================================================
   1. VISTA DE CLIENTES
   ============================================================ */

CREATE OR ALTER VIEW JCAA.vw_clientes_powerbi
AS

SELECT
    c.id_persona AS id_cliente,

    p.numero_documento,

    p.nombres,

    p.apaterno,

    p.amaterno,

    CONCAT(
        p.nombres,
        ' ',
        p.apaterno,
        ' ',
        ISNULL(p.amaterno, '')
    ) AS nombre_cliente,

    c.fecha_nacimiento,

    p.estado AS estado_cliente

FROM JCAA.cliente AS c

INNER JOIN JCAA.persona AS p
    ON c.id_persona = p.id_persona;
GO


/* ============================================================
   2. VISTA DE RESERVAS
   ============================================================ */

CREATE OR ALTER VIEW JCAA.vw_reservas_powerbi
AS

SELECT
    r.id_reserva,

    r.codigo_reserva,

    r.id_cliente,

    r.id_paquete,

    r.id_empleado,

    r.id_alojamiento,

    r.id_habitacion,

    r.fecha_reserva,

    CAST(r.fecha_reserva AS DATE) AS fecha_reserva_dia,

    r.fecha_inicio,

    r.fecha_fin,

    r.numero_personas,

    r.precio_total,

    r.adelanto,

    r.saldo_pendiente,

    r.id_estado_reserva,

    er.nombre AS estado_reserva

FROM JCAA.reserva AS r

INNER JOIN JCAA.estado_reserva AS er
    ON r.id_estado_reserva = er.id_estado_reserva;
GO


/* ============================================================
   3. VISTA DE PAGOS
   ============================================================ */

CREATE OR ALTER VIEW JCAA.vw_pagos_powerbi
AS

SELECT
    p.id_pago,

    p.id_reserva,

    p.id_medio_pago,

    mp.nombre AS medio_pago,

    mp.tipo AS tipo_medio_pago,

    p.monto,

    p.fecha_pago,

    p.numero_operacion,

    p.comprobante,

    p.estado AS estado_pago

FROM JCAA.pago AS p

INNER JOIN JCAA.medio_pago AS mp
    ON p.id_medio_pago = mp.id_medio_pago;
GO


/* ============================================================
   4. PERMISOS PARA EL ANALISTA
   ============================================================ */

GRANT SELECT
ON OBJECT::JCAA.vw_clientes_powerbi
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.vw_reservas_powerbi
TO rol_analista;
GO

GRANT SELECT
ON OBJECT::JCAA.vw_pagos_powerbi
TO rol_analista;
GO


PRINT 'Vistas para Power BI creadas correctamente.';
GO
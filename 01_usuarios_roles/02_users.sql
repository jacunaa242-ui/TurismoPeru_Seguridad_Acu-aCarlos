USE TURISMOPERU_JCAA;
GO

/* ============================================
   USUARIO ADMINISTRADOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'turismo_admin'
)
BEGIN
    CREATE USER turismo_admin
    FOR LOGIN turismo_admin;

    PRINT 'Usuario turismo_admin creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El usuario turismo_admin ya existe.';
END
GO


/* ============================================
   USUARIO VENDEDOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'turismo_vendedor'
)
BEGIN
    CREATE USER turismo_vendedor
    FOR LOGIN turismo_vendedor;

    PRINT 'Usuario turismo_vendedor creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El usuario turismo_vendedor ya existe.';
END
GO


/* ============================================
   USUARIO ANALISTA
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'turismo_analista'
)
BEGIN
    CREATE USER turismo_analista
    FOR LOGIN turismo_analista;

    PRINT 'Usuario turismo_analista creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El usuario turismo_analista ya existe.';
END
GO

USE master;
GO

/* ============================================
   LOGIN ADMINISTRADOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.server_principals
    WHERE name = 'turismo_admin'
)
BEGIN
    BEGIN TRY
        CREATE LOGIN turismo_admin
        WITH PASSWORD = '<CONTRASENA_SEGURA>';

        PRINT 'Login turismo_admin creado correctamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al crear turismo_admin:';
        PRINT ERROR_MESSAGE();
    END CATCH
END
ELSE
BEGIN
    PRINT 'El login turismo_admin ya existe.';
END
GO


/* ============================================
   LOGIN VENDEDOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.server_principals
    WHERE name = 'turismo_vendedor'
)
BEGIN
    BEGIN TRY
        CREATE LOGIN turismo_vendedor
        WITH PASSWORD = '<CONTRASENA_SEGURA>';

        PRINT 'Login turismo_vendedor creado correctamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al crear turismo_vendedor:';
        PRINT ERROR_MESSAGE();
    END CATCH
END
ELSE
BEGIN
    PRINT 'El login turismo_vendedor ya existe.';
END
GO


/* ============================================
   LOGIN ANALISTA
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.server_principals
    WHERE name = 'turismo_analista'
)
BEGIN
    BEGIN TRY
        CREATE LOGIN turismo_analista
        WITH PASSWORD = '<CONTRASENA_SEGURA>';

        PRINT 'Login turismo_analista creado correctamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al crear turismo_analista:';
        PRINT ERROR_MESSAGE();
    END CATCH
END
ELSE
BEGIN
    PRINT 'El login turismo_analista ya existe.';
END
GO

USE TURISMOPERU_JCAA;
GO

/* ============================================
   CREAR ROL VENDEDOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'rol_vendedor'
      AND type = 'R'
)
BEGIN
    CREATE ROLE rol_vendedor;
    PRINT 'Rol rol_vendedor creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El rol rol_vendedor ya existe.';
END
GO


/* ============================================
   CREAR ROL ANALISTA
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'rol_analista'
      AND type = 'R'
)
BEGIN
    CREATE ROLE rol_analista;
    PRINT 'Rol rol_analista creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El rol rol_analista ya existe.';
END
GO


/* ============================================
   ASIGNAR USUARIO VENDEDOR AL ROL VENDEDOR
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_role_members drm
    INNER JOIN sys.database_principals r
        ON drm.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals u
        ON drm.member_principal_id = u.principal_id
    WHERE r.name = 'rol_vendedor'
      AND u.name = 'turismo_vendedor'
)
BEGIN
    ALTER ROLE rol_vendedor
    ADD MEMBER turismo_vendedor;

    PRINT 'turismo_vendedor agregado a rol_vendedor.';
END
ELSE
BEGIN
    PRINT 'turismo_vendedor ya pertenece a rol_vendedor.';
END
GO


/* ============================================
   ASIGNAR USUARIO ANALISTA AL ROL ANALISTA
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_role_members drm
    INNER JOIN sys.database_principals r
        ON drm.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals u
        ON drm.member_principal_id = u.principal_id
    WHERE r.name = 'rol_analista'
      AND u.name = 'turismo_analista'
)
BEGIN
    ALTER ROLE rol_analista
    ADD MEMBER turismo_analista;

    PRINT 'turismo_analista agregado a rol_analista.';
END
ELSE
BEGIN
    PRINT 'turismo_analista ya pertenece a rol_analista.';
END
GO


/* ============================================
   ADMINISTRADOR DE LA BASE DE DATOS
   ============================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_role_members drm
    INNER JOIN sys.database_principals r
        ON drm.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals u
        ON drm.member_principal_id = u.principal_id
    WHERE r.name = 'db_owner'
      AND u.name = 'turismo_admin'
)
BEGIN
    ALTER ROLE db_owner
    ADD MEMBER turismo_admin;

    PRINT 'turismo_admin agregado a db_owner.';
END
ELSE
BEGIN
    PRINT 'turismo_admin ya pertenece a db_owner.';
END

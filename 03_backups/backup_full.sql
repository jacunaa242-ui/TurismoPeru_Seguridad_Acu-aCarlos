/* ============================================================
   PROYECTO: TURISMOPERU - SEGURIDAD
   ARCHIVO: backup_full.sql
   ============================================================ */

USE master;
GO

DECLARE @RutaBackup NVARCHAR(4000);
DECLARE @ArchivoBackup NVARCHAR(4000);

SET @RutaBackup =
    CAST(
        SERVERPROPERTY('InstanceDefaultBackupPath')
        AS NVARCHAR(4000)
    );

SET @ArchivoBackup =
    @RutaBackup + 'TURISMOPERU_JCAA_Full.bak';

PRINT 'Ruta del backup:';
PRINT @ArchivoBackup;

BACKUP DATABASE TURISMOPERU_JCAA
TO DISK = @ArchivoBackup
WITH
    INIT,
    FORMAT,
    NAME = 'Backup FULL - TURISMOPERU_JCAA',
    DESCRIPTION = 'Backup completo de la base de datos TURISMOPERU_JCAA',
    STATS = 10;
GO
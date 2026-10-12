CREATE OR ALTER PROCEDURE SGH.sp_TransferirMedico
    @cc            VARCHAR(20),
    @novoDep       INT,
    @novoHospital  VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE SGH.Medico
        SET Departamento_N = @novoDep,
            Hospital_Nome  = @novoHospital
        WHERE CC = @cc;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
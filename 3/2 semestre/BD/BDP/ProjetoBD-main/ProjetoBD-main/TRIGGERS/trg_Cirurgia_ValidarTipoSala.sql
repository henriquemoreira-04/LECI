CREATE OR ALTER TRIGGER SGH.trg_Cirurgia_ValidarTipoSala
ON SGH.Cirurgia
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SGH.Sala s ON s.N_Sala = i.N_Sala_Operacao
        JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
        WHERE t.Designacao LIKE '%Gabinete%'
    )
    BEGIN
        RAISERROR('Uma cirurgia não pode ser agendada num gabinete.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
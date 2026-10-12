CREATE OR ALTER TRIGGER SGH.trg_Avaliacao_ValidarTipoSala
ON SGH.Avaliacao
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SGH.Sala s ON s.N_Sala = i.N_Sala_Gabinete
        JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
        WHERE t.Designacao LIKE '%Bloco%' OR t.Designacao LIKE '%Operat%'
    )
    BEGIN
        RAISERROR('Uma avaliação não pode ser agendada numa sala de bloco operatório.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
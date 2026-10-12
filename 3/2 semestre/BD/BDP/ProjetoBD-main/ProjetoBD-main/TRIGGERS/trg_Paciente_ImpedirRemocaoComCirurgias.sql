CREATE OR ALTER TRIGGER SGH.trg_Paciente_ImpedirRemocaoComCirurgias
ON SGH.Paciente
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 FROM SGH.Cirurgia c
        JOIN deleted d ON d.CC = c.CC_Paciente
    )
    BEGIN
        RAISERROR('Não é possível remover um paciente com cirurgias registadas. Remova as cirurgias primeiro.', 16, 1);
        RETURN;
    END;
    -- Se não tiver cirurgias, permite a remoção
    DELETE FROM SGH.Avaliacao  WHERE CC_Paciente IN (SELECT CC FROM deleted);
    DELETE FROM SGH.Paciente   WHERE CC           IN (SELECT CC FROM deleted);
END;
GO
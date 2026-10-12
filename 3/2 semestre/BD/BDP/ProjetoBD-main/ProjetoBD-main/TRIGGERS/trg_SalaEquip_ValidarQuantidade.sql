CREATE OR ALTER TRIGGER SGH.trg_SalaEquip_ValidarQuantidade
ON SGH.Sala_Equipamento
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM inserted WHERE Quantidade <= 0)
    BEGIN
        RAISERROR('A quantidade de equipamento deve ser maior que zero.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
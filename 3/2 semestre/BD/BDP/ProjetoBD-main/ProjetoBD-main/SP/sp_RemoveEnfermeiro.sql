-- remove todas as associações do enfermeiro e depois o próprio registo
CREATE OR ALTER PROCEDURE SGH.sp_RemoverEnfermeiro
    @cc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Remove associações a cirurgias
    DELETE FROM SGH.Enfermeiro_Cirurgia
    WHERE CC_Enfermeiro = @cc;

    -- 2. Remove o enfermeiro
    DELETE FROM SGH.Enfermeiro
    WHERE CC = @cc;
END;
GO
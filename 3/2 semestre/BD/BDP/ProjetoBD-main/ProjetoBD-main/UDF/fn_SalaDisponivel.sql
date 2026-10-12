CREATE OR ALTER FUNCTION SGH.fn_SalaDisponivel
    (@nSala INT, @data DATE)
RETURNS BIT
AS
BEGIN
    DECLARE @ocupada INT;
    SELECT @ocupada = COUNT(*) FROM (
        SELECT N_Sala_Gabinete AS Sala, Data FROM SGH.Avaliacao
        UNION ALL
        SELECT N_Sala_Operacao, Data FROM SGH.Cirurgia
    ) AS eventos
    WHERE Sala = @nSala AND Data = @data;
 
    RETURN CASE WHEN @ocupada = 0 THEN 1 ELSE 0 END;
END;
GO
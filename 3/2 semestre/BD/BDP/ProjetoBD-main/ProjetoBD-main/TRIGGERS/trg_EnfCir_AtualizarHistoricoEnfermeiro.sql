CREATE OR ALTER TRIGGER SGH.trg_EnfCir_AtualizarHistoricoEnfermeiro
ON SGH.Enfermeiro_Cirurgia
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE SGH.Enfermeiro
    SET Historico_Consultas =
        CASE
            WHEN Historico_Consultas IS NULL OR LTRIM(RTRIM(CAST(Historico_Consultas AS VARCHAR(MAX)))) = ''
            THEN agg.Novas
            ELSE CAST(Historico_Consultas AS VARCHAR(MAX)) + '; ' + agg.Novas
        END
    FROM SGH.Enfermeiro e
    JOIN (
        SELECT CC_Enfermeiro,
               STRING_AGG('Cir. ' + CAST(N_Cirurgia AS VARCHAR(10)), '; ') AS Novas
        FROM inserted
        GROUP BY CC_Enfermeiro
    ) agg ON agg.CC_Enfermeiro = e.CC;
END;
GO
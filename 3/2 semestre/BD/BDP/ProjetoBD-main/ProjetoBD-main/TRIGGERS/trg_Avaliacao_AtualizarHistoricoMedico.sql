CREATE OR ALTER TRIGGER SGH.trg_Avaliacao_AtualizarHistoricoMedico
ON SGH.Avaliacao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE SGH.Medico
    SET Historico_Consultas =
        CASE
            WHEN Historico_Consultas IS NULL OR LTRIM(RTRIM(CAST(Historico_Consultas AS VARCHAR(MAX)))) = ''
            THEN agg.Novas
            ELSE CAST(Historico_Consultas AS VARCHAR(MAX)) + '; ' + agg.Novas
        END
    FROM SGH.Medico m
    JOIN (
        SELECT CC_Medico,
               STRING_AGG('Av. ' + CAST(N_Avaliacao AS VARCHAR(10)), '; ') AS Novas
        FROM inserted
        GROUP BY CC_Medico
    ) agg ON agg.CC_Medico = m.CC;
END;
GO
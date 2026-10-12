CREATE OR ALTER TRIGGER SGH.trg_MedCir_AtualizarHistoricoMedico
ON SGH.Medico_Cirurgia
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
               STRING_AGG('Cir. ' + CAST(N_Cirurgia AS VARCHAR(10)), '; ') AS Novas
        FROM inserted
        GROUP BY CC_Medico
    ) agg ON agg.CC_Medico = m.CC;
END;
GO
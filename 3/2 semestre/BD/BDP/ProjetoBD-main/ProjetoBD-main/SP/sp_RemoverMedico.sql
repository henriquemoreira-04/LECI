CREATE OR ALTER PROCEDURE SGH.sp_RemoverMedico
    @cc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    -- Diagnósticos dependem de Avaliações que dependem do médico
    DELETE FROM SGH.Diagnostico
    WHERE N_Avaliacao IN (
        SELECT N_Avaliacao FROM SGH.Avaliacao WHERE CC_Medico = @cc
    );
    DELETE FROM SGH.Avaliacao        WHERE CC_Medico = @cc;
    DELETE FROM SGH.Medico_Cirurgia  WHERE CC_Medico = @cc;
    DELETE FROM SGH.Medico           WHERE CC = @cc;
END;
GO
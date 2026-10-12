CREATE OR ALTER PROCEDURE SGH.sp_RemoverSala
    @nSala INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM SGH.Sala_Equipamento WHERE N_Sala            = @nSala;
    -- Cirurgias e avaliações na sala também precisam de ser tratadas
    DELETE FROM SGH.Medico_Cirurgia
    WHERE N_Cirurgia IN (SELECT N_Cirurgia FROM SGH.Cirurgia WHERE N_Sala_Operacao = @nSala);
    DELETE FROM SGH.Enfermeiro_Cirurgia
    WHERE N_Cirurgia IN (SELECT N_Cirurgia FROM SGH.Cirurgia WHERE N_Sala_Operacao = @nSala);
    DELETE FROM SGH.Cirurgia   WHERE N_Sala_Operacao  = @nSala;
    DELETE FROM SGH.Diagnostico
    WHERE N_Avaliacao IN (SELECT N_Avaliacao FROM SGH.Avaliacao WHERE N_Sala_Gabinete = @nSala);
    DELETE FROM SGH.Avaliacao  WHERE N_Sala_Gabinete  = @nSala;
    DELETE FROM SGH.Sala       WHERE N_Sala            = @nSala;
END;
GO
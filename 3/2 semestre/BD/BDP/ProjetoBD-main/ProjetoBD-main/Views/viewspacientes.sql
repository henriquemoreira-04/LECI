CREATE VIEW SGH.vw_Pacientes
AS
SELECT
    p.CC,
    ps.Nome,
    p.N_utente,
    p.Grupo_Sanguineo,
    p.Historico_Medico
FROM SGH.Paciente p
INNER JOIN SGH.Pessoa ps ON ps.CC = p.CC;
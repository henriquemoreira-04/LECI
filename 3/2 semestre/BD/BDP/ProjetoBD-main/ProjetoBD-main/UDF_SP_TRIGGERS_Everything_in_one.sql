CREATE OR ALTER PROCEDURE SGH.sp_RemoverEnfermeiro
    @cc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM SGH.Enfermeiro_Cirurgia WHERE CC_Enfermeiro = @cc;
    DELETE FROM SGH.Enfermeiro           WHERE CC = @cc;
END;
GO

CREATE OR ALTER PROCEDURE SGH.sp_RemoverMedico
    @cc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM SGH.Diagnostico
    WHERE N_Avaliacao IN (
        SELECT N_Avaliacao FROM SGH.Avaliacao WHERE CC_Medico = @cc
    );
    DELETE FROM SGH.Avaliacao        WHERE CC_Medico = @cc;
    DELETE FROM SGH.Medico_Cirurgia  WHERE CC_Medico = @cc;
    DELETE FROM SGH.Medico           WHERE CC = @cc;
END;
GO

CREATE OR ALTER PROCEDURE SGH.sp_RemoverSala
    @nSala INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM SGH.Sala_Equipamento WHERE N_Sala = @nSala;
    DELETE FROM SGH.Medico_Cirurgia
        WHERE N_Cirurgia IN (SELECT N_Cirurgia FROM SGH.Cirurgia WHERE N_Sala_Operacao = @nSala);
    DELETE FROM SGH.Enfermeiro_Cirurgia
        WHERE N_Cirurgia IN (SELECT N_Cirurgia FROM SGH.Cirurgia WHERE N_Sala_Operacao = @nSala);
    DELETE FROM SGH.Cirurgia WHERE N_Sala_Operacao = @nSala;
    DELETE FROM SGH.Diagnostico
        WHERE N_Avaliacao IN (SELECT N_Avaliacao FROM SGH.Avaliacao WHERE N_Sala_Gabinete = @nSala);
    DELETE FROM SGH.Avaliacao WHERE N_Sala_Gabinete = @nSala;
    DELETE FROM SGH.Sala      WHERE N_Sala = @nSala;
END;
GO

CREATE OR ALTER PROCEDURE SGH.sp_TransferirMedico
    @cc           VARCHAR(20),
    @novoDep      INT,
    @novoHospital VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE SGH.Medico
        SET Departamento_N = @novoDep,
            Hospital_Nome  = @novoHospital
        WHERE CC = @cc;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

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

CREATE OR ALTER TRIGGER SGH.trg_Avaliacao_ValidarTipoSala
ON SGH.Avaliacao
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SGH.Sala s        ON s.N_Sala       = i.N_Sala_Gabinete
        JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
        WHERE t.Designacao LIKE '%Bloco%' OR t.Designacao LIKE '%Operat%'
    )
    BEGIN
        RAISERROR('Uma avalia��o n�o pode ser agendada numa sala de bloco operat�rio.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO

CREATE OR ALTER TRIGGER SGH.trg_Cirurgia_ValidarTipoSala
ON SGH.Cirurgia
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SGH.Sala s        ON s.N_Sala       = i.N_Sala_Operacao
        JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
        WHERE t.Designacao LIKE '%Gabinete%'
    )
    BEGIN
        RAISERROR('Uma cirurgia n�o pode ser agendada num gabinete.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO

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
        RAISERROR('N�o � poss�vel remover um paciente com cirurgias registadas. Remova as cirurgias primeiro.', 16, 1);
        RETURN;
    END;
    DELETE FROM SGH.Avaliacao WHERE CC_Paciente IN (SELECT CC FROM deleted);
    DELETE FROM SGH.Paciente  WHERE CC           IN (SELECT CC FROM deleted);
END;
GO

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

CREATE OR ALTER FUNCTION SGH.fn_TotalCirurgiasPaciente
    (@cc VARCHAR(20))
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*) FROM SGH.Cirurgia WHERE CC_Paciente = @cc
    );
END;
GO

CREATE OR ALTER FUNCTION SGH.fn_TotalAvaliacoesMedico
    (@cc VARCHAR(20))
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*) FROM SGH.Avaliacao WHERE CC_Medico = @cc
    );
END;
GO

CREATE OR ALTER FUNCTION SGH.fn_SalaDisponivel
    (@nSala INT, @data DATE)
RETURNS BIT
AS
BEGIN
    DECLARE @ocupada INT;
    SELECT @ocupada = COUNT(*)
    FROM (
        SELECT N_Sala_Gabinete AS Sala, Data FROM SGH.Avaliacao
        UNION ALL
        SELECT N_Sala_Operacao, Data         FROM SGH.Cirurgia
    ) AS eventos
    WHERE Sala = @nSala AND Data = @data;

    RETURN CASE WHEN @ocupada = 0 THEN 1 ELSE 0 END;
END;
GO

CREATE OR ALTER FUNCTION SGH.fn_TipoSalaLabel
    (@id INT)
RETURNS TABLE
AS
RETURN (
    SELECT CAST(Identificador AS VARCHAR) + ' � ' + Designacao AS Label
    FROM SGH.Tipo_de_Sala
    WHERE Identificador = @id
);
GO
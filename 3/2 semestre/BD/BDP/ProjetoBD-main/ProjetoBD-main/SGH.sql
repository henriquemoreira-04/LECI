-- ============================================================
-- Base de Dados : Sistema de Gestão Hospitalar
-- ============================================================

-- Criação do schema SGH (Sistema de Gestão Hospitalar).
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SGH')
BEGIN
    EXEC('CREATE SCHEMA SGH');
END
GO


-- ============================================================
-- 1. PESSOA
--    Entidade mais genérica do sistema.
-- ============================================================
CREATE TABLE SGH.Pessoa (
    CC          VARCHAR(20)     NOT NULL,
    NIF         VARCHAR(20)     NOT NULL,
    Nome        VARCHAR(100)    NOT NULL,
    Contacto    VARCHAR(50),
    Morada      VARCHAR(200),
    CONSTRAINT PK_Pessoa PRIMARY KEY (CC),
    CONSTRAINT UK_Pessoa_NIF UNIQUE (NIF)
);

-- ============================================================
-- 2. HOSPITAL
--    Representa a instituição hospitalar à qual os
--    departamentos pertencem.
-- ============================================================
CREATE TABLE SGH.Hospital (
    Nome         VARCHAR(100)   NOT NULL,
    Localizacao  VARCHAR(200),
    CONSTRAINT PK_Hospital PRIMARY KEY (Nome)
);

-- ============================================================
-- 3. DEPARTAMENTO
--    Representa as diferentes alas ou especialidades
--    médicas do hospital.
-- ============================================================
CREATE TABLE SGH.Departamento (
    N_Departamento  INT             NOT NULL,
    Nome            VARCHAR(100)    NOT NULL,
    Hospital_Nome   VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Departamento PRIMARY KEY (N_Departamento, Hospital_Nome),
    CONSTRAINT FK_Departamento_Hospital FOREIGN KEY (Hospital_Nome)
        REFERENCES SGH.Hospital(Nome)
);

-- ============================================================
-- 4. PACIENTE
--    Utente do Hospital. Instância de Pessoa.
-- ============================================================
CREATE TABLE SGH.Paciente (
    CC                  VARCHAR(20)     NOT NULL,
    N_utente            VARCHAR(20)     NOT NULL,
    Grupo_Sanguineo     VARCHAR(10),
    Historico_Medico    TEXT,
    CONSTRAINT PK_Paciente PRIMARY KEY (CC),
    CONSTRAINT FK_Paciente_Pessoa FOREIGN KEY (CC)
        REFERENCES SGH.Pessoa(CC),
    CONSTRAINT UK_Paciente_N_utente UNIQUE (N_utente)
);

-- ============================================================
-- 5. ADMINISTRADOR
--    Responsável pela gestão hospitalar. Instância de Pessoa.
-- ============================================================
CREATE TABLE SGH.Administrador (
    CC                  VARCHAR(20)     NOT NULL,
    N_Administrador     VARCHAR(20)     NOT NULL,
    Departamento_N      INT             NOT NULL,
    Hospital_Nome       VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Administrador PRIMARY KEY (CC),
    CONSTRAINT FK_Administrador_Pessoa FOREIGN KEY (CC)
        REFERENCES SGH.Pessoa(CC),
    CONSTRAINT FK_Administrador_Departamento FOREIGN KEY (Departamento_N, Hospital_Nome)
        REFERENCES SGH.Departamento(N_Departamento, Hospital_Nome),
    CONSTRAINT UK_Administrador_N UNIQUE (N_Administrador)
);

-- ============================================================
-- 6. ENFERMEIRO
--    Profissional de Enfermagem. Instância de Pessoa.
-- ============================================================
CREATE TABLE SGH.Enfermeiro (
    CC                  VARCHAR(20)     NOT NULL,
    N_enfermeiro        VARCHAR(20)     NOT NULL,
    Historico_Consultas TEXT,
    Departamento_N      INT             NOT NULL,
    Hospital_Nome       VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Enfermeiro PRIMARY KEY (CC),
    CONSTRAINT FK_Enfermeiro_Pessoa FOREIGN KEY (CC)
        REFERENCES SGH.Pessoa(CC),
    CONSTRAINT FK_Enfermeiro_Departamento FOREIGN KEY (Departamento_N, Hospital_Nome)
        REFERENCES SGH.Departamento(N_Departamento, Hospital_Nome),
    CONSTRAINT UK_Enfermeiro_N UNIQUE (N_enfermeiro)
);
    
-- ============================================================
-- 7. MÉDICO
--    Profissional de Saúde responsável pelas consultas.
--    Instância de Pessoa.
-- ============================================================
CREATE TABLE SGH.Medico (
    CC                  VARCHAR(20)     NOT NULL,
    N_medico            VARCHAR(20)     NOT NULL,
    Especialidade       VARCHAR(100),
    Historico_Consultas TEXT,
    Departamento_N      INT             NOT NULL,
    Hospital_Nome       VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Medico PRIMARY KEY (CC),
    CONSTRAINT FK_Medico_Pessoa FOREIGN KEY (CC)
        REFERENCES SGH.Pessoa(CC),
    CONSTRAINT FK_Medico_Departamento FOREIGN KEY (Departamento_N, Hospital_Nome)
        REFERENCES SGH.Departamento(N_Departamento, Hospital_Nome),
    CONSTRAINT UK_Medico_N UNIQUE (N_medico)
);

-- ============================================================
-- 8. TIPO DE SALA
--    Classifica as salas do hospital por finalidade
--    (ex: gabinete, bloco operatório, enfermaria).
-- ============================================================
CREATE TABLE SGH.Tipo_de_Sala (
    Identificador   INT             NOT NULL,
    Designacao       VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Tipo_de_Sala PRIMARY KEY (Identificador)
);

-- ============================================================
-- 9. SALA
--    Representa as salas ou gabinetes do hospital,
--    associadas a um departamento e a um tipo.
-- ============================================================
CREATE TABLE SGH.Sala (
    N_Sala          INT             NOT NULL,
    Andar           INT,
    N_Departamento  INT             NOT NULL,
    Hospital_Nome   VARCHAR(100)    NOT NULL,
    Tipo_Sala       INT             NOT NULL,
    CONSTRAINT PK_Sala PRIMARY KEY (N_Sala),
    CONSTRAINT FK_Sala_Departamento FOREIGN KEY (N_Departamento, Hospital_Nome)
        REFERENCES SGH.Departamento(N_Departamento, Hospital_Nome),
    CONSTRAINT FK_Sala_Tipo FOREIGN KEY (Tipo_Sala)
        REFERENCES SGH.Tipo_de_Sala(Identificador)
);

-- ============================================================
-- 10. EQUIPAMENTO MÉDICO
--     Representa os recursos físicos e maquinaria médica
--     (ex: aparelhos de Raio-X, Ecógrafos).
-- ============================================================
CREATE TABLE SGH.Equipamento_Medico (
    Identificador   INT             NOT NULL,
    Nome            VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Equipamento_Medico PRIMARY KEY (Identificador)
);

-- ============================================================
-- 11. SALA_EQUIPAMENTO
--     Tabela associativa que regista quais equipamentos
--     estão alocados a cada sala e em que quantidade.
-- ============================================================
CREATE TABLE SGH.Sala_Equipamento (
    N_Sala                      INT     NOT NULL,
    Identificador_Equipamento   INT     NOT NULL,
    Quantidade                  INT     NOT NULL DEFAULT 1,
    CONSTRAINT PK_Sala_Equipamento PRIMARY KEY (N_Sala, Identificador_Equipamento),
    CONSTRAINT FK_SalaEquip_Sala FOREIGN KEY (N_Sala)
        REFERENCES SGH.Sala(N_Sala),
    CONSTRAINT FK_SalaEquip_Equipamento FOREIGN KEY (Identificador_Equipamento)
        REFERENCES SGH.Equipamento_Medico(Identificador)
);

-- ============================================================
-- 12. AVALIAÇÃO
--     Representa o evento clínico agendado, cruzando
--     um Paciente e um Médico numa determinada data e sala.
-- ============================================================
CREATE TABLE SGH.Avaliacao (
    N_Avaliacao     INT             NOT NULL,
    Data            DATE            NOT NULL,
    CC_Paciente     VARCHAR(20)     NOT NULL,
    CC_Medico       VARCHAR(20)     NOT NULL,
    N_Sala_Gabinete INT             NOT NULL,
    CONSTRAINT PK_Avaliacao PRIMARY KEY (N_Avaliacao),
    CONSTRAINT FK_Avaliacao_Paciente FOREIGN KEY (CC_Paciente)
        REFERENCES SGH.Paciente(CC),
    CONSTRAINT FK_Avaliacao_Medico FOREIGN KEY (CC_Medico)
        REFERENCES SGH.Medico(CC),
    CONSTRAINT FK_Avaliacao_Sala FOREIGN KEY (N_Sala_Gabinete)
        REFERENCES SGH.Sala(N_Sala)
);

-- ============================================================
-- 13. DIAGNÓSTICO
--     Resultado clínico produzido por uma avaliação,
--     contendo a designação e a data do diagnóstico.
-- ============================================================
CREATE TABLE SGH.Diagnostico (
    N_Avaliacao     INT             NOT NULL,
    N_Diagnostico   INT             NOT NULL,
    Data            DATE            NOT NULL,
    Designacao      VARCHAR(200)    NOT NULL,
    CONSTRAINT PK_Diagnostico PRIMARY KEY (N_Diagnostico),
    CONSTRAINT FK_Diagnostico_Avaliacao FOREIGN KEY (N_Avaliacao)
        REFERENCES SGH.Avaliacao(N_Avaliacao)
);

-- ============================================================
-- 14. CIRURGIA
--     Procedimento cirúrgico originado por um diagnóstico,
--     realizado numa sala de operações sobre um paciente.
-- ============================================================
CREATE TABLE SGH.Cirurgia (
    N_Cirurgia      INT             NOT NULL,
    Data            DATE            NOT NULL,
    Risco           VARCHAR(50),
    Observacoes     TEXT,
    CC_Paciente     VARCHAR(20)     NOT NULL,
    N_Sala_Operacao INT             NOT NULL,
    N_Diagnostico   INT             NOT NULL,
    CONSTRAINT PK_Cirurgia PRIMARY KEY (N_Cirurgia),
    CONSTRAINT FK_Cirurgia_Paciente FOREIGN KEY (CC_Paciente)
        REFERENCES SGH.Paciente(CC),
    CONSTRAINT FK_Cirurgia_Sala FOREIGN KEY (N_Sala_Operacao)
        REFERENCES SGH.Sala(N_Sala),
    CONSTRAINT FK_Cirurgia_Diagnostico FOREIGN KEY (N_Diagnostico)
        REFERENCES SGH.Diagnostico(N_Diagnostico)
);

-- ============================================================
-- 15. ENFERMEIRO_CIRURGIA
--     Tabela associativa que regista quais enfermeiros
--     assistem a cada cirurgia.
-- ============================================================
CREATE TABLE SGH.Enfermeiro_Cirurgia (
    CC_Enfermeiro   VARCHAR(20)     NOT NULL,
    N_Cirurgia      INT             NOT NULL,
    CONSTRAINT PK_Enfermeiro_Cirurgia PRIMARY KEY (CC_Enfermeiro, N_Cirurgia),
    CONSTRAINT FK_EnfCir_Enfermeiro FOREIGN KEY (CC_Enfermeiro)
        REFERENCES SGH.Enfermeiro(CC),
    CONSTRAINT FK_EnfCir_Cirurgia FOREIGN KEY (N_Cirurgia)
        REFERENCES SGH.Cirurgia(N_Cirurgia)
);

-- ============================================================
-- 16. MEDICO_CIRURGIA
--     Tabela associativa que regista quais médicos
--     realizam cada cirurgia.
-- ============================================================
CREATE TABLE SGH.Medico_Cirurgia (
    CC_Medico   VARCHAR(20)     NOT NULL,
    N_Cirurgia  INT             NOT NULL,
    CONSTRAINT PK_Medico_Cirurgia PRIMARY KEY (CC_Medico, N_Cirurgia),
    CONSTRAINT FK_MedCir_Medico FOREIGN KEY (CC_Medico)
        REFERENCES SGH.Medico(CC),
    CONSTRAINT FK_MedCir_Cirurgia FOREIGN KEY (N_Cirurgia)
        REFERENCES SGH.Cirurgia(N_Cirurgia)
);
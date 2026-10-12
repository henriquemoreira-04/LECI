CREATE SCHEMA Conferencia;

CREATE TABLE Conferencia.Instituicao(
    ID                      INT             NOT NULL PRIMARY KEY,
    Endereco                TEXT,
    Nome                    VARCHAR(30),
);

CREATE TABLE Conferencia.Pessoa(
    Email                   VARCHAR(30)     NOT NULL PRIMARY KEY,
    Nome                    VARCHAR(30),
    IDInstituicao           INT             NOT NULL REFERENCES Conferencia.Instituicao(ID)
         ON UPDATE CASCADE,
);

CREATE TABLE Conferencia.Autor(
    EmailPessoa             VARCHAR(30)     NOT NULL PRIMARY KEY REFERENCES Conferencia.Pessoa(Email)
         ON UPDATE CASCADE,
);

CREATE TABLE Conferencia.Participante(
    EmailPessoa             VARCHAR(30)     NOT NULL PRIMARY KEY REFERENCES Conferencia.Pessoa(Email)
         ON UPDATE CASCADE,
    DataIncricao            DATE            NOT NULL,
    Morada                  TEXT,
    IDConferencia           INT             NOT NULL,
);

CREATE TABLE Conferencia.Estudante(
    EmailParticipante       VARCHAR(30)     NOT NULL PRIMARY KEY REFERENCES Conferencia.Participante(EmailPessoa)
         ON UPDATE CASCADE,
    LocEletComprovativo     VARCHAR(100)    UNIQUE,
);

CREATE TABLE Conferencia.NaoEstudante(
    EmailParticipante       VARCHAR(30)     NOT NULL PRIMARY KEY REFERENCES Conferencia.Participante(EmailPessoa)
         ON UPDATE CASCADE,
    RefTransfBancaria       INT             UNIQUE,
);

CREATE TABLE Conferencia.Conferencia(
    ID                      INT             NOT NULL PRIMARY KEY,
    Nome                    VARCHAR(30),
    Localizacao             TEXT,
    DataInicio              DATE,
    DataFim                 DATE,
);

CREATE TABLE Conferencia.ArtigoCientifico(
    Numero                  INT             NOT NULL PRIMARY KEY,
    Titulo                  VARCHAR(30),
    EmailAutor              VARCHAR(30)     NOT NULL REFERENCES Conferencia.Autor(EmailPessoa)
         ON UPDATE CASCADE,
    IDConferencia           INT             NOT NULL REFERENCES Conferencia.Conferencia(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
);

ALTER TABLE Conferencia.Participante ADD FOREIGN KEY(IDConferencia) REFERENCES Conferencia.Conferencia(ID)
    ON DELETE CASCADE ON UPDATE CASCADE;
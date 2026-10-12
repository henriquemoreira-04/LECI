CREATE TABLE Instituicao (
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,

    PRIMARY KEY(Nome),
    UNIQUE(Endereco),
);

CREATE TABLE Autor (
    Email VARCHAR(60) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(30) NOT NULL,

    PRIMARY KEY(Email),
    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
);

CREATE TABLE Artigo (
    EmailAutor VARCHAR(60) NOT NULL,
    NumeroRegisto INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,

    PRIMARY KEY(NumeroRegisto),
    FOREIGN KEY(EmailAutor) REFERENCES Autor(Email),
);

CREATE TABLE Participante (
    Email VARCHAR(60) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    DataInscricao DATE NOT NULL,
    Morada VARCHAR(50) NOT NULL,
    NomeInstituicao VARCHAR(30) NOT NULL,

    PRIMARY KEY(Email),
    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
);

CREATE TABLE NaoEstudante (
    Email VARCHAR(60) NOT NULL PRIMARY KEY REFERENCES Participante(Email),
    NomeInstituicao VARCHAR(30) NOT NULL,

    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
);

CREATE TABLE Estudante (
    Email VARCHAR(60) NOT NULL PRIMARY KEY REFERENCES Participante(Email),
    NomeInstituicao VARCHAR(30) NOT NULL,

    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
);

CREATE TABLE CertificaEstudante (
    Comprovativo VARCHAR(50) NOT NULL,
    NomeInstituicao VARCHAR(30),
    EmailEstudante VARCHAR(60) NOT NULL,

    PRIMARY KEY(Comprovativo),
    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
    FOREIGN KEY(EmailEstudante) REFERENCES Estudante(Email),
);

CREATE TABLE CertificaNaoEstudante (
    Referencia VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(30) NOT NULL,
    EmailNaoEstudante VARCHAR(60) NOT NULL,

    PRIMARY KEY(Referencia),
    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome),
    FOREIGN KEY(EmailNaoEstudante) REFERENCES NaoEstudante(Email),
);
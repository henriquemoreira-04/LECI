CREATE TABLE Pessoa (
    NumeroCC INT NOT NULL,
    Telefone INT NOT NULL,
    Email VARCHAR(60) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    DataNascimento DATE NOT NULL,
    Morada VARCHAR(50) NOT NULL,

    PRIMARY KEY(NumeroCC),
);

CREATE TABLE Professor (
    NumeroCC INT NOT NULL PRIMARY KEY REFERENCES Pessoa(NumeroCC),
    NumeroFuncionario INT NOT NULL,

    UNIQUE(NumeroFuncionario),
);

CREATE TABLE Responsavel (
    NumeroCC INT NOT NULL PRIMARY KEY REFERENCES Pessoa(NumeroCC),
);

CREATE TABLE EncarregadoEducacao (
    NumeroCC INT NOT NULL PRIMARY KEY REFERENCES Pessoa(NumeroCC),
);

CREATE TABLE Turma (
    ID INT NOT NULL,
    NumeroMaximoAlunos INT NOT NULL,
    Desigancao VARCHAR(50) NOT NULL,
    Classe INT NOT NULL,
    AnoLetivo INT NOT NULL,
    NumeroFuncionarioProfessor INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(NumeroFuncionarioProfessor) REFERENCES Professor(NumeroFuncionario),
);

CREATE TABLE Aluno (
    NumeroCC INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Morada VARCHAR(50) NOT NULL,
    IDTurma INT NOT NULL,
    NumeroCCEncarregadoEducacao INT NOT NULL,

    PRIMARY KEY(NumeroCC),
    FOREIGN KEY(IDTurma) REFERENCES Turma(ID),
    FOREIGN KEY(NumeroCCEncarregadoEducacao) REFERENCES EncarregadoEducacao(NumeroCC),
);

CREATE TABLE Atividade (
    ID INT NOT NULL,
    CustoFinanceiro FLOAT NOT NULL,
    Desigancao VARCHAR(50) NOT NULL,

    PRIMARY KEY(ID),
);

CREATE TABLE Participa (
    IDAtividade INT NOT NULL FOREIGN KEY REFERENCES Atividade(ID),
    NumeroCCAluno INT NOT NULL FOREIGN KEY REFERENCES Aluno(NumeroCC),

    PRIMARY KEY(IDAtividade, NumeroCCAluno),
);

CREATE TABLE Levanta (
    NumeroCCAluno INT NOT NULL FOREIGN KEY REFERENCES Aluno(NumeroCC),
    NumeroCCResponsavel INT NOT NULL FOREIGN KEY REFERENCES Responsavel(NumeroCC),

    PRIMARY KEY(NumeroCCAluno, NumeroCCResponsavel),
);

CREATE TABLE Realiza (
    IDTurma INT NOT NULL FOREIGN KEY REFERENCES Turma(ID),
    IDAtividade INT NOT NULL FOREIGN KEY REFERENCES Atividade(ID),

    PRIMARY KEY(IDTurma, IDAtividade),
);
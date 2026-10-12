CREATE SCHEMA Voo;

CREATE TABLE Voo.Aeroporto(
    Codigo                  INT             NOT NULL PRIMARY KEY,
    City                    VARCHAR(30),
    Estado                  VARCHAR(30),
    Nome                    VARCHAR(30)     UNIQUE
);

CREATE TABLE Voo.TipoAviao(
    Nome                    VARCHAR(30)     NOT NULL PRIMARY KEY,
    Companhia               VARCHAR(30),
    MaxLugares              INT,
);

CREATE TABLE Voo.PodeAterrar(
    CodigoAeroporto         INT             NOT NULL,
    NomeTipoAviao           VARCHAR(30)     NOT NULL,
    PRIMARY KEY(CodigoAeroporto, NomeTipoAviao),
    FOREIGN KEY(CodigoAeroporto) REFERENCES Voo.Aeroporto(Codigo) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(NomeTipoAviao) REFERENCES Voo.TipoAviao(Nome) 
        ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Voo.Aviao(
    Id                      INT             NOT NULL PRIMARY KEY,
    Lugares                 INT             CHECK(Lugares>0),
    NomeTipoAviao           INT,
    FOREIGN KEY(NomeTipoAviao) REFERENCES Voo.TipoAviao(Nome)
        ON DELETE CASCADE ON UPDATE CASCADE,

);

CREATE TABLE Voo.Trajeto( --FlightLeg
    Numero                  INT             NOT NULL,
    NumeroVoo               INT             NOT NULL,
    CodigoAeroportoPartida  INT             NOT NULL,
    CodigoAeroportoChegada  INT             NOT NULL,
    HoraPrevistaPartida     TIME,
    HoraPrevistaChegada     TIME,
    -- Não verifico se HoraPrevistaChegada é maior que HoraPrevistaPartida porque um voo pode sair ao final de um dia e chegar na manhã de outro!
    PRIMARY KEY (Numero, NumeroVoo, CodigoAeroportoPartida, CodigoAeroportoChegada),
    FOREIGN KEY(CodigoAeroportoPartida) REFERENCES Voo.Aeroporto(Codigo, Codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(CodigoAeroportoChegada) REFERENCES Voo.Aeroporto(Codigo, Codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Voo.InstanciaTrajeto(
    Lugares                         INT             CHECK(Lugares>0),
    HoraPartida                     TIME,
    HoraChegada                     TIME,
    Momento                         DATE            NOT NULL,
    NumeroTrajeto                   INT             NOT NULL,
    NumeroVooTrajeto                INT             NOT NULL,
    CodigoAeroportoPartidaTrajeto   INT             NOT NULL,
    CodigoAerorportoChegadaTrajeto  INT             NOT NULL,
    PRIMARY KEY(Momento, NumeroTrajeto, NumeroVooTrajeto, CodigoAeroportoPartidaTrajeto, CodigoAerorportoChegadaTrajeto),
    FOREIGN KEY(NumeroTrajeto, NumeroVooTrajeto, CodigoAeroportoPartidaTrajeto, CodigoAerorportoChegadaTrajeto) REFERENCES Voo.Trajeto(Numero, NumeroVoo, CodigoAeroportoPartida, CodigoAeroportoChegada)
        ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Voo.Reserva(
    NrTelemovelCliente                      INT                     NOT NULL,
    NomeCliente                             VARCHAR(120)            NOT NULL,
    NumeroLugar                             INT                     NOT NULL,
    MomentoInstTraj                         DATE                    NOT NULL,
    NumeroTrajInstTraj                      INT                     NOT NULL,
    NumeroVooTrajInstTraj                   INT                     NOT NULL,
    CodigoAeroportoPartidaTrajInstTraj      INT                     NOT NULL,
    CodigoAerorportoChegadaTrajInstTraj     INT                     NOT NULL,
    PRIMARY KEY(NumeroLugar, MomentoInstTraj, NumeroTrajInstTraj, NumeroVooTrajInstTraj, CodigoAeroportoPartidaTrajInstTraj, CodigoAerorportoChegadaTrajInstTraj),
    FOREIGN KEY(MomentoInstTraj, NumeroTrajInstTraj, NumeroVooTrajInstTraj, CodigoAeroportoPartidaTrajInstTraj, CodigoAerorportoChegadaTrajInstTraj) REFERENCES Voo.InstanciaTrajeto(Momento, NumeroTrajeto, NumeroVooTrajeto, CodigoAeroportoPartidaTrajeto, CodigoAerorportoChegadaTrajeto)
        ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Voo.Voo(
    Numero                  INT             NOT NULL PRIMARY KEY,      
    Aviao                   VARCHAR(20),
    DiaSemana               CHAR(3)         CHECK(DiaSemana IN ('SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM')),
);

CREATE TABLE Voo.Tarifa(
    Restricoes              TEXT,
    Quantia                 SMALLMONEY,
    Codigo                  INT             NOT NULL,
    NumeroVoo               INT             NOT NULL REFERENCES Voo.Voo(Numero),
    PRIMARY KEY (Codigo, NumeroVoo),
);

ALTER TABLE Voo.Trajeto ADD FOREIGN KEY(NumeroVoo) REFERENCES Voo.Voo(Numero) ON DELETE CASCADE ON UPDATE CASCADE;
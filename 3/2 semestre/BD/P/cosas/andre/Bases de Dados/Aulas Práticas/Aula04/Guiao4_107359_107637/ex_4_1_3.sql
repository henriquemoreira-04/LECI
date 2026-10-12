CREATE TABLE TipoFornecedor (
    Codigo INT NOT NULL,
    Designacao VARCHAR(50) NOT NULL,

    PRIMARY KEY(Codigo),
);

CREATE TABLE Fornecedor (
    NIF INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    CondicoesPagamento VARCHAR(30) NOT NULL,
    Endereço VARCHAR(50) NOT NULL,
    FAX VARCHAR(30),
    CodigoTipoForncedor int NOT NULL,

    PRIMARY KEY(NIF),
    FOREIGN KEY(CodigoTipoForncedor) REFERENCES TipoFornecedor(Codigo),
    UNIQUE(Nome, Endereço, FAX),
);

CREATE TABLE Encomenda (
    Numero INT NOT NULL,
    [Data] DATE NOT NULL,
    NIFForncedor INT NOT NULL,

    PRIMARY KEY(Numero),
    FOREIGN KEY(NIFForncedor) REFERENCES Fornecedor(NIF),
);

CREATE TABLE Produto (
    Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    NumeroEncomenda INT NOT NULL,

    PRIMARY KEY(Codigo),
    FOREIGN KEY(NumeroEncomenda) REFERENCES Encomenda(Numero),
);
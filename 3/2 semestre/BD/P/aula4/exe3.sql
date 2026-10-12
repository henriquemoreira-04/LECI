CREATE TABLE Tipo_Fornecedor (
    ID INT NOT NULL,
    Designacao VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Metodo_Pagamento (
    ID INT NOT NULL,
    Designacao VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Produto (
    ID INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    IVA DECIMAL(5,2) NOT NULL,
    Stock INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Fornecedor (
    ID INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    FAX VARCHAR(20),
    NIF INT NOT NULL UNIQUE,
    Tipo_Fornecedor_ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Tipo_Fornecedor_ID) REFERENCES Tipo_Fornecedor(ID)
);

CREATE TABLE Encomenda (
    ID INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Fornecedor VARCHAR(100), 
    Fornecedor_ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedor(ID)
);

CREATE TABLE Transporta (
    Encomenda_ID_M INT NOT NULL,
    Produto_ID_N INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (Encomenda_ID_M, Produto_ID_N),
    FOREIGN KEY (Encomenda_ID_M) REFERENCES Encomenda(ID),
    FOREIGN KEY (Produto_ID_N) REFERENCES Produto(ID)
);

CREATE TABLE Tem (
    Metodo_Pagamento_ID_N INT NOT NULL,
    Fornecedor_ID_M INT NOT NULL,
    PRIMARY KEY (Metodo_Pagamento_ID_N, Fornecedor_ID_M),
    FOREIGN KEY (Metodo_Pagamento_ID_N) REFERENCES Metodo_Pagamento(ID),
    FOREIGN KEY (Fornecedor_ID_M) REFERENCES Fornecedor(ID)
);
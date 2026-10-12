CREATE TABLE Cliente (
    NIF INT NOT NULL, 
    num_carta VARCHAR(20) NOT NULL UNIQUE, 
    nome VARCHAR(100) NOT NULL, 
    endereco VARCHAR(255), 
    PRIMARY KEY (NIF)
);

CREATE TABLE Balcao (
    numero INT NOT NULL, 
    nome VARCHAR(100) NOT NULL, 
    endereco VARCHAR(255), 
    PRIMARY KEY (numero)
);

CREATE TABLE Tipo_Veiculo (
    codigo INT NOT NULL,
    designacao VARCHAR(100) NOT NULL UNIQUE, 
    ar_condicionado BIT NOT NULL, 
    PRIMARY KEY (codigo)
);

CREATE TABLE Ligeiro (
    tipo_codigo_ligeiro INT NOT NULL, 
    numlugares INT NOT NULL, 
    portas INT NOT NULL, 
    combustivel VARCHAR(50) NOT NULL, 
    PRIMARY KEY (tipo_codigo_ligeiro),
    FOREIGN KEY (tipo_codigo_ligeiro) REFERENCES Tipo_Veiculo (codigo)
);

CREATE TABLE Pesado (
    tipo_codigo_pesado INT NOT NULL, 
    Peso DECIMAL(10,2) NOT NULL, 
    passageiros INT NOT NULL, 
    PRIMARY KEY (tipo_codigo_pesado),
    FOREIGN KEY (tipo_codigo_pesado) REFERENCES Tipo_Veiculo (codigo)
);

CREATE TABLE Similaridade (
    tipo_codigo_similaridade_tipo_veiculo_N INT NOT NULL, 
    tipo_codigo_similaridade_tipo_veiculo_M INT NOT NULL, 
    PRIMARY KEY (tipo_codigo_similaridade_tipo_veiculo_N, tipo_codigo_similaridade_tipo_veiculo_M),
    FOREIGN KEY (tipo_codigo_similaridade_tipo_veiculo_N) REFERENCES Tipo_Veiculo (codigo),
    FOREIGN KEY (tipo_codigo_similaridade_tipo_veiculo_M) REFERENCES Tipo_Veiculo (codigo)
);

CREATE TABLE Veiculo (
    matricula VARCHAR(15) NOT NULL, 
    marca VARCHAR(50) NOT NULL, 
    ano INT, 
    Tipo_do_codigo_K INT NOT NULL, 
    PRIMARY KEY (matricula),
    FOREIGN KEY (Tipo_do_codigo_K) REFERENCES Tipo_Veiculo (codigo)
);

CREATE TABLE Aluguer (
    Numero INT NOT NULL, 
    duracao INT NOT NULL, 
    data DATE NOT NULL, 
    NIF_K INT NOT NULL, 
    Numero_balcao_K INT NOT NULL, 
    matricula_K VARCHAR(15) NOT NULL, 
    PRIMARY KEY (Numero),
    FOREIGN KEY (NIF_K) REFERENCES Cliente (NIF),
    FOREIGN KEY (Numero_balcao_K) REFERENCES Balcao (numero),
    FOREIGN KEY (matricula_K) REFERENCES Veiculo (matricula)
);
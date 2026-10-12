CREATE SCHEMA Stock;

CREATE TABLE Stock.Produto(
    Codigo                  INT             NOT NULL PRIMARY KEY,
    Nome                    VARCHAR(30),
    Preco                   SMALLMONEY,
    Contador                INT DEFAULT 0,
    CodigoTaxaIVA           INT DEFAULT 23,
    NIFEmpresa              INT, 
);

CREATE TABLE Stock.TaxaIVA(
    Codigo                  INT             NOT NULL PRIMARY KEY,
    Taxa                    REAL,
);

CREATE TABLE Stock.Empresa(
    NIF                     INT             NOT NULL PRIMARY KEY CHECK(NIF>0),
    Nome                    VARCHAR(30),
);

CREATE TABLE Stock.EncomendaQuantidadeProduto(
    CodigoProduto           INT             NOT NULL REFERENCES Stock.Produto(Codigo)
        ON UPDATE CASCADE ,
    --Não faz sentido apagar um produto da BD, uma vez que lhe há encomendas associadas
    NumeroEncomenda         INT             NOT NULL,
    Quantidade              INT             NOT NULL,
    PRIMARY KEY(CodigoProduto, NumeroEncomenda),
);

CREATE TABLE Stock.Encomenda(
    Numero                  INT             NOT NULL PRIMARY KEY,
    Momento                 DATETIME,
    NIFEmpresa              INT             REFERENCES Stock.Empresa(NIF)
        ON UPDATE CASCADE ,
    --Não faz sentido apagar uma empresa ou fornecedor da BD, uma vez que lhe há encomendas associadas
    NIFFornecedor           INT,
);

CREATE TABLE Stock.Fornecedor(
    NIF                     INT             NOT NULL PRIMARY KEY,
    Fax                     INT             UNIQUE,
    Nome                    VARCHAR(30),
    Endereco                TEXT,
    CodigoCondPagamento     INT             NOT NULL,
    CodigoTipoFornecedor    INT             NOT NULL,               
);

CREATE TABLE Stock.FornecedorCondicaoPagamento(
    Codigo                  INT             NOT NULL PRIMARY KEY,
    Estado                  VARCHAR(30)     NOT NULL,
);

CREATE TABLE Stock.FornecedorTipo(
    Codigo                  INT             NOT NULL PRIMARY KEY,
    Tipo                    VARCHAR(30)     NOT NULL,
);

ALTER TABLE Stock.Produto ADD FOREIGN KEY(CodigoTaxaIVA) REFERENCES Stock.TaxaIVA(Codigo)
    ON DELETE SET DEFAULT ON UPDATE CASCADE;

ALTER TABLE Stock.Produto ADD FOREIGN KEY(NIFEmpresa) REFERENCES Stock.Empresa(NIF)
     ON UPDATE CASCADE;

ALTER TABLE Stock.Encomenda ADD FOREIGN KEY(NIFFornecedor) REFERENCES Stock.Fornecedor(NIF)
     ON UPDATE CASCADE;

ALTER TABLE Stock.EncomendaQuantidadeProduto ADD FOREIGN KEY(NumeroEncomenda) REFERENCES Stock.Encomenda(Numero)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Stock.Fornecedor ADD FOREIGN KEY(CodigoCondPagamento) REFERENCES Stock.FornecedorCondicaoPagamento(Codigo)
     ON UPDATE CASCADE;

ALTER TABLE Stock.Fornecedor ADD FOREIGN KEY(CodigoTipoFornecedor) REFERENCES Stock.FornecedorTipo(Codigo)
     ON UPDATE CASCADE;
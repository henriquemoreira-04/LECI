CREATE SCHEMA RentaCar;

CREATE TABLE RentaCar.Cliente(
	NIF							INT				NOT NULL,	
	Nome						VARCHAR(10),
	Endereço					VARCHAR(10),
	Num_Carta					INT,
	PRIMARY KEY(NIF),
	UNIQUE(Num_Carta)			--outra chave_candidata
);

CREATE TABLE RentaCar.Balcao(
	Numero						INT				NOT NULL,
	Nome						VARCHAR(10),
	Endereço					VARCHAR(10),
	PRIMARY KEY(Numero)
);

CREATE TABLE RentaCar.Tipo_Veiculo(
	Codigo						INT				NOT NULL, 
	Designação					VARCHAR(20), 
	Ar_Condicionado				BIT, 
	PRIMARY KEY(Codigo),
);


CREATE TABLE RentaCar.Veiculo(
	Matricula					VARCHAR(8)		NOT NULL, 
	Marca						VARCHAR(20), 
	Ano							INT, 
	TP_Codigo					INT, 
	PRIMARY KEY(Matricula),
	FOREIGN KEY(TP_Codigo)		REFERENCES	RentaCar.Tipo_Veiculo(Codigo),
);

CREATE TABLE RentaCar.Aluguer(
	Numero						INT, 
	DataA						DATE, 
	Duracao						INT, 
	C_NIF						INT, 
	B_Numero					INT, 
	V_Matricula					VARCHAR(8),
	PRIMARY KEY(Numero),
	FOREIGN KEY(C_NIF)			REFERENCES	RentaCar.Cliente(NIF),
	FOREIGN KEY(B_Numero)		REFERENCES	RentaCar.Balcao(Numero),
	FOREIGN KEY(V_Matricula)	REFERENCES	RentaCar.Veiculo(Matricula)
);


CREATE TABLE RentaCar.Similaridade(
	TPV_Codigo_1				INT, 
	TPV_Codigo_2				INT,  
	PRIMARY KEY(TPV_Codigo_1,TPV_Codigo_2),
	FOREIGN KEY(TPV_Codigo_1)	REFERENCES	RentaCar.Tipo_Veiculo(Codigo),
	FOREIGN KEY(TPV_Codigo_2)	REFERENCES	RentaCar.Tipo_Veiculo(Codigo),
);

CREATE TABLE RentaCar.Ligeiro(
	TP_Codigo					INT, 
	Portas						INT,
	Lugares						INT,
	Combustivel					VARCHAR(10),
	PRIMARY KEY(TP_Codigo),
	FOREIGN KEY(TP_Codigo)		REFERENCES	RentaCar.Tipo_Veiculo(Codigo)
);

CREATE TABLE RentaCar.Pesado(
	TP_Codigo					INT, 
	Peso						REAL, 
	Passageiros					BIT, 
	PRIMARY KEY(TP_Codigo),
	FOREIGN KEY(TP_Codigo) REFERENCES	RentaCar.Tipo_Veiculo(Codigo)
);
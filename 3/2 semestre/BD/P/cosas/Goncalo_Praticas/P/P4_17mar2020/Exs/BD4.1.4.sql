CREATE SCHEMA Hospital;

CREATE TABLE Hospital.Especialidade(
	Codigo						INT				NOT NULL, 
	Nome						VARCHAR(20),
	PRIMARY KEY (Codigo),
	UNIQUE(Nome)		--chave candidata
);

CREATE TABLE Hospital.Medico(
	ID							INT				NOT NULL,
	Nome						VARCHAR(20),
	E_Codigo					INT,
	PRIMARY KEY (Id),
	FOREIGN KEY(E_Codigo)		REFERENCES Hospital.Especialidade(Codigo),
);

CREATE TABLE Hospital.Farmacia(
	Nome						VARCHAR(20)		NOT NULL,
	Endereco					VARCHAR(15),
	Telefone					INT,
	NIF							INT,
	PRIMARY KEY (NIF),
	UNIQUE(Telefone), --chave candidata
	UNIQUE(Endereco) --chave candidata
);

CREATE TABLE Hospital.Paciente(
	Num_SNS						INT				NOT NULL,
	Endereco					VARCHAR(15),
	Nome						VARCHAR(20),
	Data_Nasc					DATE,
	PRIMARY KEY (Num_SNS)
);

CREATE TABLE Hospital.Farmaceutica(
	Num_Registo					INT				NOT NULL,
	Nome						VARCHAR(20),
	Endereco					VARCHAR(15),
	Telefone					INT,
	PRIMARY KEY (Num_Registo),
	UNIQUE(Telefone), --chave candidata
	UNIQUE(Endereco), --chave candidata
);

CREATE TABLE Hospital.Farmaco(
	Formula						VARCHAR(15)		NOT NULL,
	Nome						VARCHAR(20),
	F_Num_Registo				INT,
	PRIMARY KEY (Formula),
	FOREIGN KEY (F_Num_registo)		REFERENCES Hospital.Farmaceutica(Num_Registo),
	UNIQUE(Nome), --chave candidata
);

CREATE TABLE Hospital.Prescricao(
	Num							INT				NOT NULL,
	DataP						DATE,
	P_SNS						INT,
	M_Id						INT, 
	F_NIF						INT, 
	Data_Lev					DATE,
	PRIMARY KEY (Num),
	FOREIGN KEY(P_SNS)		REFERENCES Hospital.Paciente(Num_SNS),
	FOREIGN KEY(M_Id)		REFERENCES Hospital.Medico(Id),
	FOREIGN KEY(F_NIF)		REFERENCES Hospital.Farmacia(NIF)
);


create TABLE Hospital.Vende(
	F_NIF						INT,
	Formula						VARCHAR(15),
	PRIMARY KEY(F_NIF, Formula),
	FOREIGN KEY(F_NIF)			REFERENCES Hospital.Farmacia(NIF),
	FOREIGN KEY(Formula)		REFERENCES Hospital.Farmaco(Formula)
);


CREATE TABLE Hospital.F_Tem_P(
	Num_P						INT,
	Formula						VARCHAR(15),
	PRIMARY KEY(Num_P, Formula),
	FOREIGN KEY(Num_P)			REFERENCES Hospital.Prescricao(Num),
	FOREIGN KEY(Formula)		REFERENCES Hospital.Farmaco(Formula)
);

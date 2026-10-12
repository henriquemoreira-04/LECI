--create schema Universidade;		

CREATE TABLE Universidade.Pessoa(
	N_Mec						INT				NOT NULL,
	Nome						VARCHAR(20),
	Data_Nasc					DATE,
	PRIMARY KEY (N_Mec)
);

CREATE TABLE Universidade.Categoria_Profissional(
	Id							INT				NOT NULL,
	Nome						VARCHAR(20),
	PRIMARY KEY (Id),
	UNIQUE(Id) --chave candidata
);

CREATE TABLE Universidade.Area_Cientifica(
	Id							INT				NOT NULL,
	Nome						VARCHAR(20),
	PRIMARY KEY (Id),
	UNIQUE(Id)		--chave candidata
);

CREATE TABLE Universidade.Grau_Formacao(
	Codigo						INT,
	Designacao					VARCHAR(10),
	PRIMARY KEY (Codigo)
);

CREATE TABLE Universidade.Departamento(
	Nome						VARCHAR(20)			NOT NULL,		
	Localizacao					VARCHAR(15),		
	Dirigente_NMec				INT,				
	PRIMARY KEY (Nome),
	FOREIGN KEY(Dirigente_NMec) REFERENCES	Universidade.Pessoa(N_Mec)
);

CREATE TABLE Universidade.Professor(
	P_NMec						INT					NOT NULL,
	CP_Id						INT,
	AC_Id						INT,
	PRIMARY KEY(P_NMec),
	FOREIGN KEY(P_NMec)			REFERENCES Universidade.Pessoa(N_Mec),
	FOREIGN KEY(CP_ID)			REFERENCES Universidade.Categoria_Profissional(Id),
	FOREIGN KEY(AC_Id)			REFERENCES Universidade.Area_Cientifica(Id)
);


CREATE TABLE Universidade.Trabalhadores_Departamento(
	Prof_NMec					INT,		
	Dep_Nome					VARCHAR(20),		
	Percentagem					INT,				
	PRIMARY KEY (Prof_NMec, Dep_Nome),
	FOREIGN KEY	(Prof_NMec)		REFERENCES Universidade.Professor(P_NMec),
	FOREIGN KEY	(Dep_Nome)		REFERENCES Universidade.Departamento(Nome)
);

CREATE TABLE Universidade.Projeto(
	Id							INT					NOT NULL,
	Nome						VARCHAR(20),
	Entidade_F					VARCHAR(10),
	Orcamento					INT,
	Data_Inicio					DATE,
	Data_Fim					DATE,
	Gestor_NMec					INT,
	PRIMARY KEY(Id),
	FOREIGN KEY (Gestor_NMec)	REFERENCES Universidade.Professor(P_NMec)
);

CREATE TABLE Universidade.Participante_Projeto(
	N_Mec						INT,
	Projeto_ID					INT,	
	PRIMARY KEY (N_Mec, Projeto_ID),
	FOREIGN KEY	(N_Mec)			REFERENCES Universidade.Pessoa(N_Mec),
	FOREIGN KEY	(Projeto_Id)	REFERENCES Universidade.Projeto(Id)
);

CREATE TABLE Universidade.Professor_Participante_Projeto(
	N_Mec						INT	,	
	Projeto_Id					INT	,	
	PRIMARY KEY (N_Mec,Projeto_Id),
	FOREIGN KEY(N_Mec, Projeto_Id)	REFERENCES Universidade.Participante_Projeto(N_Mec,Projeto_Id),
);

CREATE TABLE Universidade.Estudante_Participante_Projeto(
	N_Mec						INT,	
	Projeto_Id					INT	,	
	Supervisor_NMec				INT	,
	PRIMARY KEY (N_Mec,Projeto_Id),
	FOREIGN KEY(N_Mec, Projeto_Id)	REFERENCES Universidade.Professor_Participante_Projeto(N_Mec,Projeto_Id),
	FOREIGN KEY(Supervisor_NMec) REFERENCES Universidade.Professor(P_NMec)
);

CREATE TABLE Universidade.EstudanteG(
	P_NMec						INT				NOT NULL,		
	Dep_Nome					VARCHAR(20),		
	Advisor_NMec				INT,
	GF_Codigo					INT,
	PRIMARY KEY (P_NMec),
	FOREIGN KEY(GF_Codigo)		REFERENCES Universidade.Grau_Formacao(Codigo),
	FOREIGN KEY(Dep_Nome)		REFERENCES Universidade.Departamento(Nome),
	FOREIGN KEY(P_NMec)			REFERENCES Universidade.Pessoa(N_Mec)
);

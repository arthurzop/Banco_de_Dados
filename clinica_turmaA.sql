DROP database clinica;

-- Criar o banco de Dados CLINICA
CREATE database clinica_turmaA;

-- Ativar o banco para uso
USE clinica_turmaA;

CREATE TABLE sala(
-- Criando os dados:
	num_sala 	INT NOT NULL UNIQUE,
    andar 		INT NOT NULL UNIQUE, 
    
-- Checando as restrições:
    CHECK(num_sala >= 1 and num_sala <= 50),
    CHECK(andar >= 1 and andar <= 12),
    PRIMARY KEY (num_sala)
);

CREATE TABLE paciente(
	rg 			CHAR(9) 	NOT NULL UNIQUE,
    nome 		VARCHAR(40) NOT NULL,
    data_nasc 	DATE		NOT NULL,
    cidade 		VARCHAR(30) NOT NULL DEFAULT "itabuna",
    doenca 		VARCHAR(40) NOT NULL,
    plano		VARCHAR(40) NOT NULL DEFAULT "SUS",
    
    PRIMARY KEY	(rg)
);

CREATE TABLE funcionario(
	matricula 	CHAR(15) 	NOT NULL UNIQUE,
    nome 		VARCHAR(40) NOT NULL,
    data_nasc	DATE		NOT NULL,
    data_adm	DATE		NOT NULL,
    cargo		VARCHAR(40) NOT NULL DEFAULT "Assistente Médico",
    salario		FLOAT 		NOT NULL DEFAULT 510.00,
    
    PRIMARY KEY (matricula)
);

CREATE TABLE medico(
	crm			VARCHAR(15) NOT NULL UNIQUE,
    nome 		VARCHAR(40) NOT NULL,
    idade		INT 		NOT NULL,
    esp			VARCHAR(40) NOT NULL DEFAULT "Ortopedia",
    cpf			CHAR(11)	NOT NULL UNIQUE,
    data_adm	DATE,
    num_sala	INT 		NOT NULL UNIQUE,
    matricula	VARCHAR(15) NOT NULL UNIQUE,
    
    CHECK(idade >= 23),
    PRIMARY KEY (crm),
    FOREIGN KEY (num_sala) 	REFERENCES sala			(num_sala),
    FOREIGN KEY (matricula) REFERENCES funcionario	(matricula)
-- 	Foreign key referencia um atributo de outa tabela
-- 	FOREING KEY (atributo) 	REFERENCES tablename 	(atributo),
);


CREATE TABLE consulta(
	id_consulta INT 		NOT NULL UNIQUE,
    data_hora 	DATETIME,
    crm			VARCHAR(15) NOT NULL UNIQUE,
    rg			CHAR(9)	 	NOT NULL UNIQUE,
    
    PRIMARY KEY(id_consulta),
    FOREIGN KEY(crm) REFERENCES medico(crm),
    FOREIGN KEY(rg)	 REFERENCES paciente(rg)
);
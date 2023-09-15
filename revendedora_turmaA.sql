CREATE DATABASE revendedora_carros;
USE revendedora_carros;

CREATE TABLE automovel(
	pk_id_renavam 		CHAR(11) 	NOT NULL UNIQUE,
    tipo_combustivel	VARCHAR(15) NOT NULL,
    preco				INT 		NOT NULL,
    marca				VARCHAR(15) NOT NULL, 
    placa				CHAR(7)		NOT NULL UNIQUE,
    modelo				VARCHAR(15) NOT NULL,
    ano_fabricacao		CHAR(4)		NOT NULL,
    ano_modelo			CHAR(4)		NOT NULL,
    cor					VARCHAR(15) NOT NULL,
    motor				VARCHAR(15) NOT NULL,
    num_porta			CHAR(1)		NOT NULL,
    
    PRIMARY KEY(PK_ID_RENAVAM)
);

CREATE TABLE endereco(
	pk_cep				CHAR(8)		NOT NULL,
    estado				VARCHAR(30) NOT NULL,
    cidade				VARCHAR(40) NOT NULL,
    rua					VARCHAR(40) NOT NULL,
    numero				INT 		NOT NULL,
    complemento			VARCHAR(50),
    bairro				VARCHAR(30) NOT NULL,
    
    PRIMARY KEY(pk_cep)
);

CREATE TABLE cliente(
	pk_cod_num 			VARCHAR(10) NOT NULL UNIQUE,
    nome				VARCHAR(40) NOT NULL,
    sobrenome			VARCHAR(40) NOT NULL,
    telefone			INT 		NOT NULL,
    fk_cep				CHAR(8)		NOT NULL UNIQUE,
    
    PRIMARY KEY (pk_cod_num),
	FOREIGN KEY(fk_cep) REFERENCES endereco(pk_cep)

);

CREATE TABLE vendendor(
	pk_cod_num			VARCHAR(15) NOT NULL UNIQUE,
    nome				VARCHAR(15) NOT NULL,
    sobrenome			VARCHAR(25) NOT NULL,
    telefone			INT			NOT NULL UNIQUE,
    data_emissão		DATE		NOT NULL,
    salario				INT			NOT NULL,
    fk_cep				CHAR(8)		NOT NULL UNIQUE,
    
    PRIMARY KEY(pk_cod_num),
    FOREIGN KEY(fk_cep) REFERENCES endereco(pk_cep)
);

CREATE TABLE venda(
	pk_id				VARCHAR(8)	NOT NULL UNIQUE,
    data_venda			DATE		NOT NULL,
    fk_id_cliente		VARCHAR(10) NOT NULL UNIQUE,
    fk_id_vendedor		VARCHAR(10) NOT NULL UNIQUE,
    fk_id_renavam		CHAR(10)	NOT NULL UNIQUE,
    
    PRIMARY KEY(pk_id),
    FOREIGN KEY(fk_id_cliente) 	REFERENCES cliente(pk_cod_num),
	FOREIGN KEY(fk_id_vendedor) REFERENCES vendedor(pk_cod_num),
    FOREIGN KEY(fk_id_renavam) 	REFERENCES automovel(pk_id_renavam)
);


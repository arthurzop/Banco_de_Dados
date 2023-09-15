CREATE DATABASE eleicoes_turma_a;

USE eleicoes_turma_a;

CREATE TABLE cargo(
	pk_codigo_cargo INT UNIQUE NOT NULL,
    nome_cargo VARCHAR(30) UNIQUE NOT NULL,
    salario FLOAT NOT NULL DEFAULT '17000.00',
    numero_vagas INT UNIQUE NOT NULL,
    CHECK(nome_cargo <> 'Prefeito' AND nome_cargo <> 'Vereador'),
    PRIMARY KEY (pk_codigo_cargo)
);

CREATE TABLE candidato(
	pk_numero_candidato INT UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    fk_codigo_cargo INT NOT NULL,
    fk_codigo_partido INT NOT NULL,
    PRIMARY KEY (pk_numero_candidato),
    FOREIGN KEY (fk_codigo_cargo) REFERENCES cargo(pk_codigo_cargo),
    FOREIGN KEY (fk_codigo_partido) REFERENCES partido(pk_codigo_partido)
);

CREATE TABLE partido(
	pk_codigo_partido INT UNIQUE NOT NULL,
    sigla CHAR(5) UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    numero INT UNIQUE NOT NULL,
    PRIMARY KEY (pk_codigo_partido)
);

CREATE TABLE eleitor(
	pk_titulo_eleitor VARCHAR(30) UNIQUE NOT NULL,
    zona_eleitoral CHAR(5) NOT NULL,
    sessao_eleitoral CHAR(5) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    PRIMARY KEY (pk_titulo_eleitor)
);

CREATE TABLE voto(
	pk_id_voto INT NOT NULL UNIQUE,
    fk_titulo_eleitor VARCHAR(30) UNIQUE NOT NULL,
    fk_numero_candidato INT NOT NULL,
    PRIMARY KEY (pk_id_voto),
    FOREIGN KEY (fk_titulo_eleitor) REFERENCES eleitor(pk_titulo_eleitor),
    FOREIGN KEY (fk_numero_candidato) REFERENCES candidato(pk_numero_candidato)
);
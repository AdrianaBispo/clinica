CREATE DATABASE CLINICAMEDICA;
SHOW DATABASES;
USE CLINICAMEDICA;

CREATE TABLE clinica (
	cnpj INT(30) PRIMARY KEY NOT NULL,
	nomeFantasia VARCHAR(30) NOT NULL,
	capacidade INT NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	contratos VARCHAR(10) NOT NULL,
    CONSTRAINT cnpj_fk FOREIGN KEY (cnpj) REFERENCES contrato(cnpj)
);

CREATE TABLE local (
	cep VARCHAR(9) PRIMARY KEY NOT NULL,
	contratado VARCHAR(20) NOT NULL,
	logadouro VARCHAR(20) NOT NULL,
	complemento varchar(20),
	cidade VARCHAR(10) NOT NULL,
	estado VARCHAR(10) NOT NULL,
    CONSTRAINT numero_fk FOREIGN KEY (contratado) REFERENCES contrato(numero)
);

CREATE TABLE contrato (
	cnpj VARCHAR(30) PRIMARY KEY NOT NULL,
	numero INT NOT NULL,
	tipo varchar(30) NOT NULL,
	profissional INT(20) NOT NULL
);

CREATE TABLE profissional (
	crm INT(20) PRIMARY KEY NOT NULL,
	especialidade varchar(20) NOT NULL,
	cpf varchar(20) NOT NULL,
	consulta varchar(20) NOT NULL,
	nome varchar(55) NOT NULL,
    CONSTRAINT crm_fk FOREIGN KEY (crm) REFERENCES consulta(crm),
    CONSTRAINT especialidade_fk FOREIGN KEY (especialidade) REFERENCES especialidade(id),
    CONSTRAINT consulta_fk FOREIGN KEY (consulta) REFERENCES consulta(id),
    CONSTRAINT nome_fk FOREIGN KEY (nome) REFERENCES contrato(profissional)

);

CREATE TABLE especialidade (
	id INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	sala_atendimento varchar(10) NOT NULL
);

CREATE TABLE consulta (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dia TIMESTAMP NOT NULL,
	crm VARCHAR(50) NOT NULL,
	descrição VARCHAR(255) NOT NULL,
	paciente VARCHAR(50) NOT NULL,
	receitado VARCHAR(50) NOT NULL,
    CONSTRAINT paciente_fk FOREIGN KEY (paciente) REFERENCES paciente(nome),
    CONSTRAINT receitado_fk FOREIGN KEY (receitado) REFERENCES receita(id)
);

CREATE TABLE paciente (
	rg INT(8) PRIMARY KEY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	nascimento DATE NOT NULL,
	tipo_sanguineo VARCHAR(3),
	telefone VARCHAR(10) NOT NULL,
	alergia TEXT(255),
	consulta INT,
    CONSTRAINT consulta_fk FOREIGN KEY (consulta) REFERENCES consulta(id)
);

CREATE TABLE receita (
	id INT PRIMARY KEY NOT NULL,
	remedio INT NOT NULL,
    CONSTRAINT remedio_fk FOREIGN KEY (remedio) REFERENCES remedio(id)
);

CREATE TABLE remedio (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	principio_ativo TEXT NOT NULL,
	contraindicacao TEXT NOT NULL
);
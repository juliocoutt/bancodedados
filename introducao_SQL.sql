CREATE DATABASE Faculdade;   -- Criando um banco de dados Faculdade 
USE Faculdade;

-- Criando as tabelas que são necessarias no banco de dados 

CREATE TABLE professor (   -- tabela professor 
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(20),
    inicio_contrato DATE DEFAULT CURRENT_DATE,
    id_departamento INT
);
CREATE TABLE aluno ( -- tabela aluno 
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);
CREATE TABLE disciplina ( -- tabela de diciplinas existentes 
    nome VARCHAR(100) PRIMARY KEY,
    ementa TEXT,
    carga_horaria INT NOT NULL
);
CREATE TABLE matricula ( -- tabela de matricula 
    matricula_aluno INT,
    nome_disciplina VARCHAR(100),
    PRIMARY KEY (matricula_aluno, nome_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES aluno(matricula),
    FOREIGN KEY (nome_disciplina) REFERENCES disciplina(nome)
);

CREATE TABLE pre_requisito ( -- tabeça de pre-requesitos para cursar outras diciplinas 
    nome_disciplina VARCHAR(100),
    nome_pre_requisito VARCHAR(100),
    PRIMARY KEY (nome_disciplina, nome_pre_requisito),
    FOREIGN KEY (nome_disciplina) REFERENCES disciplina(nome),
    FOREIGN KEY (nome_pre_requisito) REFERENCES disciplina(nome)
);

CREATE TABLE avaliacao (  -- tabela de avaliação 
    matricula_aluno INT,
    nome_disciplina VARCHAR(100),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    comentario TEXT,
    nota DECIMAL(5,2),
    PRIMARY KEY (matricula_aluno, nome_disciplina, data_hora),
    FOREIGN KEY (matricula_aluno) REFERENCES aluno(matricula),
    FOREIGN KEY (nome_disciplina) REFERENCES disciplina(nome)
);

INSERT INTO professor (cpf, nome, contato, id_departamento)
VALUES ('12345678901', 'Carlos Silva', '1234-5678', 1),
       ('98765432100', 'Maria Oliveira', '9876-5432', 2);

INSERT INTO aluno (nome, data_nascimento, endereco)
VALUES ('João Souza', '2000-01-15', 'Rua A, 123'),
       ('Ana Costa', '1998-03-22', 'Rua B, 456');

INSERT INTO disciplina (nome, ementa, carga_horaria)
VALUES ('Matemática', 'Fundamentos de álgebra e geometria.', 60),
       ('Física', 'Estudo das leis da física clássica.', 60);

INSERT INTO matricula (matricula_aluno, nome_disciplina)
VALUES (1, 'Matemática'),
       (1, 'Física'),
       (2, 'Matemática');

INSERT INTO pre_requisito (nome_disciplina, nome_pre_requisito)
VALUES ('Física', 'Matemática');

INSERT INTO avaliacao (matricula_aluno, nome_disciplina, data_hora, comentario, nota)
VALUES (1, 'Matemática', '2025-01-10 10:00:00', 'Ótima avaliação!', 9.5),
       (2, 'Matemática', '2025-01-11 14:00:00', 'Boa prova!', 8.0);

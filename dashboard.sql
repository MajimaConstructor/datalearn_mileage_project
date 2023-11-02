CREATE DATABASE dashboard;
USE dashboard;

CREATE TABLE ALUNOS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    IDADE INT NOT NULL
);

CREATE TABLE CURSOS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL
);

CREATE TABLE TESTES (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CURSO_ID INT NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    FOREIGN KEY (CURSO_ID) REFERENCES CURSOS(ID)
);

CREATE TABLE ALUNO_TESTES (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    ALUNO_ID INT NOT NULL,
    TESTE_ID INT NOT NULL,
    NOTA INT NOT NULL,
    PROGRESSO_CURSO INT NOT NULL,
    FOREIGN KEY (ALUNO_ID) REFERENCES ALUNOS(ID),
    FOREIGN KEY (TESTE_ID) REFERENCES TESTES(ID)
);

CREATE TABLE Visualizacoes (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  CURSO_ID INT NOT NULL,
  Data DATE NOT NULL,
  Visualizacoes INT NOT NULL,
  FOREIGN KEY (CURSO_ID) REFERENCES CURSOS(ID)
);

INSERT INTO ALUNO_TESTES (ALUNO_ID, TESTE_ID, NOTA, PROGRESSO_CURSO) VALUES
(1, 1, 3, 80)


INSERT INTO CURSOS (NOME) VALUES
    ('Java'),
    ('JavaScript'),
    ('Python'),
    ('C#');
    
INSERT INTO TESTES (CURSO_ID, NOME) VALUES
    (1, 'Teste de Java 1'),
    (1, 'Teste de Java 2'),
    (2, 'Teste de JavaScript 1'),
    (2, 'Teste de JavaScript 2'),
    (3, 'Teste de Python 1'),
    (3, 'Teste de Python 2'),
    (4, 'Teste de C# 1'),
    (4, 'Teste de C# 2');



SELECT
    ALUNOS.NOME AS ALUNO,
    CURSOS.NOME AS CURSO,
    TESTES.NOME AS TESTE,
    ALUNO_TESTES.NOTA
FROM ALUNO_TESTES
JOIN ALUNOS ON ALUNOS.ID = ALUNO_TESTES.ALUNO_ID
JOIN TESTES ON TESTES.ID = ALUNO_TESTES.TESTE_ID
JOIN CURSOS ON CURSOS.ID = TESTES.CURSO_ID;

select * from alunos;

select * from aluno_testes

drop database dashboard
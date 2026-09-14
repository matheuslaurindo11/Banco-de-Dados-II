-- ============================================
-- BANCO DE DADOS II - AULA 01
-- Modelagem Relacional e Restrições
-- ============================================


-- ============================================
-- DESAFIO 1 - CLIENTES E EMPRESTIMOS
-- ============================================
CREATE DATABASE IF NOT EXISTS banco_dados_ii;

USE banco_dados_ii;



CREATE TABLE CLIENTES
(
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    NOME       VARCHAR(50) NOT NULL,
    CPF        CHAR(11)    NOT NULL UNIQUE
);

CREATE TABLE EMPRESTIMOS
(
    ID_EMPRESTIMO    INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE       INT            NOT NULL,
    VALOR_SOLICITADO DECIMAL(10, 2) NOT NULL,
    TAXA_JUROS_MES   DECIMAL(5, 2)  NOT NULL,

    CONSTRAINT FK_ID_CLIENTE
        FOREIGN KEY (ID_CLIENTE)
            REFERENCES CLIENTES (ID_CLIENTE)
            ON DELETE RESTRICT,

    CONSTRAINT CHK_VALOR_SOLICITADO
        CHECK (VALOR_SOLICITADO > 500),

    CONSTRAINT CHK_TAXA_JUROS
        CHECK (TAXA_JUROS_MES >= 0 AND TAXA_JUROS_MES < 15.00)
);


-- ============================================
-- DESAFIO 2 - EMPRESAS E FUNCIONARIOS
-- ============================================


ALTER TABLE Empresas
    ADD CONSTRAINT pk_empresas
        PRIMARY KEY (id_empresa);

ALTER TABLE Funcionarios
    ADD CONSTRAINT pk_funcionarios
        PRIMARY KEY (id_func);

ALTER TABLE Funcionarios
    ADD CONSTRAINT fk_funcionarios_empresa
        FOREIGN KEY (id_empresa)
            REFERENCES Empresas (id_empresa)
            ON UPDATE CASCADE
            ON DELETE RESTRICT;

ALTER TABLE Funcionarios
    ADD CONSTRAINT chk_modalidade_trabalho
        CHECK (
            modalidade_trabalho IN (
                                    'PRESENCIAL',
                                    'HIBRIDO',
                                    'REMOTO'
                )
            );
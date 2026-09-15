-- ============================================
-- BANCO DE DADOS II - AULA 04
-- Views no MySQL
-- ============================================


-- ============================================
-- TABELA DE EXEMPLO
-- Cenário de bolsas
-- ============================================

CREATE TABLE estudantes (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            nome VARCHAR(100) NOT NULL,
                            curso VARCHAR(50) NOT NULL,
                            media_geral DECIMAL(4,2) NOT NULL,
                            bolsista BOOLEAN DEFAULT FALSE
);


-- ============================================
-- DADOS DE EXEMPLO
-- ============================================

INSERT INTO estudantes (nome, curso, media_geral, bolsista)
VALUES
    ('Rafael Silva', 'Ciência da Computação', 8.50, TRUE),
    ('Mariana Costa', 'Análise e Dev. de Sistemas', 6.20, FALSE),
    ('Lucas Alencar', 'Ciência da Computação', 9.10, TRUE),
    ('Juliana Paes', 'Análise e Dev. de Sistemas', 5.80, FALSE);


-- ============================================
-- DESAFIO
-- View de candidatos a bolsa
-- ============================================

CREATE OR REPLACE VIEW v_candidatos_bolsa AS
SELECT
    id,
    nome,
    curso,
    media_geral,
    bolsista
FROM estudantes
WHERE media_geral >= 7.00
        WITH CHECK OPTION;


-- ============================================
-- CONSULTA DA VIEW
-- ============================================

SELECT *
FROM v_candidatos_bolsa;


-- ============================================
-- TESTE VÁLIDO
-- Média 8.00
-- Deve ser aceito
-- ============================================

INSERT INTO v_candidatos_bolsa
(nome, curso, media_geral, bolsista)
VALUES
    ('Fernanda Montenegro',
     'Ciência da Computação',
     8.00,
     TRUE);


-- ============================================
-- TESTE INVÁLIDO
-- Média 6.50
-- Deve ser rejeitado pelo WITH CHECK OPTION
-- ============================================

INSERT INTO v_candidatos_bolsa
(nome, curso, media_geral, bolsista)
VALUES
    ('Pedro Henrique',
     'Análise e Dev. de Sistemas',
     6.50,
     FALSE);


-- ============================================
-- CONSULTA FINAL
-- ============================================

SELECT *
FROM v_candidatos_bolsa;
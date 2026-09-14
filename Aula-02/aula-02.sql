-- ============================================
-- BANCO DE DADOS II - AULA 02
-- Consultas Avançadas em SQL
-- ============================================


-- ============================================
-- DESAFIO 1
-- Auditoria de Orçamento
-- ============================================

SELECT
    d.nome AS "Departamento",
    SUM(c.salario) AS "Custo Folha Salarial"
FROM departamento d
         INNER JOIN colaborador c
                    ON d.id_depto = c.id_depto
GROUP BY d.id_depto, d.nome
HAVING SUM(c.salario) > 15000.00;


-- ============================================
-- DESAFIO 2
-- Mapeamento de Piso Salarial
-- ============================================

SELECT
    c1.nome,
    c1.cargo,
    c1.salario,
    c1.id_depto
FROM colaborador c1
WHERE c1.id_depto IS NOT NULL
  AND c1.salario = (
    SELECT MIN(c2.salario)
    FROM colaborador c2
    WHERE c2.id_depto = c1.id_depto
);
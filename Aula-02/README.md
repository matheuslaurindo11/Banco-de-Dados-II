# Aula 02 — Consultas Avançadas em SQL

## Conteúdo

Nesta aula foram trabalhados conceitos de consultas avançadas em bancos de dados relacionais:

- JOINs
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Funções de agregação
- GROUP BY
- HAVING
- Subconsultas
- Subconsultas correlacionadas

O ambiente utilizado na aula foi o MySQL.

---

## Desafio 1 — Auditoria de Orçamento

### Objetivo

Identificar os departamentos cuja soma dos salários dos colaboradores ultrapassa R$ 15.000,00.

### Conceitos utilizados

- INNER JOIN
- SUM()
- GROUP BY
- HAVING

### Consulta

```sql
SELECT
    d.nome AS "Departamento",
    SUM(c.salario) AS "Custo Folha Salarial"
FROM departamento d
INNER JOIN colaborador c
    ON d.id_depto = c.id_depto
GROUP BY d.id_depto, d.nome
HAVING SUM(c.salario) > 15000.00;
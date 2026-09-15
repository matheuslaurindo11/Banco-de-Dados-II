# Aula 04 — Views no MySQL

## Conteúdo

Nesta aula foi trabalhado o conceito de Views no MySQL, abordando:

- Abstração de dados
- Segurança no acesso às informações
- Restrição de colunas
- Restrição de linhas através do `WHERE`
- `CREATE OR REPLACE VIEW`
- `WITH CHECK OPTION`
- Inserções através de Views
- O problema da "evaporação" de dados
- Testes de inserções válidas e inválidas

Uma View funciona como uma tabela virtual baseada no resultado de uma consulta SQL armazenada no banco de dados. :contentReference[oaicite:1]{index=1}

---

## Atividade Prática — Candidatos a Bolsa

### Objetivo

Criar uma View chamada `v_candidatos_bolsa` para permitir a visualização somente de estudantes com média geral maior ou igual a `7.00`.

A View também utiliza `WITH CHECK OPTION` para garantir que inserções ou alterações respeitem a condição definida no `WHERE`. :contentReference[oaicite:2]{index=2}

---

## Tabela utilizada

Foi criada a tabela `estudantes` com as seguintes informações:

- `id`
- `nome`
- `curso`
- `media_geral`
- `bolsista`

Foram inseridos quatro estudantes com diferentes médias para realizar os testes da atividade. :contentReference[oaicite:3]{index=3}

---

## View `v_candidatos_bolsa`

A View foi criada para mostrar somente estudantes com média geral igual ou superior a `7.00`.

```sql
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
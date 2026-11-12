-- Receitas de campanha por candidatura (2014-2024), agregadas no BigQuery.
-- Uma linha por (candidatura, fonte, origem, natureza da receita); "valor" é a soma das receitas.
-- Agregar aqui evita baixar dezenas de milhões de linhas (uma por doação).
SELECT
    ano,
    tipo_eleicao,
    sigla_uf,
    id_municipio,
    cargo,
    sequencial_candidato,
    fonte_receita,       -- fundo especial (FEFC), fundo partidário ou outros recursos
    origem_receita,      -- pessoas físicas, partido, recursos próprios, outros candidatos...
    natureza_receita,    -- financeiro ou estimável (bens e serviços)
    COUNT(*) AS n_receitas,
    SUM(valor_receita) AS valor
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano BETWEEN 2014 AND 2024
GROUP BY ano, tipo_eleicao, sigla_uf, id_municipio, cargo, sequencial_candidato,
         fonte_receita, origem_receita, natureza_receita

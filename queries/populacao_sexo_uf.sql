-- População residente por UF e sexo (Censo 2022), total e com 18 anos ou mais.
-- Agrupa também pela forma de declaração da idade, para o notebook conferir se há linhas de total.
SELECT
    SUBSTR(id_municipio, 1, 2) AS id_uf,
    sexo,
    forma_declaracao_idade,
    SUM(populacao) AS populacao,
    SUM(IF(idade_anos >= 18, populacao, 0)) AS populacao_18_mais
FROM `basedosdados.br_ibge_censo_2022.populacao_idade_sexo`
GROUP BY id_uf, sexo, forma_declaracao_idade

-- Eleitorado por ano, UF e gênero (perfil do eleitorado do TSE).
SELECT
    ano,
    sigla_uf,
    genero,
    SUM(SAFE_CAST(eleitores AS INT64)) AS eleitores
FROM `basedosdados.br_tse_eleicoes.perfil_eleitorado_municipio_zona`
WHERE ano BETWEEN 2002 AND 2024
GROUP BY ano, sigla_uf, genero

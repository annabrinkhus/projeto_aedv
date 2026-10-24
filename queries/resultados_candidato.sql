SELECT
    c.ano, c.tipo_eleicao, c.cargo, c.sigla_uf, c.id_municipio,
    c.sigla_partido, c.genero, c.situacao, c.sequencial,
    r.turno, r.resultado, r.votos
FROM `basedosdados.br_tse_eleicoes.candidatos` AS c
LEFT JOIN `basedosdados.br_tse_eleicoes.resultados_candidato` AS r
    ON  c.ano = r.ano
    AND c.tipo_eleicao = r.tipo_eleicao
    AND c.sequencial = r.sequencial_candidato
    AND c.sigla_uf IS NOT DISTINCT FROM r.sigla_uf
    AND c.id_municipio IS NOT DISTINCT FROM r.id_municipio
WHERE c.ano BETWEEN 2002 AND 2024
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY c.ano, c.tipo_eleicao, c.sigla_uf, c.id_municipio, c.cargo, c.sequencial
    ORDER BY r.turno DESC
) = 1

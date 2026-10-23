  SELECT
    dados.ano as ano,
    dados.turno as turno,
    dados.tipo_eleicao as tipo_eleicao,
    dados.sigla_uf AS sigla_uf,
    diretorio_sigla_uf.nome AS sigla_uf_nome,
    dados.id_municipio AS id_municipio,
    diretorio_id_municipio.nome AS id_municipio_nome,
    dados.cargo as cargo,
    dados.sequencial_candidato as sequencial_candidato,
    dados.numero_candidato as numero_candidato,
    dados.nome_candidato as nome_candidato,
    dados.resultado as resultado,
    dados.votos as votos
FROM `basedosdados.br_tse_eleicoes.resultados_candidato` AS dados
LEFT JOIN (SELECT DISTINCT sigla,nome  FROM `basedosdados.br_bd_diretorios_brasil.uf`) AS diretorio_sigla_uf
    ON dados.sigla_uf = diretorio_sigla_uf.sigla
LEFT JOIN (SELECT DISTINCT id_municipio,nome  FROM `basedosdados.br_bd_diretorios_brasil.municipio`) AS diretorio_id_municipio
    ON dados.id_municipio = diretorio_id_municipio.id_municipio
WHERE dados.ano BETWEEN 2002 AND 2024
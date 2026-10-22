SELECT
    dados.ano as ano,
    dados.id_eleicao as id_eleicao,
    dados.tipo_eleicao as tipo_eleicao,
    dados.data_eleicao as data_eleicao,
    dados.sigla_uf AS sigla_uf,
    diretorio_sigla_uf.nome AS sigla_uf_nome,
    dados.id_municipio AS id_municipio,
    diretorio_id_municipio.nome AS id_municipio_nome,
    dados.id_municipio_tse AS id_municipio_tse,
    diretorio_id_municipio_tse.nome AS id_municipio_tse_nome,
    dados.numero as numero,
    dados.nome as nome,
    dados.nome_urna as nome_urna,
    dados.numero_partido as numero_partido,
    dados.sigla_partido as sigla_partido,
    dados.cargo as cargo,
    dados.situacao as situacao,
    dados.idade as idade,
    dados.genero as genero,
    dados.instrucao as instrucao,
    dados.ocupacao as ocupacao,
    dados.sigla_uf_nascimento as sigla_uf_nascimento,
    dados.raca as raca
FROM `basedosdados.br_tse_eleicoes.candidatos` AS dados
LEFT JOIN (SELECT DISTINCT sigla,nome  FROM `basedosdados.br_bd_diretorios_brasil.uf`) AS diretorio_sigla_uf
    ON dados.sigla_uf = diretorio_sigla_uf.sigla
LEFT JOIN (SELECT DISTINCT id_municipio,nome  FROM `basedosdados.br_bd_diretorios_brasil.municipio`) AS diretorio_id_municipio
    ON dados.id_municipio = diretorio_id_municipio.id_municipio
LEFT JOIN (SELECT DISTINCT id_municipio_tse,nome  FROM `basedosdados.br_bd_diretorios_brasil.municipio`) AS diretorio_id_municipio_tse
    ON dados.id_municipio_tse = diretorio_id_municipio_tse.id_municipio_tse
WHERE dados.ano >= 2002
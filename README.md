# Gênero e representação política no Brasil

Projeto final da disciplina Análise Exploratória de Dados e Visualização (FGV EMAp, 2026.2).

**Integrantes:** Anna Carolina Medeiros Brinkhus, Bruna Holanda Barbosa Nogueira e Pedro Cabús de Oliveira.

## Sobre o projeto

Segundo o TSE, as mulheres são 52,8% do eleitorado brasileiro, mas ocupam fração bem menor dos cargos eletivos.
Este projeto investiga a evolução da participação feminina nas eleições brasileiras e a relaciona à política de cotas de gênero.

Perguntas de domínio:

1. Como evoluiu a proporção de candidaturas femininas desde a política de cotas?
2. Essa proporção se traduz em mulheres eleitas?
3. Como a participação de candidatas e de eleitas varia entre partidos, estados e municípios?
4. Há diferença no financiamento de campanha entre candidatos e candidatas?
5. Candidaturas que parecem "para cumprir cota" mudaram ao longo do tempo?
6. Como se compara a composição da Câmara com a população?

## Dados

| Fonte | O que usamos | Status |
|---|---|---|
| TSE, via [Base dos Dados](https://basedosdados.org) (`br_tse_eleicoes`) | Candidaturas, resultados, prestação de contas | Candidaturas baixadas; resultados e financiamento em andamento |
| [Câmara dos Deputados](https://dadosabertos.camara.leg.br) | Composição da Casa por gênero e partido | A fazer |
| [IBGE/SIDRA](https://sidra.ibge.gov.br) | População por sexo, UF e município | A fazer |

Recorte: eleições gerais de 2002 a 2022 e municipais de 2004 a 2024. Os dados de financiamento são consistentes a partir de 2014,
e a cor/raça só consta a partir desse ano.

## Estrutura do repositório

```
├── notebooks/
│   ├── download.ipynb   # baixa os dados do BigQuery e salva em data/
│   └── artigo.ipynb        # análise em formato de artigo
├── queries/                # consultas SQL usadas
├── data/                   # arquivos locais (não versionados)
├── requirements.txt
└── README.md
```

## Como reproduzir

1. Instale as dependências:
```bash
   pip install -r requirements.txt
```
2. Crie um projeto no [Google Cloud](https://console.cloud.google.com) e anote o ID do projeto.
3. Em `notebooks/download.ipynb`, troque `billing_id` pelo ID do seu projeto e rode todas as células.
   Na primeira execução, o navegador pede login no Google.
   Isso cria os arquivos em `data/` (a pasta não vai para o GitHub por causa do tamanho).
4. Abra `notebooks/artigo.ipynb` e rode as células em ordem.

## Status

- [x] Proposta (Marco 1)
- [x] Download das candidaturas (2002 em diante)
- [ ] Download de resultados e financiamento
- [ ] Câmara dos Deputados e IBGE
- [ ] Entrega intermediária (29/10)
- [ ] Entrega final

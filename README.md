# Gênero e representação política no Brasil

**Candidaturas e representação feminina na política brasileira (2002–2024)**

Projeto final da disciplina Análise Exploratória de Dados e Visualização (FGV EMAp, 2026.2).

**Integrantes:** Anna Carolina Medeiros Brinkhus, Bruna Holanda Barbosa Nogueira e Pedro Cabús de Oliveira.

## Ver o artigo
- **Versão ipynb:** [`notebooks/artigo.ipynb`](notebooks/artigo.ipynb) (sem gráficos)
- **Versão HTML:** [`notebooks/artigo.html`](notebooks/artigo.html) (baixe e abra no navegador)

## Sobre o projeto

As mulheres são 52,7% do eleitorado brasileiro (TSE, 2022), mas foram 17,7% dos deputados federais eleitos em 2022. Desde 2009, cada partido deve preencher ao menos 30% das listas de candidaturas proporcionais com cada sexo, e desde 2018 ao menos 30% do Fundo Eleitoral vai para candidatas. O projeto acompanha a participação feminina ao longo do processo eleitoral e a relaciona a essas regras.

Perguntas de domínio:

1. Como evoluiu a proporção de candidaturas femininas desde a política de cotas?
2. Essa proporção se traduz em mulheres eleitas?
3. Como a participação de candidatas e de eleitas varia entre partidos, estados e municípios?
4. Há diferença no financiamento de campanha entre candidatos e candidatas?
5. Candidaturas que parecem "para cumprir cota" mudaram ao longo do tempo?
6. Como se compara a composição da Câmara com a população?

## Principais achados

- As candidatas a deputado passaram de 12–15% (2002 e 2006) para mais de 30% em 2014; para vereador, de 22% para 32,6% em 2012.
- As eleitas cresceram bem menos: as deputadas federais foram de 8,2% (2002) para 17,7% (2022), e em todas as eleições uma candidata teve menos chance de se eleger que um candidato.
- Antes do piso do Fundo Eleitoral, o dinheiro era muito desigual (em 2014, 9,8% dos recursos para 29,4% das candidatas a deputada federal); depois, ficou próximo, mas as candidatas seguem se elegendo menos com arrecadação parecida.
- Em 2012 e 2016, quase 90% das candidaturas a vereador com zero votos eram de mulheres.
- A Câmara eleita em 2022 teve 91 deputadas; com a proporção de mulheres da população de cada estado, seriam cerca de 264.

## Dados

| Fonte | O que usamos | Período |
|---|---|---|
| TSE, via [Base dos Dados](https://basedosdados.org) (`br_tse_eleicoes`) | Candidaturas e resultados; receitas de campanha (agregadas no BigQuery por candidatura e fonte); eleitorado por gênero | 2002–2024 (receitas: 2014–2024) |
| IBGE, via Base dos Dados (`br_ibge_censo_2022`) | População por UF e sexo | 2022 |
| [Câmara dos Deputados](https://dadosabertos.camara.leg.br) (API) | Quem exerceu mandato, por legislatura, gênero, UF e partido | 2003–2027 |
| [IBGE, API de malhas](https://servicodados.ibge.gov.br/api/docs/malhas) | Contorno das UFs para o mapa | — |

Recorte: eleições ordinárias, gerais de 2002 a 2022 e municipais de 2004 a 2024. As decisões de limpeza estão nas seções 2.2 e 2.5 do artigo.

## Estrutura do repositório

```
├── notebooks/
│   ├── download.ipynb          # baixa os dados (BigQuery, APIs) e salva em data/
│   ├── artigo.ipynb            # análise em formato de artigo
│   ├── artigo.html             # artigo exportado, com gráficos interativos
│   └── questoes_individuais/   # notebooks usados para desenvolver cada questão
├── queries/                    # consultas SQL usadas no download
├── data/                       # arquivos gerados (não versionados)
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
   Na primeira execução, o navegador pede login no Google. Os arquivos são salvos em `data/`.
4. Abra `notebooks/artigo.ipynb` e rode as células em ordem. A seção 2.5 lê a tabela completa de candidaturas (2,9 milhões de linhas), gera `data/candidaturas.parquet` e é a etapa que mais usa memória; as questões leem esse arquivo.
